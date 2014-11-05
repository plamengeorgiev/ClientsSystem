using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientSystem
{
    
    public partial class CarrierBrands : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystemContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ClientSystem.Models.CarrierBrand> CarrierBrandsGrid_GetData()
        {
            return dbContext.CarrierBrands;
        }

        public void CarrierBrandsGrid_UpdateItem(int id)
        {
            ClientSystem.Models.CarrierBrand item = null;
            item = dbContext.CarrierBrands.Find(id);
            if (item == null)
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Item Not Found!");
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                dbContext.SaveChanges();
                Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item Successfully Updated!");
            }
            else
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Wrong input");
            }
        }

        public void CarrierBrandsGrid_DeleteItem(int id)
        {
            var item = dbContext.CarrierBrands.Find(id);
            dbContext.CarrierBrands.Remove(item);
            dbContext.SaveChanges();
            Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item Successfully Deleted!");
        }
    }
}