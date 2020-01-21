
class BeoProducts{
  List<BeoProduct> getproducts() {
    return this.products;
  }

  List<BeoProduct> products = [
  new BeoProduct("A1", "Speaker"),
  new BeoProduct("A2", "Speaker"),
  new BeoProduct("H9", "Headset"),
  new BeoProduct("Beolab 50", "Speaker"),
  new BeoProduct("Beolab 90", "Speaker")];

}

class BeoProduct{
  String productName;
  String productType;
  String location;

  BeoProduct(String name, String productType){
    this.productName = name;
    this.productType = productType;
    this.location = location;
  }

  String get name{
    return this.productName;
  }

  String get type{
    return this.productType;
  }
    
}
