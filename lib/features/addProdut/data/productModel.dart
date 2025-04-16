

import 'dart:io';

import 'package:makani_dashbord/features/addProdut/data/reviewPoductModel.dart';

import '../domains/entitys/ProductEntity.dart';

class ProductModel {
  final String name;
  final String description;
  final String code;
  final num price;
  final File image;
  final bool isFeature;
  final int sellingcount;
  String? imageUrl;
  final int expirationMonth;
  final int numberOfCaloric;
  final int unitAmount;
  final num avgReting = 0;
  final num ratigCount = 0;
  final bool isOrgnic;
  final List<ReviewporductModel> reviews;

  ProductModel(
      {required this.expirationMonth,
      required this.numberOfCaloric,
      required this.unitAmount,
      required this.name,
      required this.description,
      required this.code,
      this.sellingcount = 0,
      this.isOrgnic = false,
      required this.price,
      required this.image,
      required this.isFeature,
      required this.reviews,
      this.imageUrl});

  factory ProductModel.fromEntity(ProductEntity addProductInputEntity) {
    return ProductModel(
        
        name: addProductInputEntity.name,
        description: addProductInputEntity.description,
        code: addProductInputEntity.code,
        price: addProductInputEntity.price,
        image: addProductInputEntity.image,
        isFeature: addProductInputEntity.isFeature,
        isOrgnic: addProductInputEntity.isOrgnic,
        imageUrl: addProductInputEntity.imageUrl,
        expirationMonth: addProductInputEntity.expirationMonth,
        numberOfCaloric: addProductInputEntity.numberOfCaloric,
        unitAmount: addProductInputEntity.unitAmount,
        reviews: addProductInputEntity.reviews
            .map((e) => ReviewporductModel.fromEntity(e))
            .toList(),
        );
  }
  
  toMap() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'sellingcount': sellingcount,
      'price': price,
      'isFeature': isFeature,
      'imageUrl': imageUrl,
      'expirationMonth': expirationMonth,
      'numberOfCaloric': numberOfCaloric,
      'unitAmount': unitAmount,
      'isOrgnic': isOrgnic,
      'reviews': reviews.map((e) => e.toMap()).toList(),
    };
  }
 

  
}
