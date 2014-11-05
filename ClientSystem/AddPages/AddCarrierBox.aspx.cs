using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientSystem
{
    public partial class AddCarrierBox : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystem.Models.ClientSystemContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void addCarrierBox_InsertItem()
        {
            var item = new ClientSystem.Models.CarrierBox();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                dbContext.CarrierBoxes.Add(item);
                dbContext.SaveChanges();
                Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item succesfully added");
            }
            else
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Wrong input");
            }
        }

        protected void addCarrierBox_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/CarrierBoxes");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CarrierBoxes");
        }
    }
}