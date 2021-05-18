using BLL_BackEnd.Models;
using BLL_BackEnd.Models.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Westwind.BusinessObjects;
using Westwind.Utilities;

namespace BLL_BackEnd{
    public class InventariosRepository : EntityFrameworkRepository<PruebaContext, Inventarios>{
        public InventariosRepository(PruebaContext context)
            : base(context)
        { }

        protected override void OnAfterCreated(Inventarios entity){
            base.OnAfterCreated(entity);
        }

        /// <summary>
        /// Loads and individual Inventarios.
        /// 
        /// Implementation is custom not using base.Load()
        /// in order to include related entities
        /// </summary>
        /// <param name="objId">Inventarios Id</param>
        /// <returns></returns>
        public override async Task<Inventarios> Load(object InventariosId){
            Inventarios Inventarios = null;
            try{
                int id = (int)InventariosId;
                Inventarios = await Context.Inventarios
                .FirstOrDefaultAsync(m => m.IdItem == id);
                if (Inventarios != null){
                    OnAfterLoaded(Inventarios);
                }
            }
            catch (InvalidOperationException){
                // Handles errors where an invalid Id was passed, but SQL is valid
                SetError("Couldn't load Inventarios - invalid Inventarios id specified.");
                return null;
            }
            catch (Exception ex){
                // handles Sql errors
                SetError(ex);
            }
            return Inventarios;
        }

        public async Task<List<Inventarios>> GetAll(){
            IQueryable<Inventarios> Inventarios = Context.Inventarios
                .OrderBy(inv => inv.Descripcion);
            return await Inventarios.ToListAsync();
        }

        public async Task<List<Inventarios>> GetAllStockMin(){
            IQueryable<Inventarios> Inventarios = Context.Inventarios.Where(i=>i.CantidadStock<=i.StockMinimo).OrderBy(inv => inv.Descripcion);
            return await Inventarios.ToListAsync();
        }

        public List<dynamic> GetAllVentasXItem(int Periodo){            
            IQueryable<dynamic> Inventarios = Context.Inventarios
            .Join(Context.Detalle_Movimientos,
            i => new { IdItem = i.IdItem },
            m => new { IdItem = m.IdItem },
            (i, m) => new {
                Id_Movimiento = m.Id_Movimiento,
                IdItem = i.IdItem,
                CodigoItem = i.CodigoItem,
                Descripcion = i.Descripcion,
                CantidadStock = i.CantidadStock,
                StockMinimo = i.StockMinimo,
                FechaActualizacion = i.FechaActualizacion,
                Precio = i.Precio,
                Cantidad = m.Cantidad
            }).Join(Context.Movimientos,
            k=> new { IdMovimiento = k.Id_Movimiento },
            n=> new { IdMovimiento = n.Id_Movimiento },
            (k,n) => new { IdMovimiento = k.Id_Movimiento, Fecha = n.Fecha, Precio = k.Precio,Cantidad = k.Cantidad, Descripcion = k.Descripcion, IdItem = k.IdItem })
            .Where(h=>h.Fecha.Year == Periodo).OrderBy(t=>t.IdItem);
            List<dynamic> _Totales = new List<dynamic>();
            var _TtlItm = 0.0;
            Inventarios.ToList().ForEach(x => {
                var _Item = new { IdItem = x.IdItem, Descripcion = x.Descripcion, Total = x.Precio *  x.Cantidad };
                var _Qry = _Totales.FirstOrDefault(d => d.IdItem == x.IdItem);
                var _Idx = Array.IndexOf(_Totales.ToArray(), _Qry);
                if (_Qry == null){ 
                    _Totales.Add(_Item);
                    _TtlItm = _Item.Total;
                }
                else {
                    _TtlItm += _Item.Total;
                    _Totales.RemoveAt(_Idx); _Totales.Add(new { IdItem = x.IdItem, Descripcion = x.Descripcion, Total = _TtlItm }); }
            });
            return _Totales.ToList();
        }

        public async Task<List<Inventarios>> GetAllInventarios(int page = 0, int pageSize = 15){
            IQueryable<Inventarios> Inventarioss = Context.Inventarios
                .OrderBy(inv => inv.Descripcion);
            if (page > 0){
                Inventarioss = Inventarioss
                                .Skip((page - 1) * pageSize)
                                .Take(pageSize);
            }
            return await Inventarioss.ToListAsync();
        }

        /// <summary>
        /// This code is rather complex as EF7 can't work out
        /// the related entity updates for Inventarios, 
        /// so this code manually  updates Inventarios 
        /// from the saved entity using code.
        /// </summary>
        /// <param name="postedInventarios"></param>
        /// <returns></returns>
        public async Task<Inventarios> SaveInventarios(Inventarios postedInventarios){
            int id = postedInventarios.IdItem;
            Inventarios Inventarios;
            Inventarios = await Load(id);
            if (id < 1){
                Inventarios = Create();
                DataUtils.CopyObjectData(postedInventarios, Inventarios);
            }
            else{
                DataUtils.CopyObjectData(postedInventarios, Inventarios);
            }
            //now lets save it all
            if (!await SaveAsync()) return null;
            else
                return Inventarios;
        }

        public async Task<bool> DeleteInventarios(int id, bool noSaveChanges = false)
        {
            var Inventarios = await Context.Inventarios
                .FirstOrDefaultAsync(a => a.IdItem == id);

            if (Inventarios == null)
            {
                SetError("Invalid Inventarios id.");
                return false;
            }

            Context.Inventarios.Remove(Inventarios);


            if (!noSaveChanges)
            {
                var result = await SaveAsync();

                return result;
            }

            return false;
        }

        protected override bool OnValidate(Inventarios entity){
            if (entity == null){
                ValidationErrors.Add("No item was passed.");
                return false;
            }

            if (string.IsNullOrEmpty(entity.Descripcion))
                ValidationErrors.Add("Descripción del movimiento es requerido.", "Descripcion tipo de movimiento");
            else if (entity.CantidadStock < 5) ValidationErrors.Add("El total de unidades no puede ser inferior al minimo de existencias", "Cantidad en stock");
            else if (entity.StockMinimo < 5) ValidationErrors.Add("El minimo de existencias en stock no debe ser menor a 5", "Stock minimo");
            else if (entity.CodigoItem < 1) ValidationErrors.Add("El codigo de referencia debe ser mayor  1", "Codigo de Item");
            else if (Context.Inventarios.FirstOrDefault(i=>i.CodigoItem== entity.CodigoItem)!=null) ValidationErrors.Add("El Codigo de referencia del producto ya existe", "Codigo de Item");
            else if (entity.Precio < 10000 || entity.Precio > 9999999)
                ValidationErrors.Add("Longitud del valor total incorrecta");
            return ValidationErrors.Count < 1;
        }
    }
}
