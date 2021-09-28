using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eMedicineShop.Models;

namespace eMedicineShop.Admin
{
    
    public partial class CreateMedicine : System.Web.UI.Page
    {
        MedicineShopDbContext db = new MedicineShopDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void MedicineInsertView_InsertItem()
        {
            var item = new eMedicineShop.Models.Medicine();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                db.Medicines.Add(item);
                db.SaveChanges();
                Response.Redirect("Medicines.aspx");

            }
        }

        protected void MedicineInsertView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload f = MedicineInsertView.FindControl("PictureFileUpload") as FileUpload;
            if (f.HasFile)
            {
                if (f.PostedFile.ContentLength > 0)
                {
                    f.SaveAs(Server.MapPath("~/Images/" + f.FileName));
                    e.Values["PictureFile"] = f.FileName;
                }
            }
            else
            {
                e.Values["PictureFile"] = "NoPicture.jpg";
            }
        }
    }
}