#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
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

        public IList<Product> Product { get;set; }

        public async Task OnGetAsync()
        {
            Product = await _context.Products.ToListAsync();
        }
    }
}
