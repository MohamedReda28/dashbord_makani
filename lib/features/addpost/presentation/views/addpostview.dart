import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani_dashbord/features/addpost/presentation/maneger/Post_Cubit/post_cubit_cubit.dart';
import 'package:makani_dashbord/features/addpost/presentation/views/widgetss/AddpostviewBodyWithConsumer.dart';
import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/post_repo/post_repo.dart';
import '../../../../core/services/git_it_Service.dart';
class Addpostview extends StatelessWidget {
  const Addpostview({super.key});
static const routName='Addpostview';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AddPostCubit(
        getIt.get<ImageRepo>(),
        getIt.get<PostRepo>(),
      ),
      child: const Scaffold(
        body: AddpostviewBodyWithConsumer(),
      ),
    );
  }
}


