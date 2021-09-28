using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eMedicineShop.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace eMedicineShop.Secured
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        MedicineShopDbContext db = new MedicineShopDbContext();
        ApplicationUserManager manager;
        ApplicationUser user;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.msg.Visible = false;
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            user = manager.FindByName(Context.User.Identity.Name);
            this.msg.Visible = false;
            if (!IsPostBack)
            {
                var customer = this.profileView_GetItem();
                this.CustomerNameTextBox.Text = customer.CustomerName;
                this.AddressTextBox.Text = customer.Address;
            }
        }
        public eMedicineShop.Models.Customer profileView_GetItem()
        {
            var customer = db.Customers.First(c => c.UserId == user.Id);
            return customer;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void profileView_UpdateItem(Customer c)
        {
            eMedicineShop.Models.Customer item = null;
            item = db.Customers.Find(c.CustomerId);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", c.CustomerId));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                db.SaveChanges();
                if (isComplete(item))
                {
                    Response.Redirect("~/Secured/confirmorder.aspx");

                }
                else
                {
                    this.msg.Visible = true;
                }
            }
        }
        private bool isComplete(Customer c)
        {
            return !string.IsNullOrEmpty(c.CustomerName) && !string.IsNullOrEmpty(c.Address) && !string.IsNullOrEmpty(c.CreditCardNumber);
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            eMedicineShop.Models.Customer item = null;
            item = this.profileView_GetItem();
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Customer was not found"));
                return;
            }

            if (ModelState.IsValid)
            {
                item.CustomerName = CustomerNameTextBox.Text;
                item.Address = AddressTextBox.Text;
                item.CreditCardNumber = CCNumberTextBox.Text;
                ///
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                db.SaveChanges();
                if (isComplete(item))
                {
                    Response.Redirect("~/Secured/confirmorder.aspx");

                }
                else
                {
                    this.msg.Visible = true;
                }
            }
        }
    }
}