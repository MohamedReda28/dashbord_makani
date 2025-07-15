import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani_dashbord/core/enums/order_enum.dart';
import 'package:makani_dashbord/core/services/CustomBlocObserver.dart';
import 'package:makani_dashbord/features/get%20orders/data/models/order%20model.dart';
import 'package:makani_dashbord/features/get%20orders/presentation/views/maneger/cubit/order/order_cubit.dart';
import 'package:makani_dashbord/features/get%20orders/presentation/views/maneger/cubit/update_order/update_order_cubit.dart';
import 'package:makani_dashbord/features/get%20orders/presentation/views/widgets/returnIconState.dart';
import 'package:makani_dashbord/features/get%20orders/presentation/views/widgets/returnStateColors.dart';
import 'package:makani_dashbord/features/get%20orders/presentation/views/widgets/returnStateText.dart';
import '../../../domins/entitys/order entity.dart';
import '../../../domins/entitys/orderProductEntity.dart';
import 'change_status_botton.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity orderEntity;

  OrderItem({Key? key, required this.orderEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الحالة هنا
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color:
                      getStatusColor(orderEntity.status.name).withOpacity(0.1),
                  border: Border.all(
                      color: getStatusColor(orderEntity.status.name)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      getStatusIcon(orderEntity.status.name),
                      color: getStatusColor(orderEntity.status.name),
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      getStatusText(orderEntity.status.name),
                      style: TextStyle(
                        color: getStatusColor(orderEntity.status.name),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'رقم الطلب: ${orderEntity.orderNumber}',
              style: style,
            ),
            const SizedBox(height: 5),
            Text(
              'اجمالي السعر:${orderEntity.totalPrice.toStringAsFixed(1)}',
              style: style,
            ),
            Text('طريقه الدفع: ${orderEntity.payMethod}', style: style),
            const Divider(),
            const Text(
              'عنوان التوصيل',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'الاسم: ${orderEntity.addressOrderEntity.name}',
              style: style,
            ),
            Text('طريقه الاستلام: ${orderEntity.methodOfReceipt}',
                style: style),

            Text(
                'العنوان: ${orderEntity.addressOrderEntity.city}, ${orderEntity.addressOrderEntity.address}',
                style: style),
            Text(
              'رقم الموبايل: ${orderEntity.addressOrderEntity.phone}',
              style: style,
            ),
            const Divider(),
            const Text(
              'المنتجات المطلوبة :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: orderEntity.orderProductEntity.length,
              itemBuilder: (context, index) {
                return _buildProductItem(orderEntity.orderProductEntity[index]);
              },
            ),
            const SizedBox(height: 10),
            ChangeStatusBotton(
              orderEntity: orderEntity,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(OrderproductEntity product) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: product.Urlimage,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error_outline),
      ),
      title: Text(product.name),
      subtitle: Row(
        children: [
          Text('الكميه: ${product.quantity}'),
          const Spacer(),
          Text(
            'جنيه ${product.price}',
            style: const TextStyle(
                color: Colors.green, fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  TextStyle style = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
}
