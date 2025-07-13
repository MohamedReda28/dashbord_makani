

import 'package:dartz/dartz.dart';
import 'package:makani_dashbord/features/addpost/domine/entites/PosstEntity.dart';

import '../../erroes/Failur.dart';

abstract class PostRepo{
  Future<Either<Failur,void>> addPost(PostEntity posstEntity);

}