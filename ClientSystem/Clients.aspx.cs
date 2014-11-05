using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientSystem
{
    public partial class ClientsList : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystemContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ClientSystem.Models.Client> clientsGrid_GetData()
        {
            var searchParam = Request.Params["q"];
            if (searchParam == null)
            {
                var query = dbContext.Clients;
                return query;
            }
            var clients = this.dbContext.Clients.Where(c => c.ContactName.Contains(searchParam) || c.FirmName.Contains(searchParam));
            return clients;
            
        }

        public void clientsGrid_UpdateItem(int id)
        {
            ClientSystem.Models.Client item = null;
            item = dbContext.Clients.Find(id);
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

        protected void LinkButtonSearch_Click(object sender, EventArgs e)
        {
            string queryParam = string.Format("?q={0}", this.TextBoxSearchParam.Text);
            Response.Redirect("~/Clients" + queryParam);
        }
    }
}