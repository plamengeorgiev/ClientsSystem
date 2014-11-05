using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ClientSystem.Models
{
    public class Client
    {

        [ScaffoldColumn(false)]
        public int Id { get; set; }

        public string FirmName { get; set; }

        public string ContactName { get; set; }

        public string MobilePhoneOne { get; set; }

        public string MobilePhoneTwo { get; set; }

        public string Email { get; set; }

        public string InvoiceName { get; set; }

        public string DeliveryAddress { get; set; }
    }
}