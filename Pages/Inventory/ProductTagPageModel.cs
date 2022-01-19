using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using shopify_backend.Models;

namespace shopify_backend.Pages.Inventory
{
    public class ProductTagPageModel : PageModel
    {
        public List<SelectListItem> TagList { get; set; }

        public void PopulateTagList(ApplicationDbContext _context, Product product)
        { 
            var allTags = _context.Tags;
            var productTags = new HashSet<string>(
                product.Tags.Select(t => t.TagId.ToString()));
            TagList = new List<SelectListItem>();
            foreach(var tag in allTags)
            {
                string tagId = tag.TagId.ToString();
                TagList.Add(new SelectListItem { 
                    Text = tag.Name,
                    Value = tagId,
                    Selected = productTags.Contains(tagId)
                });
            }
        }
    }
}
