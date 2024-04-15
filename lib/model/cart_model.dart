class CartModel {
  String? name;
  String? productImage;
  int? _quantity; // Private variable to store the quantity value
  String? itemPrice;
  String? totalPrice;
  String? productId;

  CartModel({
    required this.name,
    required this.productImage,
    required this.itemPrice,
    required this.totalPrice,
    required int quantity, // Updated parameter name
    required this.productId,
  }) : _quantity = quantity; // Assign the value to the private variable

  CartModel.fromJson(Map<dynamic, dynamic> json)
      : this(
          name: json['name'],
          productImage: json['productImage'],
          itemPrice: json['price'],
          totalPrice: json['totalPrice'],
          quantity: json['quantity'],
          productId: json['productId'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'productImage': productImage,
      'quantity': quantity, // Use the getter method here
      'price': itemPrice,
      'totalPrice': totalPrice,
      'productId': productId,
    };
  }

  int get quantity {
    return _quantity ??
        1; // Return the private variable with a default value of 0
  }

  set quantity(int newQuantity) {
    if (newQuantity >= 1) {
      _quantity = newQuantity;
    }
  }
}
