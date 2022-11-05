class PmMakeAuthModel {
  String? username;
  String? password;
  String? firebaseTokken;

  PmMakeAuthModel({this.username, this.password, this.firebaseTokken});

  Map<String, dynamic> toJson() => {
         "username": username,
         "password":password,
         "firebase_token":firebaseTokken
      };
}
