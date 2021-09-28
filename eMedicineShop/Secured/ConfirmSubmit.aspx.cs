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
    public partial class ConfirmSubmit : System.Web.UI.Page
    {
        MedicineShopDbContext db = new MedicineShopDbContext();
        ApplicationUserManager manager;
        ApplicationUser user;
        Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {

            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            user = manager.FindByName(Context.User.Identity.Name);
            customer = db.Customers.First(c => c.UserId == user.Id);
            Order order = new Order { CustomerId = customer.CustomerId, OrderDate = DateTime.Now };
            db.Orders.Add(order);
            var cartitems = db.CartItems.Where(c => c.CustomerId == customer.CustomerId).ToList();
            foreach (var x in cartitems)
            {
                OrderItem oi = new OrderItem { MedicineId = x.MedicineId, Quantity = x.Quantity, Order = order };
                db.CartItems.Remove(x);
                db.OrderItems.Add(oi);
            }

            db.SaveChanges();
        }
    }
}