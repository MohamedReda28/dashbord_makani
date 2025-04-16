import 'package:flutter/material.dart';
import 'package:makani_dashbord/features/dashord/views/widget/DashBordViewBody.dart';

class DashBordView extends StatelessWidget {
  const DashBordView({super.key});
  static const routName = 'dashBord';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Dashbordviewbody(),
    );
  }
}
