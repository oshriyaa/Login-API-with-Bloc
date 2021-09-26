import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:login_bloc/api/api_service.dart';
// import 'package:login_bloc/bloc/login_bloc.dart';
// import 'package:login_bloc/bloc/login_event.dart';
// import 'package:login_bloc/bloc/login_state.dart';
import 'package:login_bloc/screens/login_ui.dart';

import 'dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      body: LoginUI(),
    );
  }
}
