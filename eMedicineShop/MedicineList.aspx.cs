using eMedicineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eMedicineShop
{
    public partial class MedicineList : System.Web.UI.Page
    {
        MedicineShopDbContext db = new MedicineShopDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IEnumerable<eMedicineShop.Models.Medicine> productRepeater_GetData([QueryString]int id)
        {
            return db.Medicines.Include("Category").Where(mc => mc.CategoryId == id);
        }
    }
}