using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClientSystem.Models
{
    public partial class Item : ICalculable
    {
        public virtual decimal GetPrice(int count, decimal[] array)
        {
            var priceCat = 1;
            if (5<count && count<100)
            {
                priceCat = 1;
            }
            if ( 100<=count && count<500)
            {
                priceCat = 2;
            }
            if (500 <=count && count < 1000)
            {
                priceCat = 3;
            }
            if (1000 <=count && count < 2000)
            {
                priceCat = 4;
            }
            if (2000 <= count && count < 3000)
            {
                priceCat = 5;
            }
            if (3000 <= count && count < 5000)
            {
                priceCat = 6;
            }
            if (5000 <= count)
            {
                priceCat = 7;
            }
            var price = array[priceCat - 1];
            return price;
        }
    }
}