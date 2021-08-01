using MobileShopConnectionString;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace MOBILE_SHOPPING_WEBSITE.Models.BUS
{
    public class MobileShopOnlineBUS
    {
        public static IEnumerable<Product> ListAllProducts()
        {
            var db = new MobileShopConnectionStringDB();
            return db.Query<Product>("SELECT * FROM Products WHERE ProductStatus = 1 ");
        }

        public static IEnumerable<Image> ListAllProductImage()
        {
            var db = new MobileShopConnectionStringDB();
            return db.Query<Image>("SELECT * FROM Images");
        }

        public static IEnumerable<Image> GetProductImageByID(string productImageID)
        {
            var db = new MobileShopConnectionStringDB();
            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.Append($"SELECT * FROM Images WHERE [ID] = '{productImageID}' ");
            var result = db.Query<Image>(sqlQuery.ToString());
            return result;
        }
    }
}