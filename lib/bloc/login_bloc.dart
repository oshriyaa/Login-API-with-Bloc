import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/api/api_service.dart';
import 'package:login_bloc/bloc/login_event.dart';
import 'package:login_bloc/bloc/login_state.dart';
import 'package:login_bloc/model/profile_data.dart';
import 'package:login_bloc/storage/secure_storage.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoadingState loadingState) : super(LoadingState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is CheckTokenEvent) {
      yield* tokenCheck(event);
    }
    if (event is LoginPressedEvent) {
      yield* loginButtonPressed(event);
    }
    if (event is LogoutPressedEvent) {
      yield* logoutButtonPressed(event);
    }
  }

  Stream<LoginState> tokenCheck(CheckTokenEvent tokenCheckEvent) async* {
    yield LoadingState();
    bool loggedIn = await isLoggedIn();
    try {
      if (loggedIn == false) {
        yield LoginErrorState(message: "Not Logged In");
        await Future.delayed(Duration(seconds: 1));

        yield LoggedOutState();
      } else if (loggedIn == true) {
        UserProfile? data = await APIService.getUserProfile();
        if (data!.status != "success") {
          yield LoginErrorState(message: "${data.message}, Error");
          await Future.delayed(Duration(seconds: 1));

          yield LoggedOutState();
        } else if (data.status == "success") {
          await Future.delayed(Duration(seconds: 1));
          yield LoggedInState(profileData: data);
        }
      }
    } catch (e) {
      yield LoginErrorState(message: "Something went wrong");
      await Future.delayed(Duration(seconds: 1));
      yield LoggedOutState();
    }
  }

  Stream<LoginState> loginButtonPressed(
      LoginPressedEvent loginPressedEvent) async* {
    yield LoadingState();
    try {
      print('HERE 1 ${loginPressedEvent.email}');
      print('HERE 2 ${loginPressedEvent.password}');
      var response = await APIService.login(
          loginPressedEvent.email, loginPressedEvent.password);
      print('here ${response}');

      if (response["status"] == "success") {
        print('SUCCESS');
        writeSecureData(
            '${response["access_token"]}', '${response["refresh_token"]}');
        UserProfile? data = await APIService.getUserProfile();
        yield LoggedInState(profileData: data);
      } else {
        yield LoginErrorState(message: "${response["message"]}");

        yield LoggedOutState();
      }
    } catch (_) {
      yield LoginErrorState(message: "Error while loging in");
    }
  }

  Stream<LoginState> logoutButtonPressed(
      LogoutPressedEvent logoutPressedEvent) async* {
    yield LoadingState();
    try {
      var logoutResponse = await APIService.logout();
      if (logoutResponse["status"] == "success") {
        deleteSecureData();
        yield LoggedOutState();
      } else {
        yield LoginErrorState(message: "${logoutResponse["message"]}");
      }
    } catch (_) {
      yield LoginErrorState(message: "Logout not successfull");
    }
  }
}
