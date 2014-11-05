using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientSystem
{
    public partial class AddCarrierRecords : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystem.Models.ClientSystemContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void addCarrierRecord_InsertItem()
        {
            var item = new ClientSystem.Models.CarrierRecord();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                dbContext.CarrierRecords.Add(item);
                dbContext.SaveChanges();
                Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item succesfully added");
            }
            else
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Wrong input");
            }
        }

        protected void addCarrierRecord_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Error_Handler_Control.ErrorSuccessNotifier.AddInfoMessage("Added");
            Response.Redirect("~/CarrierRecords");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CarrierRecords");
        }
    }
}