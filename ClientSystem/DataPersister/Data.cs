using ClientSystem.Models;
using ClientSystem.Models.Enumerations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClientSystem.DataPersister
{
    public class Data
    {
        ClientSystemContext dbContext = new ClientSystemContext();

        public IQueryable<CarrierType> GetCarrierTypes()
        {
            return new List<CarrierType>() { CarrierType.CD, CarrierType.DVD }.AsQueryable();
        }
        public IQueryable<PaymentType> GetPaymentTypes()
        {
            return new List<PaymentType>() { PaymentType.Cash, PaymentType.BankTransaction }.AsQueryable();
        }
        public IQueryable<CarrierBrand> GetCarrierBrands()
        {
            IQueryable<CarrierBrand> query = dbContext.CarrierBrands;
            return query;
        }
        public IQueryable<CarrierRecord> GetCarrierRecords()
        {
            IQueryable<CarrierRecord> query = dbContext.CarrierRecords;
            return query;
        }
        public IQueryable<CarrierAccessory> GetCarrierAccessories()
        {
            IQueryable<CarrierAccessory> query = dbContext.CarrierAccessories;
            return query;
        }
        public IQueryable<CarrierBox> GetCarrierBoxes()
        {
            IQueryable<CarrierBox> query = dbContext.CarrierBoxes;
            return query;
        }
        public IQueryable<CarrierPrint> GetCarrierPrints()
        {
            IQueryable<CarrierPrint> query = dbContext.CarrierPrints;
            return query;
        }

        public IQueryable<CarrierCover> GetCarrierCovers()
        {
            IQueryable<CarrierCover> query = dbContext.CarrierCovers;
            return query;
        }
    }
}