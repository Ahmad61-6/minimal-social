import 'package:minimal_social/features/auth/domain/repos/auth_repo.dart';

class ResetPassUsecase {
  final AuthRepo _authRepo;

ResetPassUsecase(this._authRepo);

Future<String> call(String email)async{
  return await _authRepo.sendPasswordResetEmail(email);
}
}