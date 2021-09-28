using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using eMedicineShop.Models;

namespace eMedicineShop.Admin
{
    public partial class CategoryWiseMedicines : System.Web.UI.Page
    {
        MedicineShopDbContext db = new MedicineShopDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable ListView1_GetData([QueryString]int c)
        {
            return db.Medicines.Where(mc => mc.CategoryId == c);
        }
    }
}