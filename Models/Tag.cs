using System.ComponentModel.DataAnnotations;

namespace shopify_backend.Models
{
    public class Tag
    {
        public Tag(int tagId)
        {
            this.TagId = tagId;
            this.Description = string.Empty;
        }

        [Key]
        public int TagId { get; set; }

        [Required]
        public string Name { get; set; } = "Default";
        public string? Description { get; set; }

        //Relations
        public ICollection<Product>? Products { get; set; }
    }
}