import org.apache.ofbiz.entity.GenericEntityException;

def createProduct() {
    result = [:];
    try {
        Product = delegator.makeValue("Product");
        // Auto generating next sequence of ofbizDemoId primary key
        Product.setNextSeqId();
        // Setting up all non primary key field values from context map
        Product.setNonPKFields(context);
        // Creating record in database for OfbizDemo entity for prepared value
        Product = delegator.create(Product);
        result.ProductId = Product.ProductId;
        logInfo("==========This is my first Groovy Service implementation in Apache OFBiz. OfbizDemo record "
                  +"created successfully with ProductId: "+Product.getString("ProductId"));
      } catch (GenericEntityException e) {
          logError(e.getMessage());
          return error("Error in creating record in Product entity ........");
      }
      return result;
} 
