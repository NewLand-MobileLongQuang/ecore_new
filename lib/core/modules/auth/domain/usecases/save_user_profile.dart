import 'package:equatable/equatable.dart';

import '../../../../usecases/usecase.dart';
import '../../../../utils/typedef.dart';
import '../entities/inos_user.dart';
import '../repos/auth_repo.dart';

class EditProfileParams extends Equatable {
  const EditProfileParams({
    required this.name,
    required this.avatar,
    required this.language,

    this.currentPassword,
    this.newPassword,
  });


  final String name;
  final String avatar;
  final String? currentPassword;
  final String? newPassword;

  final String language;

  @override
  List<Object?> get props => [name, avatar, language];
}

class SaveUserProfile extends UsecaseWithParams<InosUser, EditProfileParams> {
  const SaveUserProfile(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<InosUser> call(EditProfileParams params) async =>
      _repo.saveUserProfile(

          name: params.name,
          avatar: params.avatar,

          );
}
