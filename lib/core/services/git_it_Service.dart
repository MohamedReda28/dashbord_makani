
import 'package:get_it/get_it.dart';
import 'package:makani_dashbord/core/repos/post_repo/post_repoImple.dart';
import 'package:makani_dashbord/core/services/storge_service.dart';
import '../repos/image_repo/image_repo.dart';
import '../repos/image_repo/image_repo_implement.dart';
import '../repos/order_reop/order_repo.dart';
import '../repos/order_reop/order_repo_Imple.dart';
import '../repos/post_repo/post_repo.dart';
import '../repos/product_repo/product_repo.dart';
import '../repos/product_repo/product_repo_implement.dart';
import 'DataBase_Serveces.dart';
import 'SupabaseStorgeService.dart';
import 'fireStore_Servece.dart';

final getIt = GetIt.instance;

void setupGitit() {
  getIt.registerSingleton<StorgeService>(SupabaseStorgeService());
  getIt.registerSingleton<DataBaseServeces>(FirestoerServeces());
  getIt.registerSingleton<ImageRepo>(
      ImageRepoImplement(getIt.get<StorgeService>()));
  getIt.registerSingleton<ProductRepo>(
      ProductRepoImplement(getIt.get<DataBaseServeces>()));
  getIt.registerSingleton<PostRepo>(
      PostRepoImple( getIt.get<DataBaseServeces>()));
  getIt.registerSingleton<OrderRepo>(
      OrderRepoImplment(getIt.get<DataBaseServeces>()));
}
