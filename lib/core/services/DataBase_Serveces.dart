
import 'package:makani_dashbord/core/enums/order_enum.dart';

abstract class DataBaseServeces {
  //خلي بالك هنا انت بتعمل خدمه لاي حاجه بيتعملها ارسال ل قاعده البيانات
  //المتغير الا اسمو path دلدا بياخد اما لنك api او اسم collection من firebase
  //بينما data دي الحاجه الا هتبعتها
  Future<void> addData({required String path, required Map<String, dynamic> data,String? documentId});

  //دي method بتجيب بانات 
  Future<dynamic> getData(
      {required String path, String? documentId, Map<String, dynamic>? query});

  Stream<dynamic> getDataStream({required String path,  Map<String, dynamic>? query});
  Future<void> updateData({required String path, required Map<String, dynamic> data,String? documentId});

  Future<bool> chackIfDataExist({required String path, required String documentId});
  Future<void>deletData({required String path,required String productID});
}
