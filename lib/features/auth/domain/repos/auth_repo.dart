import 'package:minimal_social/features/auth/domain/models/app_user.dart';

abstract class AuthRepo {

  Future<AppUser?> loginWithEmaiPassword(String email,String password);
  Future<AppUser?> registerWithEmailPassword(String name, String email,String password);
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
  Future<String> sendPasswordResetEmail(String email);
  Future<void> deleteAccount();
  
}
