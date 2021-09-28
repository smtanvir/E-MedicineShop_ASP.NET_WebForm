using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(eMedicineShop.Startup))]
namespace eMedicineShop
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
