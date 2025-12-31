using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Services;
using System.Web.Script.Services;

public partial class AdminOrdersDefault : AdminBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindOrderStatuses();
            BindPaymentStatuses();
            BindShippingMethods();
        }
    }

    private void BindOrderStatuses()
    {
        using (var db = new BeautyStoryContext())
        {
            var items = db.CfOrderStatuses
                .Where(s => s.Status)
                .OrderBy(s => s.SortOrder)
                .ThenBy(s => s.Name)
                .Select(s => new { s.Id, s.Name })
                .ToList();

            FilterOrderStatus.Items.Clear();
            FilterOrderStatus.Items.Add(new System.Web.UI.WebControls.ListItem("Tất cả trạng thái", ""));
            foreach (var item in items)
            {
                FilterOrderStatus.Items.Add(new System.Web.UI.WebControls.ListItem(item.Name, item.Id.ToString()));
            }
        }
    }

    private void BindPaymentStatuses()
    {
        using (var db = new BeautyStoryContext())
        {
            var items = db.CfPaymentStatuses
                .Where(s => s.Status)
                .OrderBy(s => s.SortOrder)
                .ThenBy(s => s.Name)
                .Select(s => new { s.Id, s.Name })
                .ToList();

            FilterPaymentStatus.Items.Clear();
            FilterPaymentStatus.Items.Add(new System.Web.UI.WebControls.ListItem("Tất cả thanh toán", ""));
            foreach (var item in items)
            {
                FilterPaymentStatus.Items.Add(new System.Web.UI.WebControls.ListItem(item.Name, item.Id.ToString()));
            }
        }
    }

    private void BindShippingMethods()
    {
        using (var db = new BeautyStoryContext())
        {
            var items = db.CfShippingMethods
                .Where(s => s.Status)
                .OrderBy(s => s.SortOrder)
                .ThenBy(s => s.Name)
                .Select(s => new { s.Id, s.Name })
                .ToList();

            FilterShippingMethod.Items.Clear();
            FilterShippingMethod.Items.Add(new System.Web.UI.WebControls.ListItem("Tất cả vận chuyển", ""));
            foreach (var item in items)
            {
                FilterShippingMethod.Items.Add(new System.Web.UI.WebControls.ListItem(item.Name, item.Id.ToString()));
            }
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static DataTableResult<OrderRow> GetOrders(int draw, int start, int length, string search, int orderColumn, string orderDir,
        string code, string customer, string phone, string orderStatusId, string paymentStatusId, string shippingMethodId, string fromDate, string toDate)
    {
        using (var db = new BeautyStoryContext())
        {
            var query = db.CfOrders.AsQueryable();

            if (!string.IsNullOrWhiteSpace(code))
            {
                string term = code.Trim();
                query = query.Where(o => o.OrderCode.Contains(term));
            }

            if (!string.IsNullOrWhiteSpace(customer))
            {
                string term = customer.Trim();
                query = query.Where(o => o.CustomerName.Contains(term));
            }

            if (!string.IsNullOrWhiteSpace(phone))
            {
                string term = phone.Trim();
                query = query.Where(o => o.Phone.Contains(term));
            }

            int statusId;
            if (!string.IsNullOrWhiteSpace(orderStatusId) && int.TryParse(orderStatusId, out statusId))
            {
                query = query.Where(o => o.OrderStatusId == statusId);
            }

            int paymentId;
            if (!string.IsNullOrWhiteSpace(paymentStatusId) && int.TryParse(paymentStatusId, out paymentId))
            {
                query = query.Where(o => o.PaymentStatusId == paymentId);
            }

            int shipId;
            if (!string.IsNullOrWhiteSpace(shippingMethodId) && int.TryParse(shippingMethodId, out shipId))
            {
                query = query.Where(o => o.ShippingMethodId == shipId);
            }

            DateTime from;
            if (!string.IsNullOrWhiteSpace(fromDate) && DateTime.TryParse(fromDate, CultureInfo.InvariantCulture, DateTimeStyles.None, out from))
            {
                query = query.Where(o => o.CreatedAt >= from);
            }

            DateTime to;
            if (!string.IsNullOrWhiteSpace(toDate) && DateTime.TryParse(toDate, CultureInfo.InvariantCulture, DateTimeStyles.None, out to))
            {
                DateTime end = to.Date.AddDays(1);
                query = query.Where(o => o.CreatedAt < end);
            }

            int total = query.Count();

            var orderStatusLookup = db.CfOrderStatuses.ToDictionary(s => s.Id, s => s.Name);
            var paymentStatusLookup = db.CfPaymentStatuses.ToDictionary(s => s.Id, s => s.Name);

            switch (orderColumn)
            {
                case 0:
                    query = orderDir == "asc" ? query.OrderBy(o => o.OrderCode) : query.OrderByDescending(o => o.OrderCode);
                    break;
                case 1:
                    query = orderDir == "asc" ? query.OrderBy(o => o.CustomerName) : query.OrderByDescending(o => o.CustomerName);
                    break;
                case 2:
                    query = orderDir == "asc" ? query.OrderBy(o => o.Phone) : query.OrderByDescending(o => o.Phone);
                    break;
                case 3:
                    query = orderDir == "asc" ? query.OrderBy(o => o.CreatedAt) : query.OrderByDescending(o => o.CreatedAt);
                    break;
                case 6:
                    query = orderDir == "asc" ? query.OrderBy(o => o.Total) : query.OrderByDescending(o => o.Total);
                    break;
                default:
                    query = query.OrderByDescending(o => o.CreatedAt);
                    break;
            }

            var rows = query.Skip(start).Take(length)
                .Select(o => new
                {
                    o.Id,
                    o.OrderCode,
                    o.CustomerName,
                    o.Phone,
                    o.CreatedAt,
                    o.Total,
                    o.OrderStatusId,
                    o.PaymentStatusId
                }).ToList()
                .Select(o => new OrderRow
                {
                    OrderCode = o.OrderCode,
                    CustomerName = o.CustomerName,
                    Phone = o.Phone,
                    CreatedAt = o.CreatedAt.ToString("dd/MM/yyyy HH:mm"),
                    PaymentStatusHtml = BuildStatusTag(o.PaymentStatusId, paymentStatusLookup, "Chưa thanh toán"),
                    OrderStatusHtml = BuildStatusTag(o.OrderStatusId, orderStatusLookup, "Đang xử lý"),
                    TotalText = FormatMoney(o.Total),
                    ActionsHtml = string.Format("<a class=\"btn btn-sm btn-outline-primary\" href=\"/admin/orders/edit.aspx?id={0}\"><i class=\"fa-solid fa-eye me-1\"></i>Xem</a>", o.Id)
                }).ToList();

            return new DataTableResult<OrderRow>
            {
                draw = draw,
                recordsTotal = total,
                recordsFiltered = total,
                data = rows
            };
        }
    }

    private static string BuildStatusTag(int? statusId, Dictionary<int, string> lookup, string fallback)
    {
        string label = fallback;
        if (statusId.HasValue && lookup.ContainsKey(statusId.Value))
        {
            label = lookup[statusId.Value];
        }

        return string.Format("<span class=\"status-tag status-on\">{0}</span>", label);
    }

    private static string FormatMoney(decimal value)
    {
        return string.Format("{0:N0} đ", value);
    }

    public class OrderRow
    {
        public string OrderCode { get; set; }
        public string CustomerName { get; set; }
        public string Phone { get; set; }
        public string CreatedAt { get; set; }
        public string PaymentStatusHtml { get; set; }
        public string OrderStatusHtml { get; set; }
        public string TotalText { get; set; }
        public string ActionsHtml { get; set; }
    }
}
