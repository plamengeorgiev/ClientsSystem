using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientSystem
{

    public partial class AddCarrierBrand : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystem.Models.ClientSystemContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void addCarrierBrand_InsertItem()
        {
            var item = new ClientSystem.Models.CarrierBrand();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                dbContext.CarrierBrands.Add(item);
                dbContext.SaveChanges();
                Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item succesfully added");
            }
            else
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Wrong input");
            }
        }

        protected void addCarrierBrand_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/CarrierBrands");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CarrierBrands");
        }
    }
}