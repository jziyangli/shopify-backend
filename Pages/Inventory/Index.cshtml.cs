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
    public class IndexModel : PageModel
    {
        private readonly shopify_backend.Models.ApplicationDbContext _context;

        public IndexModel(shopify_backend.Models.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public IList<SelectListItem> TagList { get; set; }
        public IList<Product> Product { get;set; }
        public string CurrentFilter { get; set; }

        public async Task OnGetAsync(string? searchString)
        {
            /*TagList = _context.Tags.ToList<Tag>().Select(m => new SelectListItem { Text = m.Name, Value = m.TagId.ToString() }).ToList<SelectListItem>();
            var selectedTags = new HashSet<string>();
            foreach(SelectListItem item in TagList)
            {
                if(item.Selected)
                {
                    selectedTags.Add(item.Value);
                }
            }*/
            CurrentFilter = searchString;

            IQueryable<Product> ProductTag = from p in _context.Products select p;

            if (!String.IsNullOrWhiteSpace(searchString))
            {
                ProductTag = _context.Products.Include(p => p.Tags)
                    .Where(p => p.Tags.Any(t => t.Name.Contains(searchString)));
            }
            //Product = await _context.Products.ToListAsync();
            //if(selectedTags.Count == 0) Product = await _context.Products.Include(p => p.Tags).ToListAsync();
            //else Product = await _context.Products
            //        .Include(p => p.Tags)
            //        .Where(p => p.Tags.Any(t => selectedTags.Contains(t.TagId.ToString()))).ToListAsync();
            Product = await ProductTag.Include(p => p.Tags).AsNoTracking().ToListAsync();
        }
    }
}
