part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final String message;

  CartSuccess(this.message);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
class FetchCartLoading extends CartState {}

class FetchCartLoaded extends CartState {
  final List<dynamic> cartItems;

  FetchCartLoaded(this.cartItems);
}

class FetchCartError extends CartState {
  final String message;

  FetchCartError(this.message);
}