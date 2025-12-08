import 'package:minimal_social/features/auth/domain/models/app_user.dart';
import 'package:minimal_social/features/auth/domain/repos/auth_repo.dart';

class RegisterUsecase {
  final AuthRepo _authRepo;
  RegisterUsecase(this._authRepo);

  Future<AppUser?> call(String name, String email, String password) async{
    return await _authRepo.registerWithEmailPassword(name, email, password);
  }
}