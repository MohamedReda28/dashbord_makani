import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:makani_dashbord/core/enums/order_enum.dart';
import '../../../features/get orders/data/models/order model.dart';
import '../../../features/get orders/domins/entitys/order entity.dart';
import '../../erroes/Failur.dart';
import '../../services/DataBase_Serveces.dart';
import '../../uitels/backend Impoint.dart';
import 'order_repo.dart';


class OrderRepoImplment implements OrderRepo{
  final DataBaseServeces dataBaseServeces;

  OrderRepoImplment(this.dataBaseServeces);
  @override
 Stream<Either<Failur, List<OrderEntity>>> getOrders() async* {
    try {
      await for (var event in dataBaseServeces.getDataStream(
        path: BackEndImpoint.getOedersData,
        query: {
          'orderBy': 'date',
          'descending': true,
        },
      )) {
        // تأكد إن event هو List<Map<String, dynamic>>
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(event);

        List<OrderModel> orderModel = data.map((e) => OrderModel.fromJson(e)).toList();
        List<OrderEntity> ordersEntity = orderModel.map((e) => e.toEntity()).toList();

        yield right(ordersEntity);
      }
    } catch (e) {
      yield left(ServerFailure(e.toString()));
    }
}

  @override
  Future<Either<Failur, void>> updatOrders(String
  status, String oID) async{
    try{
       await dataBaseServeces.updateData(
        path: BackEndImpoint.updateOeders,
        //ورح شوف عمليه update بتحتاج انك تبعت المودل كلو ماعدا الا محتادها تتعدل او ان انت محتاج نبعت الحاجه الا هتتعدل بس
        data:{
          'status': status,
        } ,
        documentId: oID);

        return right(null);
        }catch(e){
        log(e.toString());
          return left(ServerFailure('حدث خطأ في تحديث الطلبات '));
          }
    }

  }


