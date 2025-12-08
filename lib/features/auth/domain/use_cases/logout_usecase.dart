import 'package:minimal_social/features/auth/domain/repos/auth_repo.dart';

class LogoutUsecase {
  final AuthRepo _authRepo;
  LogoutUsecase(this._authRepo);

  Future<void> call() async{
    return await _authRepo.logout();
  }
}