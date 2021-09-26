import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login_bloc.dart';
import 'package:login_bloc/bloc/login_event.dart';
import 'package:login_bloc/bloc/login_state.dart';
import 'package:login_bloc/screens/dashboard.dart';
import 'package:login_bloc/screens/loading.dart';
import 'package:login_bloc/screens/login_page.dart';


class InitialSplashScreen extends StatefulWidget {
  const InitialSplashScreen({Key? key}) : super(key: key);

  @override
  _InitialSplashScreenState createState() => _InitialSplashScreenState();
}

class _InitialSplashScreenState extends State<InitialSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
          'images/logo1.png',
        ),
      duration: 2000,
      backgroundColor: Colors.teal.shade900,
      splashTransition: SplashTransition.fadeTransition,
      // image: Image.asset('images/logo1.png'),
      
      nextScreen: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoadingState())..add(CheckTokenEvent()),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoggedInState) {
              return Dashboard(currentUser: state.profileData);
            } else if (state is LoggedOutState) {
              return LoginPage();
            }
            return LoadingPage();
          },
        ),
      ),
    );
  }
}

  // home: AnimatedSplashScreen(
      //   splash: Image.asset(
      //     'images/logo1.png',
      //   ),
      //   duration: 2000,
      //   splashTransition: SplashTransition.fadeTransition,
      //   backgroundColor: Colors.teal.shade900,
      //   nextScreen: StartUpPage(),
      // ),



// import 'package:flutter/material.dart';
// import 'package:login_bloc/storage/secure_storage.dart';

// class SplashScreen extends StatefulWidget {
//   SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal.shade900,
//       body: Center(
//         child: Container(
//           height: 100,
//           width: 100,
//           child: Image(
//             image: AssetImage('images/logo1.png'),
//           ),
//         ),
//       ),
//     );
//   }
// }
