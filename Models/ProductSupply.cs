using System.ComponentModel.DataAnnotations;

namespace shopify_backend.Models
{
    public class ProductSupply
    {
        [Key]
        public int ProductSupplyId { get; set; }
        [Required]
        public int SupplyQuantity { get; set; }
        public DateTimeKind OrderDateTime { get; set; }
        public DateTimeKind ArriveDateTime { get; set; }
        public bool Arrived { get; set; } = false;

        //Relations
        public Product Product { get; set; }
        public Supplier Supplier { get; set; }
    }
}