using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace eMedicineShop.Models
{
    public class CartItemViewModel
    {
        [Key]
        public int CartItemId { get; set; }
        [Required]
        public int MedicineId { get; set; }

        [Required]
        public int CustomerId { get; set; }
        [Required]
        public int Quantity { get; set; }
        public string MedicineName { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal Amount { get; set; }
    }
}