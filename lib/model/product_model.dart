class ProductModel {
  String? name;
  String? productImage;
  String? description;
  String? size;
  double? price;
  String? productId;

  ProductModel(
      {this.name,
      this.productImage,
      this.description,
      this.size,
      this.price,
      this.productId});

  ProductModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          productImage: json['productImage'],
          description: json['description'],
          size: json['size'],
          price: json['price'],
          productId: json['productId'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'productImage': productImage,
      'description': description,
      'size': size,
      'price': price,
      'productId': productId,
    };
  }
}
