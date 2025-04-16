import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../erroes/Failur.dart';

abstract class ImageRepo 
{
    
    Future<Either<Failur,String>> uploadImage(File image);

}