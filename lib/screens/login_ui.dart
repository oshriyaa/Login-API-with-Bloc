import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login_bloc.dart';
import 'package:login_bloc/bloc/login_event.dart';
import 'package:login_bloc/bloc/login_state.dart';


class LoginUI extends StatefulWidget {
  LoginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final _loginFormKey = GlobalKey<FormState>();
  late TextEditingController? controllerEmail = TextEditingController();
  late TextEditingController? controllerPassword = TextEditingController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Form(
          key: _loginFormKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: TextFormField(
                    style: TextStyle(color: Colors.teal.shade900),
                    controller: controllerEmail,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text.';
                      }
                      return null;
                    },
                    onChanged: (data) {
                      print(email);
                      email = data;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.teal.shade900),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.teal.shade900),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextFormField(
                    style: TextStyle(color: Colors.teal.shade900),
                    controller: controllerPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text.';
                      }
                      return null;
                    },
                    onChanged: (data) {
                      print(password);
                      password = data;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.teal.shade900),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.teal.shade900),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.teal.shade900,
                      padding: const EdgeInsets.all(10.0),
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        print('Validated');
                        context.read<LoginBloc>().add(LoginPressedEvent(
                              email: controllerEmail!.text,
                              password: controllerPassword!.text,
                            ));
                        print('should login');
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
