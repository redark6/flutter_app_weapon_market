import 'dart:typed_data';

class Announce {

  final int id;
  final String name;
  final String content;
  final String date;
  final String location;
  final int category;
  //final Uint8List image;
  final String image;
  final int price;
  final int userId;
  final String email;
  final String username;
  //this.profilePictureUrl = user.getProfilePictureUrl();
  final String phone;

  const Announce({
    required this.id,
    required this.name,
    required this.content,
    required this.date,
    required this.location,
    required this.category,
    required this.image,
    required this.price,
    required this.userId,
    required this.email,
    required this.username,
    required this.phone,
  });

  String getPrice() {
    return "$price€";
  }

  factory Announce.fromJson(Map<String, dynamic> json) {
    return Announce(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      content: json['content'] as String? ?? '',
      date: json['date'] as String? ?? '',
      location: json['location'] as String? ?? '',
      category: json['profilePictureUrl'] as int? ?? 0,
      image: json['image'] as String? ?? '',
     // image: json['image'] as Uint8List? ?? Uint8List.fromList([]),
      price: json['price'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      username: json['username'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
    );
  }

}