using System.Data.Entity;

namespace ClientSystem.Models
{
    public class ClientSystemContext : DbContext
    {
        public ClientSystemContext()
            : base("ClientSystemData")
    {
    }
    public DbSet<CarrierBrand> CarrierBrands { get; set; }
    public DbSet<CarrierRecord> CarrierRecords { get; set; }
    public DbSet<CarrierPrint> CarrierPrints { get; set; }
    public DbSet<CarrierBox> CarrierBoxes { get; set; }
    public DbSet<CarrierCover> CarrierCovers { get; set; }
    public DbSet<CarrierAccessory> CarrierAccessories { get; set; }

    public DbSet<Client> Clients { get; set; }
    public DbSet<Order> Orders { get; set; }
    }
}