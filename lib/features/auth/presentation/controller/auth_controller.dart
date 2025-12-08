
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:minimal_social/features/auth/domain/models/app_user.dart';
import 'package:minimal_social/features/auth/domain/use_cases/current_user_usecase.dart';
import 'package:minimal_social/features/auth/domain/use_cases/delete_account_usecase.dart';
import 'package:minimal_social/features/auth/domain/use_cases/login_usecase.dart';
import 'package:minimal_social/features/auth/domain/use_cases/logout_usecase.dart';
import 'package:minimal_social/features/auth/domain/use_cases/register_usecase.dart';
import 'package:minimal_social/features/auth/domain/use_cases/reset_pass_usecase.dart';

class AuthController extends GetxController{
  final LoginUseCase loginUseCase;
  final RegisterUsecase registerUsecase;
  final LogoutUsecase logoutUsecase;
  final DeleteAccountUsecase deleteAccountUsecase;
  final CurrentUserUsecase currentUserUsecase;
  final ResetPassUsecase resetPassUsecase;

  AuthController({
   required this.loginUseCase,
    required this.registerUsecase,
     required this.logoutUsecase,
      required this.deleteAccountUsecase,
      required this.currentUserUsecase,
      required this.resetPassUsecase,
  });

  bool _isloading = false;

AppUser? _currentUser;
  AppUser? get currentUser => _currentUser;

bool get isloading => _isloading;

Future<void> checkAuthUser() async{
try{
  _isloading = true;
  update();
  AppUser? user =await currentUserUsecase.call();

  if(user!= null){
    _currentUser = user;
  }
  else{
    _currentUser = null;
  }
}catch(e){
  debugPrint("---->Error checking auth: $e");
  _currentUser= null;

} finally{
  _isloading = false;
  update();
}
}

Future<void> login(String email, String password) async{
try{
  _isloading = true;
  update();

  final user = await loginUseCase.call(email, password);
   if(user!=null){
    _currentUser = user;
   }
   else{
    _currentUser = null;
   }

}catch(e){
  debugPrint("----> Error occurred in login: $e");
  _currentUser = null;

}finally{
  _isloading = false;
  update();
}
}

Future<void> register(String name,String email, String password) async{
try{
  _isloading = true;
  update();

  final user = await registerUsecase.call(name,email, password);
   if(user!=null){
    _currentUser = user;
   }
   else{
    _currentUser = null;
   }

}catch(e){
  debugPrint("----> Error occurred in login: $e");
  _currentUser = null;

}finally{
  _isloading = false;
  update();
}
}

Future<void> logout()async{
try{
  _isloading = true;
  update();
  await logoutUsecase.call();
  _isloading = false;
  update();
}catch(e){
  debugPrint("Logout failed: $e");
}
}

Future<String> forgotPassword(String email)async{
  try{
     String res = await resetPassUsecase.call(email);
    return res;
    
  }catch(e){
    return e.toString();
  }
}

Future<void> deleteAccount() async{
try{
  _isloading = true;
  update();
  await deleteAccountUsecase.call();
  _currentUser = null;
  _isloading = false;
  update();
}catch(e){
  debugPrint("-----> Failed xxxxxx : $e");
}
}


}