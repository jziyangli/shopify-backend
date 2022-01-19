#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using shopify_backend.Models;

namespace shopify_backend.Pages.Inventory
{
    public class EditModel : ProductTagPageModel
    {
        private readonly shopify_backend.Models.ApplicationDbContext _context;

        public EditModel(shopify_backend.Models.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Product Product { get; set; }

        //[BindProperty]
        //public IList<SelectListItem> TagList { get; set; }


        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Product = await _context.Products
                .Include(p => p.Tags)
                .FirstOrDefaultAsync(p => p.ProductId == id);

            if (Product == null)
            {
                return NotFound();
            }

            /*TagList = _context.Tags.ToList<Tag>().Select(m => new SelectListItem
                {
                    Text = m.Name,
                    Value = m.TagId.ToString(),
                    Selected = Product.Tags.Any(t => t.TagId == m.TagId)
                }).ToList<SelectListItem>();*/

            PopulateTagList(_context, Product);
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync(int? id, string[] selectedTags)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            var productToUpdate = await _context.Products
                .Include(p => p.Tags)
                .FirstOrDefaultAsync(p => p.ProductId == id);

            if (productToUpdate == null) return NotFound();

            if(await TryUpdateModelAsync<Product>(
                productToUpdate,
                "Product",
                p => p.ProductName,
                p => p.Description,
                p => p.UnitPrice,
                p => p.Quantity,
                p => p.QuantityReceived,
                p => p.QuantityShipped,
                p => p.PartNumber))
            {
                //if(String.IsNullOrWhiteSpace(productToUpdate.))
                UpdateProductTags(selectedTags, productToUpdate);
                await _context.SaveChangesAsync();
                return RedirectToPage("./Index");
            }
            UpdateProductTags(selectedTags,productToUpdate);
            PopulateTagList(_context, productToUpdate);
            return RedirectToPage("./Index");

            /*
            _context.Attach(Product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(Product.ProductId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");*/
        }

        private void UpdateProductTags(string[] selectedTags, Product productToUpdate)
        {
            if(selectedTags == null)
            {
                productToUpdate.Tags = new List<Tag>();
                return;
            }

            var selectedTagSet = new HashSet<string>(selectedTags);
            var productTags = new HashSet<string>(
                productToUpdate.Tags.Select(t => t.TagId.ToString()));
            foreach(var tag in _context.Tags)
            {
                string tagId = tag.TagId.ToString();
                if (selectedTagSet.Contains(tagId))
                {
                    if (!productTags.Contains(tagId)) productToUpdate.Tags.Add(tag);
                }
                else
                {
                    if(productTags.Contains(tag.TagId.ToString()))
                    {
                        var remove = productToUpdate.Tags.Single(t => t.TagId == tag.TagId);
                        productToUpdate.Tags.Remove(remove);
                    }
                }
            }
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
