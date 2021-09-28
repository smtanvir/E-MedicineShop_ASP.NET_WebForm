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
    public partial class ConfirmOrder : System.Web.UI.Page
    {
        MedicineShopDbContext  db = new MedicineShopDbContext();
        ApplicationUserManager manager;
        ApplicationUser user;
        Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            user = manager.FindByName(Context.User.Identity.Name);
            customer = db.Customers.First(c => c.UserId == user.Id);
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable BillInfo_GetData()
        {
            return db.Customers.Where(c => c.UserId == user.Id);
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable DetailsInfo_GetData()
        {
            var query = db.CartItems.Where(item => item.CustomerId == customer.CustomerId).Select(item => new CartItemViewModel { CartItemId = item.CartItemId, CustomerId = item.CartItemId, MedicineId = item.MedicineId, Quantity = item.Quantity }).ToList();
            foreach (var x in query)
            {
                var medicine = db.Medicines.First(mc => mc.MedicineId == x.MedicineId);
                x.MedicineName = medicine.MedicineName;
                x.UnitPrice = medicine.UnitPrice;
                x.Amount = x.Quantity * medicine.UnitPrice;
            }
            return query.AsQueryable();
        }
    }
}