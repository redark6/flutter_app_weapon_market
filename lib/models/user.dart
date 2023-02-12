class User {

  final int id;
  final String email;
  final String password;
  final String username;
  final bool enabled;
  final String profilePictureUrl;
  final String phone;

  const User({
    required this.id,
    required this.email,
    required this.password,
    required this.username,
    required this.enabled,
    required this.profilePictureUrl,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      username: json['username'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? true,
      profilePictureUrl: json['profilePictureUrl'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
    );
  }

}