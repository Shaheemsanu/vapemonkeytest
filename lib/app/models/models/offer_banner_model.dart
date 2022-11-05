import 'package:cookee_common/Services/convert_service.dart';

class OfferBannerModel{

       int? id;
       String? name;
       String? description;
       String? expiryDate;
       String? url;
       String? image;
       int? sortOrder;

      OfferBannerModel({
          this.id,
          this.name,
          this.description,
          this.expiryDate,
          this.url,
          this.image,
          this.sortOrder,
      });


      factory OfferBannerModel.fromJson(Map<String, dynamic> json) => OfferBannerModel(
          id: ConvertService.convertInt(json["id"]),
          name: ConvertService.convertString(json["name"]),
          description: ConvertService.convertString(json["description"]),
          expiryDate: ConvertService.convertString(json["expiry_date"]),
          url: ConvertService.convertString(json["url"]),
          image: ConvertService.convertString(json["image"]),
          sortOrder: ConvertService.convertInt(json["sort_order"]),
      );

      Map<String, dynamic> toJson() => {
         "id": id,
         "name": name,
         "description": description,
         "expiry_date": expiryDate,
         "url": url,
         "image": image,
         "sort_order": sortOrder,
      };

      static List<OfferBannerModel> parseItems(productJson){
      try{
             var list = productJson as List;
             if(list!=null){
                  List<OfferBannerModel> pros = list.map((data)=>OfferBannerModel.fromJson(data)).toList();
                  return pros;
              }
      }
      catch(_){}
         return [];
      }


      static OfferBannerModel? parseItem(Map<String, dynamic> json){
         if(json!=null){
               return OfferBannerModel.fromJson(json);
         }
         return null;
      }


      OfferBannerModel copyItem() => OfferBannerModel(
         id: id,
         name: name,
         description: description,
         expiryDate: expiryDate,
         url: url,
         image: image,
         sortOrder: sortOrder,
      );

      List<OfferBannerModel> copyItems(List<OfferBannerModel> items){
         return items.map((e) => e.copyItem()).toList();
       }

      static OfferBannerModel initData() => OfferBannerModel(
         id: 0,
         name: "",
         description: "",
         expiryDate: "",
         url: "",
         image: "",
         sortOrder: 0,
      );
}