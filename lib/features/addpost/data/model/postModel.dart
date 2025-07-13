
import 'dart:io';

import 'package:makani_dashbord/features/addpost/domine/entites/PosstEntity.dart';
import 'package:uuid/uuid.dart';

class PostModel{
  final String poID;
  final File image;

  String? imageUrl;

  PostModel( {required this.poID,required this.image,this.imageUrl});

  factory PostModel.formEntity(PostEntity postentity){
    return PostModel(
      poID: Uuid().v4(),
        image: postentity.image,
        imageUrl: postentity.imageUrl
    );
  }


  tojson(){
    return{
      'poID':poID,
      'imageUrl':imageUrl
    };
}

}