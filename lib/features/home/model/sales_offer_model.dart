class SalesOfferModel {
  final String image, title, description;

  const SalesOfferModel({
    required this.image,
    required this.title,
    required this.description,
  });

  factory SalesOfferModel.fromJson(Map<String, dynamic> json) {
    return SalesOfferModel(
      image: json['image'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        'description': description,
      };
}
