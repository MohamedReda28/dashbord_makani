import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani_dashbord/features/addpost/domine/entites/PosstEntity.dart';
import 'package:makani_dashbord/features/addpost/presentation/maneger/Post_Cubit/post_cubit_cubit.dart';

import '../../../../../core/helpes_function/BuildSnakBar.dart';
import '../../../../../core/widget/Custom_Botton.dart';
import '../../../../addProdut/presintatin/view/Widget/CustomImageFiled.dart';

class AddpostviewBody extends StatefulWidget {
  const AddpostviewBody({super.key});

  @override
  State<AddpostviewBody> createState() => _AddpostviewBodyState();
}

class _AddpostviewBodyState extends State<AddpostviewBody> {
  File? fileimage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageFiled(
          onValueChange: (value) {
            fileimage = value;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomBotton(
            title: 'Add post',
            ontap: () {
              if (fileimage != null) {
                PostEntity input = PostEntity(
                    image: fileimage!,
                );
                context.read<AddPostCubit>().addPost(input);

              } else {
                BuildSnakBar(context, 'حدد الصوره',type:SnackbarType.warning );
              }
            }),
      ],
    );
  }
}
