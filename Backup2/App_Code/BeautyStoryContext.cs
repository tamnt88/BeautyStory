using System.Data.Entity;

public class BeautyStoryContext : DbContext
{
    public BeautyStoryContext() : base("name=BeautyStoryDb")
    {
    }

    public DbSet<CfUser> CfUsers { get; set; }
    public DbSet<CfRole> CfRoles { get; set; }
    public DbSet<CfPermission> CfPermissions { get; set; }
    public DbSet<CfUserRole> CfUserRoles { get; set; }
    public DbSet<CfRolePermission> CfRolePermissions { get; set; }
    public DbSet<CfMenu> CfMenus { get; set; }
    public DbSet<CfMenuPermission> CfMenuPermissions { get; set; }
    public DbSet<CfAuditLog> CfAuditLogs { get; set; }
    public DbSet<CfProvince> CfProvinces { get; set; }
    public DbSet<CfWard> CfWards { get; set; }
}
