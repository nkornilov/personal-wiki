NullObject[] .
.   |Problem[]:| In programming `null` is an awkward thing to deal with, 
    when you return a variable with `null` value, you have to remember 
    to make `null` checks all around your code.
    |Problem example[]:|
    |{lng:java}
    | public Product GetProductById(int productId)
    | {
    |   Product product = _productRepository.GetProductById(productId);
    |   if(product == null)
    |       throw new Exception("Product Not Found");
    |   return product;
    | }
    In the code above, the repository method `GetProductById` returns a `Product instance`, 
    if the product is not in the database, it returns `null`. 
    When a product is `null`, we throw an `exception`, saying that the product was not found.

    |Goal[]:| To return a version of an object, instead of return a null reference.
    |Implementation[]:|
    The idea here is to create a `“Null” version of the Product class` and return 
    this object instead of an exception.

    Here we have the Product class implementation:
    |{lng:java}
    | public class Product
    | {
    |   public string Name { get; set; }
    |   public decimal Price { get; set; }
    |   public string GetProductInformation()
    |   {
    |       return $"Product name:{Name}{Environment.NewLine} Price: {Price}.";
    |   }
    | }

    To make it work with the [#NullObject] pattern, we need to make an interface of the Product class, 
    them both Product and NullProduct can implement it.
    |{lng:java}
    | public interface IProduct
    | {
    |   string Name { get; set; }
    |   decimal Price { get; set; }
    |   string GetProductInformation();
    | }

    The `NullProduct` class:
    |{lng:java}
    | public class NullProduct : IProduct
    | {
    |   public string Name { get; set; } = string.Empty;
    |   public decimal Price { get; set; }
    |   public string GetProductInformation()
    |   {
    |       return string.Empty;
    |   }
    | }

    As you can see, this class has no behavior, it represents an empty product object.
    Here’s the implementation of the GetProductById method using NullProduct:

    |{lng:java}
    | public IProduct GetProductById(int productId)
    | {
    |   Product product = _productRepository.GetProductById(productId);
    |   if(product == null)
    |       return new NullProduct();
    |   return product;
    | }
    Instead of throwing an exception, we return NullProduct instead.
    
[NullObject Wikipedia](https://en.wikipedia.org/wiki/Null_object_pattern)
[Matheus Rodrigues article](https://www.matheus.ro/2017/09/25/design-patterns-practices-net-null-object-special-case-object/)