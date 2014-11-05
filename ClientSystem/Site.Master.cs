using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClientSystem.Models;

namespace ClientSystem
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public IQueryable<Order> GetOrders()
        {
            var _db = new ClientSystem.Models.ClientSystemContext();
            IQueryable<Order> query = _db.Orders;
            return query;
        }
    }
}