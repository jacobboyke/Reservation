using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Reservations.UI.Startup))]
namespace Reservations.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
