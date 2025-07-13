
import 'package:dartz/dartz.dart';
import 'package:makani_dashbord/core/erroes/Failur.dart';
import 'package:makani_dashbord/core/repos/post_repo/post_repo.dart';
import 'package:makani_dashbord/core/uitels/backend%20Impoint.dart';
import 'package:makani_dashbord/features/addpost/data/model/postModel.dart';
import 'package:makani_dashbord/features/addpost/domine/entites/PosstEntity.dart';

import '../../services/DataBase_Serveces.dart';

class PostRepoImple implements PostRepo{
  final DataBaseServeces dataBaseServeces;

  PostRepoImple(this.dataBaseServeces);

  @override
  Future<Either<Failur, void>> addPost(PostEntity posstEntity) async{
    try {
      var post = PostModel.formEntity(posstEntity);

      await dataBaseServeces.addData(
        documentId: post.poID,
          path:BackEndImpoint.addPost,
          data: post.tojson());
      return const Right(null);
    }  catch (e) {
      return Left(ServerFailure('خطأ في اضافه المنتج'));
    }
  }

}