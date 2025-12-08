import 'package:minimal_social/features/auth/domain/repos/auth_repo.dart';

class DeleteAccountUsecase {
  final AuthRepo _authRepo;

  DeleteAccountUsecase(this._authRepo);

  Future<void> call()async{
    return await _authRepo.deleteAccount();
  }
}