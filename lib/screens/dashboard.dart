import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login_bloc.dart';
import 'package:login_bloc/bloc/login_event.dart';
import 'package:login_bloc/bloc/login_state.dart';
import 'package:login_bloc/model/profile_data.dart';

class Dashboard extends StatelessWidget {
  final UserProfile? currentUser;

  const Dashboard({Key? key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.teal.shade100,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          title: Text('USER - IDENTITY - CARD'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(
                                          '${currentUser!.profile!.image}'))),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 280,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.teal.shade200,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                            'Name: ${currentUser!.profile!.fullName}'),
                                        Divider(
                                          thickness: 2,
                                        ),
                                        Text(
                                            'Phone: ${currentUser!.profile!.phoneNumber}'),
                                        Text(
                                            'Phone: ${currentUser!.profile!.primaryEmail}'),
                                        Text(
                                            'Phone: ${currentUser!.profile!.currentAddress}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 280,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.teal.shade200,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text('About:'),
                                        Text('${currentUser!.profile!.about}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 280,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.teal.shade200,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                            'Registration Date: ${currentUser!.profile!.regDate.toString().substring(0, 10)}'),
                                        Text('Valid until: 2021-12-31'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 250,
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
                                    context
                                        .read<LoginBloc>()
                                        .add(LogoutPressedEvent());
                                  },
                                  child: const Text(
                                    'LOGOUT',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
