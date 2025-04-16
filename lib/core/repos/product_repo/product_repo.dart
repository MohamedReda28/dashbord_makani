
import 'package:dartz/dartz.dart';

import '../../../features/addProdut/domains/entitys/ProductEntity.dart';
import '../../erroes/Failur.dart';


abstract class ProductRepo {

  Future<Either<Failur,void>> addProduct(ProductEntity product);
}