import 'dart:io';

import 'package:makani_dashbord/features/addProdut/data/reviewPoductModel.dart';

import '../domains/entitys/ProductEntity.dart';

class ProductModel {
  final String name;
  final String description;
  final String code;
  final String catogry;

  final num price;
  final String unitAmount;
  final File image;
  final bool isFeature;
  final int sellingcount;
  String? imageUrl;
  //final int expirationMonth;
  final double numberOfCaloric;
  final num avgReting = 0;
  final num ratigCount = 0;
  final bool isOrgnic;
  final List<ReviewporductModel> reviews;

  ProductModel(
      {required this.numberOfCaloric,
      required this.unitAmount,
      required this.name,
      required this.catogry,
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
      catogry: addProductInputEntity.catogry,
      code: addProductInputEntity.code,
      price: addProductInputEntity.price,
      image: addProductInputEntity.image,
      isFeature: addProductInputEntity.isFeature,
      isOrgnic: addProductInputEntity.isOrgnic,
      imageUrl: addProductInputEntity.imageUrl,
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
      'catogry' : catogry,
      'code': code,
      'sellingcount': sellingcount,
      'price': price,
      'isFeature': isFeature,
      'imageUrl': imageUrl,
      'numberOfCaloric': numberOfCaloric,
      'unitAmount': unitAmount,
      'isOrgnic': isOrgnic,
      'reviews': reviews.map((e) => e.toMap()).toList(),
    };
  }
}
