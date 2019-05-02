Special Case[] .
.   [design patterns null object #Problem]
    [design patterns null object #Problem Example]
    [design patterns null object #Goal]

    |Implementation[]:|
    The special case object is pretty like the null object, the only difference is that 
    it’s a more specialized object. In case of the GetProductById method, we could return 
    a ProductNotFound object instead of the NullProduct object.
    |{lng:java}
    | public class ProductNotFound : IProduct
    | {
    |   public string Name { get; set; } = string.Empty;
    |   public decimal Price { get; set; }
    |   public string GetProductInformation()
    |   {
    |       return "Product not found.";
    |   }
    | }
    What differ `ProductNotFound` and `[design patterns null object #Implementation]` is the `GetProductInformation` method return, 
    which is a message saying that the product does not exists in the database.
    Now, we can change `GetProductById` method to return the `ProductNotFound` object when a product is `null`.
    |{lng:java}
    | public IProduct GetProductById(int productId)
    | {
    |   Product product = _productRepository.GetProductById(productId);
    |   if(product == null)
    |       return new ProductNotFound();
    |   return product;
    | }
    The consumer of this method doesn’t have to change at all when you return a special case object, 
    the difference is the GetProductInformation method which will tell the user that the product 
    is missing from the database.

[Patterns of Enterprise Application Architecture (P of EAA). Matrin Fowler](https://www.martinfowler.com/eaaCatalog/specialCase.html)
[Matheus Rodrigues article](https://www.matheus.ro/2017/09/25/design-patterns-practices-net-null-object-special-case-object/)