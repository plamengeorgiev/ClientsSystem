using ClientSystem.Models.Enumerations;
using System.Collections.Generic;

namespace ClientSystem.Models
{
    public class CarrierBrand : Item
    {
        public CarrierBrand()
        {

        }
        public CarrierBrand(int id, string name, CarrierType carrierType, decimal[] prices)
        {
            this.Id = id;
            this.Name = name;
            this.CarrierType = carrierType;
            this.PriceCategory1 = prices[0];
            this.PriceCategory2 = prices[1];
            this.PriceCategory3 = prices[2];
            this.PriceCategory4 = prices[3];
            this.PriceCategory5 = prices[4];
            this.PriceCategory6 = prices[5];
            this.PriceCategory7 = prices[6];
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public CarrierType CarrierType { get; set; }

        public decimal PriceCategory1 { get; set; }
        public decimal PriceCategory2 { get; set; }
        public decimal PriceCategory3 { get; set; }
        public decimal PriceCategory4 { get; set; }
        public decimal PriceCategory5 { get; set; }
        public decimal PriceCategory6 { get; set; }
        public decimal PriceCategory7 { get; set; }

        public decimal GetPrice(int count)
        {
            return base.GetPrice(count, new decimal[]
                {
                this.PriceCategory1, 
                this.PriceCategory2,
                this.PriceCategory3,
                this.PriceCategory4,
                this.PriceCategory5,
                this.PriceCategory6,
                this.PriceCategory7,
                });
        }
    }
}
