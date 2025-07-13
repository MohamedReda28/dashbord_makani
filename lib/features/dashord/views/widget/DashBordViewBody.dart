import 'package:flutter/material.dart';
import 'package:makani_dashbord/features/addpost/presentation/views/addpostview.dart';


import '../../../../core/widget/Custom_Botton.dart';
import '../../../addProdut/presintatin/view/AddProductView.dart';
import '../../../get orders/presentation/views/get_orders_view.dart';

class Dashbordviewbody extends StatelessWidget {
  const Dashbordviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBotton(
            title: 'اضافه منتج',
            ontap: () {
              Navigator.pushNamed(context, AddProductView.routName);
            },
          ),
          const SizedBox(height: 20),
          CustomBotton(
              title: 'عرض الطلبات',
              ontap: () {
                Navigator.pushNamed(context, GetOrders.routName);
              }),
          const SizedBox(height: 20),
          CustomBotton(
              title: 'اضافه بوست',
              ontap: () {
                Navigator.pushNamed(context, Addpostview.routName);
              })
        ],
      ),
    );
  }
}
