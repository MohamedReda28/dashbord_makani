part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductFailur extends AddProductState {
  final String errorMassage;

  AddProductFailur( this.errorMassage);
}
final class AddProductSuccess extends AddProductState {}

