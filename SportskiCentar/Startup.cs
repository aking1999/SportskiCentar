using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SportskiCentar.Startup))]
namespace SportskiCentar
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
