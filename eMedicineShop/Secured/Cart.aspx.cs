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
    public partial class Cart : System.Web.UI.Page
    {
        decimal total = 0;
        MedicineShopDbContext db = new MedicineShopDbContext();
        ApplicationUserManager manager;
        ApplicationUser user;
        Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            user = manager.FindByName(Context.User.Identity.Name);
            customer = db.Customers.First(c => c.UserId == user.Id);
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {


                int medicineId = int.Parse(Request.QueryString["id"]);
                if (db.CartItems.Any(c => c.CustomerId == customer.CustomerId && c.MedicineId == medicineId))
                {
                    var item = db.CartItems.First(c => c.CustomerId == customer.CustomerId && c.MedicineId == medicineId);
                    item.Quantity++;
                }
                else
                {
                    //var item = new CartItem { CustomerId = customer.CustomerId, MedicineId= medicineId, Quantity = 1 };
                    //db.CartItems.Add(item);
                    var item = new CartItem { CustomerId = customer.CustomerId, MedicineId = medicineId, Quantity = 1 };
                    db.CartItems.Add(item);
                }
                db.SaveChanges();
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<eMedicineShop.Models.CartItemViewModel> cartGrid_GetData()
        {
            var query = db.CartItems.Where(item => item.CustomerId == customer.CustomerId).Select(item => new CartItemViewModel { CartItemId = item.CartItemId, CustomerId = item.CartItemId, MedicineId = item.MedicineId, Quantity = item.Quantity }).ToList();
            foreach (var x in query)
            {
                var product = db.Medicines.First(p => p.MedicineId == x.MedicineId);
                x.MedicineName = product.MedicineName;
                x.UnitPrice = product.UnitPrice;
                x.Amount = x.Quantity * product.UnitPrice;
            }
            return query.AsQueryable();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void cartGrid_UpdateItem(int CartItemId)
        {
            eMedicineShop.Models.CartItemViewModel item = null;
            item = new CartItemViewModel { CartItemId = CartItemId };
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", CartItemId));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                var ci = db.CartItems.Find(CartItemId);
                ci.Quantity = item.Quantity;
                db.SaveChanges();

            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void cartGrid_DeleteItem(int CartItemId)
        {
            var ci = db.CartItems.Find(CartItemId);
            if (ci == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", CartItemId));
                return;
            }
            db.CartItems.Remove(ci);
            db.SaveChanges();
        }


        protected void cartGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal amt = decimal.Parse(DataBinder.Eval(e.Row.DataItem, "Amount").ToString());
                total += amt;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Text = total.ToString("0.00");
            }
        }
    }
}