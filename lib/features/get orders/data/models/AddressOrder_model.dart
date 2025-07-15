
import '../../domins/entitys/AddressOrder_entity.dart';

class AddressOrderModel {
  String? name;
  String? address;
  String? phone;
  String? city;

  AddressOrderModel(
      {this.name,
      this.address,
      this.phone,
      this.city,
      });

  factory AddressOrderModel.fromJson(Map<String, dynamic> json) {
    return AddressOrderModel(
      name: json['name']??'',
      address: json['address'],
      phone: json['phone']??'',
      city: json['city'],
    );
  }

  toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'city': city,

    };
  }
   AddressOrderEntity toEntity(){
    return AddressOrderEntity(
      name: name,
      address: address,
      phone: phone,
      city: city,
      );
    
  }
}
