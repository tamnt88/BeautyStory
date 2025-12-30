using System;
using System.Web;
using System.Web.Routing;

public partial class Global : HttpApplication
{
    protected void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }

    private static void RegisterRoutes(RouteCollection routes)
    {
        routes.Ignore("{resource}.axd/{*pathInfo}");
        routes.MapPageRoute("CategoryBySlug", "danh-muc/{slug}", "~/danh-muc/default.aspx");
        routes.MapPageRoute("ProductBySlug", "san-pham/{slug}", "~/san-pham/default.aspx");
        routes.MapPageRoute("BrandRoot", "thuong-hieu", "~/thuong-hieu/default.aspx");
        routes.MapPageRoute("BrandBySlug", "thuong-hieu/{slug}", "~/thuong-hieu/default.aspx");
        routes.MapPageRoute("OriginRoot", "xuat-xu", "~/xuat-xu/default.aspx");
        routes.MapPageRoute("OriginBySlug", "xuat-xu/{slug}", "~/xuat-xu/default.aspx");
    }
}
