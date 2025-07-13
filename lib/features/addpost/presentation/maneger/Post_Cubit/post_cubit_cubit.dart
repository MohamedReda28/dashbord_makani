import 'package:bloc/bloc.dart';
import 'package:makani_dashbord/core/repos/post_repo/post_repo.dart';
import 'package:makani_dashbord/features/addpost/domine/entites/PosstEntity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/repos/image_repo/image_repo.dart';

part 'post_cubit_state.dart';

class AddPostCubit extends Cubit<AddPostCubitState> {
  AddPostCubit(this.imageRepo, this.postRepo) : super(AddPostCubitInitial());
  final ImageRepo imageRepo;
  final PostRepo postRepo;
  Future<void>addPost(PostEntity post)async{
    emit(AddPostCubitLoading());
    var result = await imageRepo.uploadImage(post.image);
    result.fold(
          (f) {
        emit(AddPostCubitFaluir(f.toString()));
      },
          (url) async {
            post.imageUrl = url;
        var result = await postRepo.addPost(post);
        result.fold(
              (f) {
            emit(AddPostCubitFaluir(f.toString()));
          },
              (r) {
            emit(AddPostCubitSuccesss());
          },
        );
      },
    );
  }
}
