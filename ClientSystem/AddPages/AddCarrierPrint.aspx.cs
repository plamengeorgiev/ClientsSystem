using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientSystem
{
    public partial class AddCarrierPrint : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystem.Models.ClientSystemContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void addCarrierPrint_InsertItem()
        {
            var item = new ClientSystem.Models.CarrierPrint();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                dbContext.CarrierPrints.Add(item);
                dbContext.SaveChanges();
                Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item succesfully added");
            }
            else
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Wrong input");
            }
        }

        protected void addCarrierPrint_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Error_Handler_Control.ErrorSuccessNotifier.AddInfoMessage("Added");
            Response.Redirect("~/CarrierPrints");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CarrierPrints");
        }
    }
}