import 'package:minimal_social/features/auth/domain/models/app_user.dart';
import 'package:minimal_social/features/auth/domain/repos/auth_repo.dart';

class LoginUseCase{
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  Future<AppUser?> call(String email, String password) async{
    return await _authRepo.loginWithEmaiPassword(email, password);
  }
}