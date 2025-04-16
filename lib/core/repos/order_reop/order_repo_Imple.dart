import 'package:dartz/dartz.dart';

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
    await for (var (data as List<Map<String,dynamic>>) in dataBaseServeces.getDataStream(path: BackEndImpoint.getOedersData)) {
    
     //dataBaseServeces.getDataStream(path: BackEndImpoint.getOedersData) as List<Map<String, dynamic>>;
    List<OrderModel> orderModel = data.map((e) => OrderModel.fromJson(e)).toList();
    List<OrderEntity> ordersEntit = orderModel.map((e) => e.toEntity()).toList();
    yield right(ordersEntit);

    }

     
  } catch (e) {
    yield left(ServerFailure(e.toString()));
  }
}

}