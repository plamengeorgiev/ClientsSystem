using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientSystem
{
    public partial class CarrierAccessories : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystemContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ClientSystem.Models.CarrierAccessory> CarrierAccessoriesGrid_GetData()
        {
            return dbContext.CarrierAccessories;
        }

        public void CarrierAccessoriesGrid_UpdateItem(int id)
        {
            ClientSystem.Models.CarrierAccessory item = null;
            item = dbContext.CarrierAccessories.Find(id);
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

        public void CarrierAccessoriesGrid_DeleteItem(int id)
        {
            var item = dbContext.CarrierAccessories.Find(id);
            dbContext.CarrierAccessories.Remove(item);
            dbContext.SaveChanges();
            Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item Successfully Deleted!");
        }
    }
}