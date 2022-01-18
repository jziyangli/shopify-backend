using System.ComponentModel.DataAnnotations;

namespace shopify_backend.Models
{
    public class Supplier
    {
        [Key]
        public int SupplierId { get; set; }
        [Required]
        public string Name { get; set; }
        [Phone]
        public string Phone { get; set; }
        [EmailAddress]
        public string EmailAddress { get; set; }

        //Relations
        public ICollection<ProductSupply> productSupplies { get; set; }
    }
}