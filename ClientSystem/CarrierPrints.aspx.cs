using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientSystem
{
    public partial class CarrierPrints : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystemContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ClientSystem.Models.CarrierPrint> CarrierPrintsGrid_GetData()
        {
            return dbContext.CarrierPrints;
        }

        public void CarrierPrintsGrid_UpdateItem(int id)
        {
            ClientSystem.Models.CarrierPrint item = null;
            item = dbContext.CarrierPrints.Find(id);
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

        public void CarrierPrintsGrid_DeleteItem(int id)
        {
            var item = dbContext.CarrierPrints.Find(id);
            dbContext.CarrierPrints.Remove(item);
            dbContext.SaveChanges();
            Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item Successfully Deleted!");
        }
    }
}