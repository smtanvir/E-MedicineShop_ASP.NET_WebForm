using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eMedicineShop.Models;

namespace eMedicineShop.Admin
{
    public partial class Medicines : System.Web.UI.Page
    {
        MedicineShopDbContext db = new MedicineShopDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<eMedicineShop.Models.Medicine> MedicineView_GetData()
        {
            return db.Medicines;
                 
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void MedicineView_DeleteItem(int medicineId)
        {
          eMedicineShop.Models.Medicine item = null;
            item = db.Medicines.Find(medicineId);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", medicineId));
                return;
            }

            db.Medicines.Remove(item);
            db.SaveChanges();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void MedicineView_UpdateItem(int medicineId)
        {
            eMedicineShop.Models.Medicine item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            item = db.Medicines.Find(medicineId);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", medicineId));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                
                db.SaveChanges();
            }
        }
    }
}