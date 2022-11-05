
import 'package:cookee_common/Services/convert_service.dart';

class CustomerModel{

       int? id;
       String? name;
       String? email;
       String? mobileNumber;
       String? image;
       String? createdAt;
       String? updatedAt;

      CustomerModel({
          this.id,
          this.name,
          this.email,
          this.mobileNumber,
          this.image,
          this.createdAt,
          this.updatedAt,
      });


      factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
          id: ConvertService.convertInt(json["id"]),
          name: ConvertService.convertString(json["name"]),
          email: ConvertService.convertString(json["email"]),
          mobileNumber: ConvertService.convertString(json["mobile_number"]),
          image: ConvertService.convertString(json["image"]),
          createdAt: ConvertService.convertString(json["created_at"]),
          updatedAt: ConvertService.convertString(json["updated_at"]),
      );

      Map<String, dynamic> toJson() => {
         "id": id,
         "name": name,
         "email": email,
         "mobile_number": mobileNumber,
         "image": image,
         "created_at": createdAt,
         "updated_at": updatedAt,
      };

      static List<CustomerModel> parseItems(productJson){
      try{
             var list = productJson as List;
             if(list!=null){
                  List<CustomerModel> pros = list.map((data)=>CustomerModel.fromJson(data)).toList();
                  return pros;
              }
      }
      catch(_){}
         return [];
      }


      static CustomerModel? parseItem(Map<String, dynamic> json){
         if(json!=null){
               return CustomerModel.fromJson(json);
         }
         return null;
      }


      CustomerModel copyItem() => CustomerModel(
         id: id,
         name: name,
         email: email,
         mobileNumber: mobileNumber,
         image: image,
         createdAt: createdAt,
         updatedAt: updatedAt,
      );

      List<CustomerModel> copyItems(List<CustomerModel> items){
         return items.map((e) => e.copyItem()).toList();
       }

      static CustomerModel initData() => CustomerModel(
         id: 0,
         name: "",
         email: "",
         mobileNumber: "",
         image: "",
         createdAt: "",
         updatedAt: "",
      );
}