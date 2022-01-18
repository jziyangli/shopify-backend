using System.ComponentModel.DataAnnotations;

namespace shopify_backend.Models
{
    public class Product
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Summary { get; set; }

        //Relations
        //Relations
        //public ICollection<Purchase> Purchases { get; set; }
    }
}