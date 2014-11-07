using ClientSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace AutoCompleteExample
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class AutoComplete : System.Web.Services.WebService
    {
        [WebMethod]
        public List<string> GetFirmNames(string prefixText, int count)
        {
            ClientSystemContext dbContext = new ClientSystem.Models.ClientSystemContext();
            List<string> firmNames = dbContext.Clients.Where(c => c.FirmName.Contains(prefixText)).Select(c => c.FirmName).ToList<string>();
            return firmNames;
        }
    }
}
