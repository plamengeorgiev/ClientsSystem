namespace ClientSystem.Migrations
{
    using ClientSystem.Models;
    using ClientSystem.Models.Enumerations;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<ClientSystem.Models.ClientSystemContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
            Database.SetInitializer(new ClientSystemDatabaseInitializer());
        }

        protected override void Seed(ClientSystemContext context)
        {

            GetCarrierBrands().ForEach(b => context.CarrierBrands.Add(b));
            GetCarrierRecords().ForEach(r => context.CarrierRecords.Add(r));
            GetCarrierPrints().ForEach(p => context.CarrierPrints.Add(p));
            GetCarrierCovers().ForEach(c => context.CarrierCovers.Add(c));
            GetCarrierBoxes().ForEach(b => context.CarrierBoxes.Add(b));
            GetCarrierAccessories().ForEach(a => context.CarrierAccessories.Add(a));


        }

        private static List<CarrierBrand> GetCarrierBrands()
        {
            var brands = new List<CarrierBrand>()
            {
                new CarrierBrand(1,"CD-R ����� ���� (700MB)", CarrierType.CD, new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBrand(2,"CD-R ������ ���� (700MB)", CarrierType.CD, new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBrand(3,"CD-R ����� ���� (700MB)", CarrierType.CD, new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBrand(4,"CD-mini 8�� (210MB)", CarrierType.CD, new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBrand(5,"CD ��� ������� (50MB)", CarrierType.CD, new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBrand(6,"DVD-R ����� ���� (4,7GB)", CarrierType.DVD, new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBrand(7,"DVD-R ������ ���� (4,7GB)", CarrierType.DVD, new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBrand(8,"DVD-R ����� ���� (4,7GB)", CarrierType.DVD, new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBrand(9,"DVD-���� 8 �� (1,4GB)", CarrierType.DVD, new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
            };

            return brands;
        }

        private static List<CarrierRecord> GetCarrierRecords()
        {
            var records = new List<CarrierRecord>()
            {
                new CarrierRecord(1,"����� �� Data CD(700MB)", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierRecord(2,"����� �� Audio CD(700MB)", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierRecord(3,"����� �� mini CD(210MB)", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierRecord(4,"����� �� CD ������� (50MB)", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierRecord(5,"����� �� DVD  (4,7GB)", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierRecord(6,"����� �� Mini DVD  (1,4GB)", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m})
            };
            return records;
        }

        private static List<CarrierPrint> GetCarrierPrints()
        {
            var prints = new List<CarrierPrint>()
            {
                new CarrierPrint(1,"����������� ����� ����� ���������� CD/DVD", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierPrint(2,"���� ������ � ���� �� ��� ��� ����� ���������� CD/DVD", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierPrint(3,"����� ����� CD-mini/DVD-mini", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierPrint(4,"����� ����� CD-�������", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m})
            };
            return prints;
        }

        private static List<CarrierCover> GetCarrierCovers()
        {
            var covers = new List<CarrierCover>(){
            new CarrierCover(1,"��� ������� ����", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
            new CarrierCover(2,"��������� �������������� ����", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
            new CarrierCover(3,"�������� ���� ��� ������", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m})
            };
            return covers;
        }

        private static List<CarrierBox> GetCarrierBoxes()
        {
            var boxes = new List<CarrierBox>()
            {
                new CarrierBox(1,"�������� �� ��������� �������, ����������� ����������� �����", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBox(2,"�������� �� ��������� �������, ���������� ����������� �����", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierBox(3,"�������� �� ����������� �����, ����������� ����������� �����", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m})
            };
            return boxes;
        }

        private static List<CarrierAccessory> GetCarrierAccessories()
        {
            var accessories = new List<CarrierAccessory>()
            {
                new CarrierAccessory(1,"�������� 1", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierAccessory(2,"�������� 2", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m}),
                new CarrierAccessory(3,"�������� 3", new decimal[]{0.40m, 0.35m, 0.30m, 0.28m, 0.26m, 0.24m, 0.22m})
            };
            return accessories;
        }
    }
}
