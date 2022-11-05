class PmUserRegisterModel{
    String? name;
    String? email;
    String? password;

    PmUserRegisterModel({this.name,this.email,this.password});

    Map<String, dynamic> toJson() => {
         "name": name,
         "email": email,
         "password":password,
      };
  }