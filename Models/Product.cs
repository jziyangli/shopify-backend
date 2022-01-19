using System.ComponentModel.DataAnnotations;

namespace shopify_backend.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        [Required]
        [Display(Name = "Product Name")]
        public string ProductName { get; set; } = "Default";
        public string? Description { get; set; }
        public double UnitPrice { get; set; } = 0.00;
        public int Quantity { get; set; } = 0;
        [Display(Name = "Quantity Shipped")]
        public int QuantityShipped { get; set; } = 0;
        [Display(Name = "Quantity Received")]
        public int QuantityReceived { get; set; } = 0;
        [Required]
        [Display(Name = "Part Number")]
        public string PartNumber { get; set; } = "";

        //Relations
        public ICollection<Tag>? Tags { get; set; }
        public ICollection<ProductOrder>? ProductOrders { get; set; }
        public ICollection<ProductSupply>? ProductSupplies { get; set; }
    }
}