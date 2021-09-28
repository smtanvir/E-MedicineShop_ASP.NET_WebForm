using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eMedicineShop
{
    public partial class EmailSend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            SmtpClient mailer = new SmtpClient();
            MailMessage mail = new MailMessage();
            mail.To.Add(new MailAddress(txtTo.Text));
            mail.Subject = txtSubject.Text;
            mail.Body = txtMessage.Text;

            mailer.Send(mail);
            this.msg.InnerHtml = "Mail Send Succefully!!";
            this.alert.Attributes.Add("class", "alert alert-success");
            this.alert.Visible = true;

            AllClear();
        }
        private void AllClear()
        {
            txtTo.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
            txtTo.Focus();
        }
    }
}