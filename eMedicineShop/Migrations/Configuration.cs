namespace eMedicineShop.Migrations
{
    using eMedicineShop.Models;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<eMedicineShop.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(eMedicineShop.Models.ApplicationDbContext context)
        {
            string[] roles = new string[] { "Admins", "Members", "Annonymous" };
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            foreach (var r in roles)
            {
                if (!context.Roles.Any(x => x.Name == r))
                {
                    roleManager.Create(new IdentityRole(r));
                }
            }
            //
            var userStore = new UserStore<ApplicationUser>(context);


            if (!(context.Users.Any(u => u.UserName == "admin@bd.com")))
            {
                var userManager = new UserManager<ApplicationUser>(userStore);
                var userToInsert = new ApplicationUser { UserName = "admin@medicineshop.com", PhoneNumber = "01728157579" };
                var result = userManager.CreateAsync(userToInsert, "@Admin2021");
                if (result.Result.Succeeded)
                    userManager.AddToRole(userToInsert.Id, "Admins");
            }
        }
    }
}
