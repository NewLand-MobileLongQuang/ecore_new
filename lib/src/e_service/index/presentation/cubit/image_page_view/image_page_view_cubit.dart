import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_page_view_state.dart';

class ImagePageViewCubit extends Cubit<ImagePageViewState> {
  ImagePageViewCubit() : super(ImagePageViewInitial());

  Future<void> changeIndex(int index, Function? function) async {
    if(function != null) {
      await function();
    }
    emit(ImagePageViewLoaded(index: index));
  }
}
