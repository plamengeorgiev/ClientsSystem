using ClientSystem.DataPersister;
using ClientSystem.Models;
using ClientSystem.Models.Enumerations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ClientSystem
{
    public partial class AddOrder : System.Web.UI.Page
    {
        ClientSystemContext dbContext = new ClientSystem.Models.ClientSystemContext();
        Data dbData = new Data();

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public Client GetCurrentClient(string firmName)
        {

            if (firmName != null)
            {
                Client client = dbContext.Clients.Where(e => e.FirmName == firmName).FirstOrDefault();
                if (client != null)
                {
                    return client;
                }
            }
            return new Client();

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (FirmNameTextBox.Text != "")
            {
                var client = GetCurrentClient(FirmNameTextBox.Text);
                ContactName.Text = client.ContactName;
                MobilePhoneOne.Text = client.MobilePhoneOne;
                MobilePhoneTwo.Text = client.MobilePhoneTwo;
                Email.Text = client.Email;
                TextBoxDeliverAddress.Text = client.DeliveryAddress;
                TextBoxInvoiceName.Text = client.InvoiceName;
            }
        }

        public IQueryable<CarrierType> GetCarrierTypes()
        {
            return dbData.GetCarrierTypes();
        }
        public IQueryable<PaymentType> GetPaymentTypes()
        {
            return new List<PaymentType>() { PaymentType.Cash, PaymentType.BankTransaction }.AsQueryable();
        }
        public IQueryable<CarrierBrand> GetCarrierBrands()
        {
            return dbData.GetCarrierBrands();
            //IQueryable<CarrierBrand> query = dbContext.CarrierBrands;
            //return query;
        }
        public IQueryable<CarrierRecord> GetCarrierRecords()
        {
            return dbData.GetCarrierRecords();
        }
        public IQueryable<CarrierAccessory> GetCarrierAccessories()
        {
            return dbData.GetCarrierAccessories();
        }
        public IQueryable<CarrierBox> GetCarrierBoxes()
        {
            return dbData.GetCarrierBoxes();
        }
        public IQueryable<CarrierPrint> GetCarrierPrints()
        {
            return dbData.GetCarrierPrints();
        }
        public IQueryable<CarrierCover> GetCarrierCovers()
        {
            return dbData.GetCarrierCovers();
        }

        public void addOrderForm_InsertItem()
        {
            var item = new ClientSystem.Models.Order();
            TryUpdateModel(item);
            item.Date = DateTime.Now;
            item.FirmName = FirmNameTextBox.Text;
            item.ContactName = ContactName.Text;
            item.MobilePhoneOne = MobilePhoneOne.Text;
            item.MobilePhoneTwo = MobilePhoneTwo.Text;
            item.Email = Email.Text;
            item.DeliveryAddress = TextBoxDeliverAddress.Text;
            item.InvoiceName = TextBoxInvoiceName.Text;
            item.NumberOfCopies = int.Parse(NumberOfCopiesTextBox.Text);
            item.Carrier = DropDownListCarrierType.SelectedValue == "0" ? CarrierType.CD : CarrierType.DVD;

            
            item.CarrierBrandId = GetIndex(DropDownListCarrierBrands.SelectedValue);
            item.CarrierRecordId = GetIndex(DropDownListCarrierRecords.SelectedValue);
            item.CarrierPrintId = GetIndex(DropDownListCarrierPrints.SelectedValue);
            item.CarrierBoxId = GetIndex(DropDownListCarrierBoxes.SelectedValue);
            item.CarrierCoverId = GetIndex(DropDownListCarrierCovers.SelectedValue);
            item.CarrierAccessoryId = GetIndex(DropDownListCarrierAccessories.SelectedValue);
            item.SingleDiscPrice = Convert.ToDecimal(SingleDiscPrice.Text);
            item.TotalPrice = Convert.ToDecimal(TotalPrice.Text);
            if (ModelState.IsValid)
            {
                dbContext.Orders.Add(item);
                dbContext.SaveChanges();
                Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Item Successfully Added");
            }
            else
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Wrong input");
            }

            var currentClient = dbContext.Clients.Where(e => e.FirmName == FirmNameTextBox.Text).FirstOrDefault();

            if (currentClient == null)
            {
                Client newClient = new Client()

                {
                    FirmName = FirmNameTextBox.Text,
                    ContactName = ContactName.Text,
                    MobilePhoneOne = MobilePhoneOne.Text,
                    MobilePhoneTwo = MobilePhoneTwo.Text,
                    Email = Email.Text,
                    DeliveryAddress = TextBoxDeliverAddress.Text,
                    InvoiceName = TextBoxInvoiceName.Text

                };
                dbContext.Clients.Add(newClient);
                dbContext.SaveChanges();
            }
            else
            {
                var originalClient = dbContext.Clients.Find(currentClient.Id);

                if (originalClient != null)
                {
                    originalClient.ContactName = ContactName.Text;
                    originalClient.MobilePhoneOne = MobilePhoneOne.Text;
                    originalClient.MobilePhoneTwo = MobilePhoneTwo.Text;
                    originalClient.Email = Email.Text;
                    originalClient.DeliveryAddress = TextBoxDeliverAddress.Text;
                    originalClient.InvoiceName = TextBoxInvoiceName.Text;
                    dbContext.SaveChanges();
                }
            }
        }

        protected void addOrderForm_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/Orders");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Clients");
        }

        protected void CalculatePrices(object sender, EventArgs e)
        {

            if (NumberOfCopiesTextBox.Text != "")
            {
                var numberOfCopies = Convert.ToInt32(NumberOfCopiesTextBox.Text);

                var ddlCarrierBrand = DropDownListCarrierBrands.SelectedValue;
                if (ddlCarrierBrand != "")
                {
                    var item = dbContext.CarrierBrands.Find(int.Parse(ddlCarrierBrand));
                    TextBoxCarrierBrand.Text = item.GetPrice(numberOfCopies).ToString();
                    TextBoxCarrierBrand.Visible = true;
                }
                else { TextBoxCarrierBrand.Text = "0,00"; }

                var ddlCarrierRecord = DropDownListCarrierRecords.SelectedValue;
                if (ddlCarrierRecord != "")
                {
                    var item = dbContext.CarrierRecords.Find(int.Parse(ddlCarrierRecord));
                    TextBoxCarrierRecord.Text = item.GetPrice(numberOfCopies).ToString();
                    TextBoxCarrierRecord.Visible = true;
                }
                else { TextBoxCarrierRecord.Text = "0,00"; }

                var ddlCarrierPrint = DropDownListCarrierPrints.SelectedValue;
                if (ddlCarrierPrint != "")
                {
                    var item = dbContext.CarrierPrints.Find(int.Parse(ddlCarrierPrint));
                    TextBoxCarrierPrint.Text = item.GetPrice(numberOfCopies).ToString();
                    TextBoxCarrierPrint.Visible = true;
                }
                else { TextBoxCarrierPrint.Text = "0,00"; }

                var ddlCarrierBox = DropDownListCarrierBoxes.SelectedValue;
                if (ddlCarrierBox != "")
                {
                    var item = dbContext.CarrierBoxes.Find(int.Parse(ddlCarrierBox));
                    TextBoxCarrierBox.Text = item.GetPrice(numberOfCopies).ToString();
                    TextBoxCarrierBox.Visible = true;
                }
                else { TextBoxCarrierBox.Text = "0,00"; }

                var ddlCarrierCover = DropDownListCarrierCovers.SelectedValue;
                if (ddlCarrierCover != "")
                {
                    var item = dbContext.CarrierCovers.Find(int.Parse(ddlCarrierCover));
                    TextBoxCarrierCover.Text = item.GetPrice(numberOfCopies).ToString();
                    TextBoxCarrierCover.Visible = true;
                }
                else { TextBoxCarrierCover.Text = "0,00"; }


                var ddlCarrierAccessory = DropDownListCarrierAccessories.SelectedValue;
                if (ddlCarrierAccessory != "")
                {
                    var item = dbContext.CarrierAccessories.Find(int.Parse(ddlCarrierAccessory));
                    TextBoxCarrierAccessory.Text = item.GetPrice(numberOfCopies).ToString();
                    TextBoxCarrierAccessory.Visible = true;
                }
                else { TextBoxCarrierAccessory.Text = "0,00"; }

                CalculateSingleDiscPrice(null, new EventArgs());
            }
            
        }

        protected void CalculateSingleDiscPrice(object sender, EventArgs e)
        {
            var singleDisc = 0m;
            singleDisc += Convert.ToDecimal(TextBoxCarrierBrand.Text);
            singleDisc += Convert.ToDecimal(TextBoxCarrierRecord.Text);
            singleDisc += Convert.ToDecimal(TextBoxCarrierPrint.Text);
            singleDisc += Convert.ToDecimal(TextBoxCarrierBox.Text);
            singleDisc += Convert.ToDecimal(TextBoxCarrierCover.Text);
            singleDisc += Convert.ToDecimal(TextBoxCarrierAccessory.Text);

            SingleDiscPrice.Text = singleDisc.ToString();
            SingleDiscPrice.Visible = true;

            CalculateTotalPrice(null, new EventArgs());
        }

        protected void CalculateTotalPrice(object sender, EventArgs e)
        {
            TotalPrice.Text = (Convert.ToDecimal(SingleDiscPrice.Text) * Convert.ToInt32(NumberOfCopiesTextBox.Text)).ToString();
            TotalPrice.Visible = true;
        }

        protected int? GetIndex(string value)
        {
            int number;

            bool result = int.TryParse(value, out number);
            if (result)
            {
                return number;
            }
            return null;
        }
    }
}