class UserModel {
  final String username;
  final String email;
   bool gender;
  final String? profilePhoto;

  UserModel({
    required this.username,
    required this.email,
    required this.gender,
    this.profilePhoto,
  });

  /// İnternetten Veri çekerken bu kısmı kullanıyoruz
  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'gender': gender,
    'profilePhoto': profilePhoto,
  };

  /// Veri tabanına yükleme yaparken kullandığımız alan
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      gender: json['gender'],
      profilePhoto: json['profilePhoto'],
    );
  }
}
