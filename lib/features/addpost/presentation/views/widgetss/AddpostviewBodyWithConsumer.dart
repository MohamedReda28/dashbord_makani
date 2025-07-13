import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/helpes_function/BuildSnakBar.dart';
import '../../maneger/Post_Cubit/post_cubit_cubit.dart';
import 'AddpostviewBody.dart';

class AddpostviewBodyWithConsumer extends StatelessWidget {
  const AddpostviewBodyWithConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostCubit, AddPostCubitState>(
        builder: ( context,  state) {
          return ModalProgressHUD(
              inAsyncCall: state is AddPostCubitLoading,
              child: const AddpostviewBody());
        }, listener: ( context,  state) {
      if (state is AddPostCubitSuccesss) {
        return BuildSnakBar(context, 'تم اضافه البوست  ',type:SnackbarType.success );
      }
      if (state is AddPostCubitFaluir) {
        return BuildSnakBar(context, state.errorMassage,type:SnackbarType.error );
      }
    });
  }
}
