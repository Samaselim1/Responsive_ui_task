import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial(name: '', email: '', phoneNumber: '', password: ''));

  Future<void> SignUpSubmit(SignUpInitial userDetails) async {
    final bool validCredentials = userDetails.name.isNotEmpty &&
        userDetails.email.contains('@') &&
        userDetails.phoneNumber.length >= 6 &&
        userDetails.password.length >= 4;

    if (validCredentials) {
      emit(SignUpSuccess());
    } else {
      emit(SignUpFailed());
    }
  }
}
