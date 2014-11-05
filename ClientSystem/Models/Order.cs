using ClientSystem.Models.Enumerations;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace ClientSystem.Models
{
    public class Order
    {

        //[ScaffoldColumn(false)]
        public int Id { get; set; }

        public string FirmName { get; set; }

        public string ContactName { get; set; }

        public string MobilePhoneOne { get; set; }

        public string MobilePhoneTwo { get; set; }

        public string Email { get; set; }

        public string InvoiceName { get; set; }

        public string DeliveryAddress { get; set; }

        public DateTime Date { get; set; }

        public string DiscName { get; set; }

        public int NumberOfCopies { get; set; }

        public CarrierType Carrier { get; set; }

        public int? CarrierBrandId { get; set; }

        public virtual CarrierBrand CarrierBrand { get; set; }

        public int? CarrierRecordId { get; set; }

        public virtual CarrierRecord CarrierRecord { get; set; }

        public int? CarrierPrintId { get; set; }

        public virtual CarrierPrint CarrierPrint { get; set; }

        public bool Varnishing { get; set; }

        public int? CarrierBoxId { get; set; }

        public virtual CarrierBox CarrierBox { get; set; }

        public int? CarrierCoverId { get; set; }

        public virtual CarrierCover CarrierCover { get; set; }

        public int? CarrierAccessoryId { get; set; }

        public virtual CarrierAccessory CarrierAccessory { get; set; }

        public string AdditionalInformation { get; set; }

        public bool Delivery { get; set; }

        public PaymentType PaymentType { get; set; }

        public bool Proforma { get; set; }

        public decimal? Advance { get; set; }

        public decimal? Surcharge { get; set; }

        public decimal SingleDiscPrice { get; set; }

        public decimal TotalPrice { get; set; }
    }
}
