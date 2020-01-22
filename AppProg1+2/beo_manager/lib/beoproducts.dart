
class BeoProducts{
  List<BeoProduct> getproducts() {
    return this.products;
  }

  List<BeoProduct> products = [
  new BeoProduct("Beoplay A2", "Speaker","./assets/a2.jpg"),
  new BeoProduct("Beoplay A9", "Speaker","./assets/a9.jpg"),
  new BeoProduct("Beosound 1", "Speaker","./assets/beosound1.jpg"),
  new BeoProduct("Beosound 2", "Speaker","./assets/beosound2.jpg"),
  new BeoProduct("Beosound Shape", "Speaker","./assets/shape.jpg"),
  new BeoProduct("Beolab 50", "Speaker","./assets/beolab50.jpg"),
  new BeoProduct("Beolab 90", "Speaker","./assets/beolab90.jpg")];

}

class BeoProduct{
  String productName;
  String productType;
  String location;
  String thumbnail;

  BeoProduct(String name, String productType, String thumbnail){
    this.productName = name;
    this.productType = productType;
    this.location = location;
    this.thumbnail = thumbnail;
  }

  String get name{
    return this.productName;
  }

  String get type{
    return this.productType;
  }
    
}
