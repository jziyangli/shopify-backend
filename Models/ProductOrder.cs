using System.ComponentModel.DataAnnotations;

namespace shopify_backend.Models
{
    public class ProductOrder
    {
        [Key]
        public int ProductOrderId { get; set; }
        [Required]
        public int OrderQuantity { get; set; } = 0;
        public double UnitPrice { get; set; }
        public double SubTotal { get; set; }

        //Relations
        public Product Product { get; set; }
        public Order Order { get; set; }
    }
}