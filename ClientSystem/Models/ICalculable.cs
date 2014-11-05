using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClientSystem.Models
{
    public interface ICalculable
    {
        decimal GetPrice(int count, decimal[] array);
    }
}