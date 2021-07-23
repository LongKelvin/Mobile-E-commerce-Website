using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MOBILE_SHOPPING_WEBSITE.Startup))]
namespace MOBILE_SHOPPING_WEBSITE
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
