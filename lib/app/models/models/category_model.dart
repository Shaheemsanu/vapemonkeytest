
import 'package:cookee_common/Services/convert_service.dart';

class CategoryModel{

       int? id;
       String? name;
       String? image;
       String? url;

      CategoryModel({
          this.id,
          this.name,
          this.image,
          this.url,
      });


      factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
          id: ConvertService.convertInt(json["id"]),
          name: ConvertService.convertString(json["name"]),
          image: ConvertService.convertString(json["image"]),
          url: ConvertService.convertString(json["url"]),
      );

      Map<String, dynamic> toJson() => {
         "id": id,
         "name": name,
         "image": image,
         "url": url,
      };

      static List<CategoryModel> parseItems(productJson){
      try{
             var list = productJson as List;
             if(list!=null){
                  List<CategoryModel> pros = list.map((data)=>CategoryModel.fromJson(data)).toList();
                  return pros;
              }
      }
      catch(_){}
         return [];
      }


      static CategoryModel? parseItem(Map<String, dynamic> json){
         if(json!=null){
               return CategoryModel.fromJson(json);
         }
         return null;
      }


      CategoryModel copyItem() => CategoryModel(
         id: id,
         name: name,
         image: image,
         url: url,
      );

      List<CategoryModel> copyItems(List<CategoryModel> items){
         return items.map((e) => e.copyItem()).toList();
       }

      static CategoryModel initData() => CategoryModel(
         id: 0,
         name: "",
         image: "",
         url: "",
      );
}