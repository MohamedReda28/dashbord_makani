import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/helpes_function/BuildSnakBar.dart';
import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../core/services/git_it_Service.dart';
import 'Widget/AddProductViewBody.dart';
import '../../../../core/widget/build appbar.dart';
import 'maneger/cubit/add_product_cubit.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routName = 'AddProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'اضافة منتج'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImageRepo>(),
          getIt.get<ProductRepo>(),
        ),
        child: Builder(builder: (context) {
          return BlocConsumer<AddProductCubit, AddProductState>(
              builder: (BuildContext context, AddProductState state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddProductLoading,
                child: const AddProductViewBody());
          }, listener: (BuildContext context, AddProductState state) {
            if (state is AddProductSuccess) {
              return BuildSnakBar(context, 'تم اضافه منتج جديد',type:SnackbarType.success );
            }
            if (state is AddProductFailur) {
              return BuildSnakBar(context, state.errorMassage,type:SnackbarType.error );
            }
          });
        }),
      ),
    );
  }
}
