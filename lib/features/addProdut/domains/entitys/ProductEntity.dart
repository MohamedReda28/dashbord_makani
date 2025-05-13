import 'dart:io';

import 'package:makani_dashbord/features/addProdut/domains/entitys/reviewPorductEntity.dart';

class ProductEntity {
  final String name;
  final String description;
  final String code;
  final String catogry;
  final num price;
  final String unitAmount;
  final File image;
  final bool isFeature;
  String? imageUrl;
  final double numberOfCaloric;
  final num avgReting = 0;
  final num ratigCount = 0;
  final bool isOrgnic;
  final List<ReviewporductEntity> reviews;

  ProductEntity(
      {required this.name,
      required this.reviews,
      required this.catogry,
      required this.numberOfCaloric,
      required this.unitAmount,
      required this.description,
      required this.code,
      required this.price,
      required this.image,
      required this.isFeature,
      this.isOrgnic = false,
      this.imageUrl});
}
