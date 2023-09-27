import 'package:agg/bloc/InternetCubit.dart';
import 'package:agg/bloc/LoginCubit/LoginCubit.dart';
import 'package:agg/bloc/PostsCubit/post_Cubit.dart';
import 'package:agg/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'repository/authRepository/authRepo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();
    return
         BlocProvider(
          create: (context) => LoginCubit(authRepository),
          child: BlocProvider(
            create: (context) => PostCubit(),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home:  Login(),
            ),
          ),
    );
  }
}

