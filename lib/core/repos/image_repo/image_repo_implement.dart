import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../erroes/Failur.dart';
import '../../services/storge_service.dart';
import '../../uitels/backend Impoint.dart';
import 'image_repo.dart';


class ImageRepoImplement implements ImageRepo{
  final StorgeService storgeService;

  ImageRepoImplement( this.storgeService);
  
  @override
  Future<Either<Failur, String>> uploadImage(File image) async{
    try {
      String url = await storgeService.UploadFile(image, BackEndImpoint.images);
      return right(url);
    }  catch (e) {
         return left(ServerFailure('Failed to uploade image'));
    }
  }
}