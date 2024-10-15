part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {

  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> trendingProducts;
  final List<ProductModel> dealOfTheDayProducts;

  const HomeLoaded( {
    required this.categories,
    required  this.trendingProducts,
    required this.dealOfTheDayProducts,

  });

  @override
  List<Object> get props => [categories, dealOfTheDayProducts , trendingProducts];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
