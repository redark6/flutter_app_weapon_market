class Announce {

  final int id;
  final String name;
  final String content;
  final String date;
  final String location;
  final int category;
  final String image;
  final int price;

  const Announce({
    required this.id,
    required this.name,
    required this.content,
    required this.date,
    required this.location,
    required this.category,
    required this.image,
    required this.price,
  });

  factory Announce.fromJson(Map<String, dynamic> json) {
    return Announce(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      content: json['content'] as String? ?? '',
      date: json['date'] as String? ?? '',
      location: json['location'] as String? ?? '',
      category: json['profilePictureUrl'] as int? ?? 0,
      image: json['image'] as String? ?? '',
      price: json['price'] as int? ?? 0
    );
  }

}