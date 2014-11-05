using ClientSystem.DataPersister;
using ClientSystem.Models;
using ClientSystem.Models.Enumerations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientSystem
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystemContext();
        Data dbData = new Data();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public IQueryable<CarrierType> GetCarrierTypes()
        {
            return dbData.GetCarrierTypes();
        }
        public IQueryable<PaymentType> GetPaymentTypes()
        {
            return new List<PaymentType>() { PaymentType.Cash, PaymentType.BankTransaction }.AsQueryable();
        }
        public IQueryable<CarrierBrand> GetCarrierBrands()
        {
            return dbData.GetCarrierBrands();
        }
        public IQueryable<CarrierRecord> GetCarrierRecords()
        {
            return dbData.GetCarrierRecords();
        }
        public IQueryable<CarrierAccessory> GetCarrierAccessories()
        {
            return dbData.GetCarrierAccessories();
        }
        public IQueryable<CarrierBox> GetCarrierBoxes()
        {
            return dbData.GetCarrierBoxes();
        }
        public IQueryable<CarrierPrint> GetCarrierPrints()
        {
            return dbData.GetCarrierPrints();
        }
        public IQueryable<CarrierCover> GetCarrierCovers()
        {
            return dbData.GetCarrierCovers();
        }

        public ClientSystem.Models.Order FormViewOrderDetails_GetItem([QueryString] int? id)
        {
            if (id == null)
            {
                Response.Redirect("~/Orders");
            }

            var query = dbContext.Orders.Where(o => o.Id == id).First();
            return query;
        }

        public void FormViewOrderDetails_UpdateItem([QueryString] int? id)
        {
            ClientSystem.Models.Order item = null;
            item = dbContext.Orders.Find(id);
            if (item == null)
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Item Not Found!");
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                dbContext.SaveChanges();
                Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item Updated Successfully");
            }
        }
    }
}