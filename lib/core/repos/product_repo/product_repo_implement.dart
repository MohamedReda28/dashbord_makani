
import 'package:dartz/dartz.dart';
import 'package:makani_dashbord/core/repos/product_repo/product_repo.dart';

import '../../../features/addProdut/data/productModel.dart';
import '../../../features/addProdut/domains/entitys/ProductEntity.dart';
import '../../erroes/Failur.dart';
import '../../services/DataBase_Serveces.dart';
import '../../uitels/backend Impoint.dart';

class ProductRepoImplement implements ProductRepo {
  final DataBaseServeces dataBaseServeces;

  ProductRepoImplement(this.dataBaseServeces);
  @override
  Future<Either<Failur, void>> addProduct(ProductEntity addProductInputEntity) async {
    try {
     await dataBaseServeces.addData(
      path: BackEndImpoint.addProduct,
      data: ProductModel.fromEntity(addProductInputEntity).toMap());
      return const Right(null);
    }  catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
