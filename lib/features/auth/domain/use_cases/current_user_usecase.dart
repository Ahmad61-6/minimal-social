import 'package:minimal_social/features/auth/domain/models/app_user.dart';
import 'package:minimal_social/features/auth/domain/repos/auth_repo.dart';

class CurrentUserUsecase {
  final AuthRepo _authRepo;
  CurrentUserUsecase(this._authRepo);

  Future<AppUser?> call()async{
    return _authRepo.getCurrentUser();
  }
}