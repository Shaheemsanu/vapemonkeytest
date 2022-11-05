
import 'package:cookee_common/Services/convert_service.dart';

class ProductModel{

       int? id;
       String? name;
       String? image;
       String? url;
       int? price;

      ProductModel({
          this.id,
          this.name,
          this.image,
          this.url,
          this.price,
      });


      factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
          id: ConvertService.convertInt(json["id"]),
          name: ConvertService.convertString(json["name"]),
          image: ConvertService.convertString(json["image"]),
          url: ConvertService.convertString(json["url"]),
          price: ConvertService.convertInt(json["price"]),
      );

      Map<String, dynamic> toJson() => {
         "id": id,
         "name": name,
         "image": image,
         "url": url,
         "price": price,
      };

      static List<ProductModel> parseItems(productJson){
      try{
             var list = productJson as List;
             if(list!=null){
                  List<ProductModel> pros = list.map((data)=>ProductModel.fromJson(data)).toList();
                  return pros;
              }
      }
      catch(_){}
         return [];
      }


      static ProductModel? parseItem(Map<String, dynamic> json){
         if(json!=null){
               return ProductModel.fromJson(json);
         }
         return null;
      }


      ProductModel copyItem() => ProductModel(
         id: id,
         name: name,
         image: image,
         url: url,
         price: price,
      );

      List<ProductModel> copyItems(List<ProductModel> items){
         return items.map((e) => e.copyItem()).toList();
       }

      static ProductModel initData() => ProductModel(
         id: 0,
         name: "",
         image: "",
         url: "",
         price: 0,
      );
}