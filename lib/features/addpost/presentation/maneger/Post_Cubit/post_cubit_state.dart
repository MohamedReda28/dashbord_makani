part of 'post_cubit_cubit.dart';

@immutable
sealed class AddPostCubitState {}

final class AddPostCubitInitial extends AddPostCubitState {}
final class AddPostCubitLoading extends AddPostCubitState {}
final class AddPostCubitSuccesss extends AddPostCubitState {}
final class AddPostCubitFaluir extends AddPostCubitState {

  final String errorMassage;

  AddPostCubitFaluir(this.errorMassage);
}
