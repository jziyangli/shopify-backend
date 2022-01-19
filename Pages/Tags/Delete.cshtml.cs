﻿#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using shopify_backend.Models;

namespace shopify_backend.Pages.Tags
{
    public class DeleteModel : PageModel
    {
        private readonly shopify_backend.Models.ApplicationDbContext _context;

        public DeleteModel(shopify_backend.Models.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Tag Tag { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Tag = await _context.Tags.FirstOrDefaultAsync(m => m.TagId == id);

            if (Tag == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Tag = await _context.Tags.FindAsync(id);

            if (Tag != null)
            {
                _context.Tags.Remove(Tag);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
