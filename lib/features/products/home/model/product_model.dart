class ProductModel {
  final String id, name, description, image, currency, category;
  final double price, rate;
  final int totalRate;
  final double? sale;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.currency,
    required this.category,
    required this.price,
    required this.rate,
    required this.totalRate,
    this.sale,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      currency: json['currency'],
      category: json['category'],
      price: json['price'],
      rate: json['rate'],
      totalRate: json['totalRate'],
      sale: json['sale'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'currency': currency,
        'category': category,
        'price': price,
        'rate': rate,
        'totalRate': totalRate,
        'sale': sale,
      };
}
