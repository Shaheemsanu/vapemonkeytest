class PmProfileUpdateModel {
  String? username;
  String? password;
  String? image;

  PmProfileUpdateModel({this.username, this.password, this.image});

  Map<String, dynamic> toJson() =>
      {"name": username, "password": password, "image_data": image};
}
