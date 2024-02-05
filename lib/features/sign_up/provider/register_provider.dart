import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/features/sign_up/provider/register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier()
      : super(const RegisterState(
            email: '', username: '', password: '', rePassword: ''));
            
  void onUsernameChange(String username) {
    state = state.copyWith(username: username);
  }
  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }
  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
  void onRePasswordChange(String rePassword) {
    state = state.copyWith(rePassword: rePassword);
  }
  
}

final registerProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier();
});
