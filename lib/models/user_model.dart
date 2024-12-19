class ProfileUser {
  final String id;
  final String name;
  final String email;
  final String profilePictureUrl;

  ProfileUser({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
  });

  // Factory constructor for creating a ProfileUser from a JSON map
  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String,
    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
