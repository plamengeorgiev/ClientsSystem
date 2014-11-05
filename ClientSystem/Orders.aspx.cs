using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data.Entity;

namespace ClientSystem
{
    public partial class OrdersList : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystem.Models.ClientSystemContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Order> OrdersGrid_GetData()
        {
            var firmName = Request.Params["firm"];
            if (firmName != null)
            {
                return dbContext.Orders.Where(o => o.FirmName == firmName);
            }
            return dbContext.Orders;

        }

        public void OrdersGrid_UpdateItem(int id)
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
                Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item Successfully Updated!");
            }
            else
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Wrong input");
            }
        }
    }
}