using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace eMedicineShop.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }
        [Required, StringLength(30)]
        public string CategoryName { get; set; }

        //Navigation
        public virtual IList<Medicine> Medicines { get; set; }
    }
    public class Medicine
    {
        public int MedicineId { get; set; }
        [Required, StringLength(50)]
        public string MedicineName { get; set; }
        [Required, StringLength(40)]
        public string UnitDescription { get; set; }
        [Required, StringLength(50)]
        public string GenericGroup { get; set; }
        [Required, StringLength(50)]
        public string BrandName { get; set; }
        [Required, StringLength(50)]
        public string MedicineType { get; set; }
        [Required]
        [Column(TypeName = "money")]
        public decimal UnitPrice { get; set; }
        [Required]
        public int PackSize { get; set; }
        [StringLength(150)]
        public string PictureFile { get; set; }

        [Required]
        [ForeignKey("Category")]
        public int CategoryId { get; set; }
        //Navigation
        public virtual Category Category { get; set; }
        public virtual IList<OrderItem> OrderItems { get; set; }
        public virtual IList<CartItem> CartItems { get; set; }
        public virtual IList<Stock> Stocks { get; set; }

    }

    public class Customer
    {
        public int CustomerId { get; set; }
        [Required, StringLength(120)]
        public string UserId { get; set; }
        [StringLength(60)]
        public string CustomerName { get; set; }
        [StringLength(100)]
        public string Address { get; set; }
        [CreditCard]
        public string CreditCardNumber { get; set; }
        [Column(TypeName = "date")]
        public DateTime? CreditCardExpireDate { get; set; }
        //Navigation
        public virtual IList<Order> Orders { get; set; }
        public virtual IList<CartItem> CartItems { get; set; }


    }
    public partial class Stock
    {
        public int StockID { get; set; }

        public int? MedicineId { get; set; }

        public int? Quantity { get; set; }

        [Required,StringLength(20)]
        public string QuantityUnit { get; set; }

        public virtual Medicine Medicine { get; set; }
    }
    public class Order
    {
        public int OrderId { get; set; }
        [Required]
        [Column(TypeName = "date")]
        public DateTime OrderDate { get; set; }
        [Column(TypeName = "date")]
        public DateTime? ShippedDate { get; set; }
        //FK
        [Required, ForeignKey("Customer")]
        public int CustomerId { get; set; }
        //Navigation
        public virtual Customer Customer { get; set; }
        public virtual IList<OrderItem> OrderItems { get; set; }
    }
    public class OrderItem
    {
        [Key, Column(Order = 0)]
        [ForeignKey("Order")]
        public int OrderId { get; set; }

        [Key, Column(Order = 1)]
        [ForeignKey("Medicine")]
        public int MedicineId { get; set; }

        [Required]
        public int Quantity { get; set; }
        //Navligation
        public virtual Order Order { get; set; }
        public virtual Medicine Medicine { get; set; }
    }
    public class CartItem
    {
        public int CartItemId { get; set; }
        [Required]
        public int MedicineId { get; set; }
        [Required]
        public int CustomerId { get; set; }
        [Required]
        public int Quantity { get; set; }
    }

    public class MedicineShopDbContext : DbContext
    {
        public MedicineShopDbContext()
        {
            Database.SetInitializer(new DbInitializer());
        }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Medicine> Medicines { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Stock> Stocks { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
    }
    public class DbInitializer : DropCreateDatabaseIfModelChanges<MedicineShopDbContext>
    {
        protected override void Seed(MedicineShopDbContext context)
        {
            base.Seed(context);
        }
    }
}