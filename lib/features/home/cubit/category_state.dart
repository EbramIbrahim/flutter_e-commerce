abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  List<String> categories;
  CategorySuccess(this.categories);
}

class CategoryError extends CategoryState {
  String message;
  CategoryError(this.message);
}
