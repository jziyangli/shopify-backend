using System.ComponentModel.DataAnnotations;

namespace shopify_backend.Models
{
    public class Customer
    {
        [Key]
        public int CustomerId { get; set; }

        [Required]
        public string FirstName { get; set; } = "";
        public string LastName { get; set; } = "";
        public DateTime BirthDate { get; set; } = DateTime.Today;

        //Relations
        public ICollection<Order> Orders { get; set; } = new List<Order>();
    }
}