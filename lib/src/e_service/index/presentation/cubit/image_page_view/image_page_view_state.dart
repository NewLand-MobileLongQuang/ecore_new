part of 'image_page_view_cubit.dart';

@immutable
sealed class ImagePageViewState {}

final class ImagePageViewInitial extends ImagePageViewState {}

final class ImagePageViewLoading extends ImagePageViewState {}

final class ImagePageViewLoaded extends ImagePageViewState {
  ImagePageViewLoaded({required this.index});
  final int index;
}

final class ImagePageViewError extends ImagePageViewState {
  final String message;

  ImagePageViewError(this.message);
}
