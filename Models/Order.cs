using System.ComponentModel.DataAnnotations;

namespace shopify_backend.Models
{
    public class Order
    {
        [Key]
        public int OrderId { get; set; }
        public DateTimeKind OrderDateTime { get; set; }
        public double TotalPrice { get; set; }

        //Relations
        public Customer Customer { get; set; }
        public ICollection<ProductOrder> ProductOrders { get; set; }
    }
}