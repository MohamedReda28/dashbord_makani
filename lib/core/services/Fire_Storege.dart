import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:makani_dashbord/core/services/storge_service.dart';
import 'package:path/path.dart'as b;

class FireStorege implements StorgeService{

  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> UploadFile(File file,String path) async{
    //انا عملت file من نوع File عشان اقدر اوصل للاسم والامتداد بتاعه زي منتا شايف كدا
    var filename= b.basename(file.path);
    var fileExtintin=b.extension(file.path);
    //هنا بسيطهم متغيرات علشان في في servece عموميه لازم تكون متغيرات
    var fileRef = storageRef.child('$path/$filename.$fileExtintin');
    // هنا بعد ما مسكت file بايدي وعارف المكان الا هخزنه فيه همل ايداع للملف
    //لو شغالapi يبقي استخدم putstring او fireاستخدم putfile
    await  fileRef.putFile(file);
    //هنا خادت urlالا هوصل بيه ل file
    var fileUrl =  fileRef.getDownloadURL();
    return fileUrl;
  }
}