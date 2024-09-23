class FetchModel {
  final String title;
  final double price;
  final String thumbnail;

  FetchModel({required this.title, required this.price, required this.thumbnail});

  factory FetchModel.fromJson(Map<String, dynamic> json) {
    return FetchModel(
      title: json['title']?? "",
      price: json['price'].toDouble() ?? "",
      thumbnail: json['thumbnail'] ??"",
    );
  }
}