#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using shopify_backend.Models;

namespace shopify_backend.Pages.Inventory
{
    public class CreateModel : PageModel
    {
        private readonly shopify_backend.Models.ApplicationDbContext _context;

        public CreateModel(shopify_backend.Models.ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            TagList = _context.Tags.ToList<Tag>().Select(m => new SelectListItem { Text = m.Name, Value = m.TagId.ToString() }).ToList<SelectListItem>();
            return Page();
        }

        [BindProperty]
        public IList<SelectListItem> TagList { get; set; }

        [BindProperty]
        public Product Product { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            int cnt = 0;
            IList<Tag> newTags = new List<Tag>();
            foreach (SelectListItem tag in TagList)
            {
                if (tag.Selected)
                {
                    //newTags.Add(new Tag { TagId = Convert.ToInt32(tag.Value) });
                    cnt++;
                    newTags.Add(_context.Tags.Where(x => x.TagId == Convert.ToInt32(tag.Value)).FirstOrDefault());
                }
            }

            Product.Tags = newTags;
            _context.Products.Add(Product);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
