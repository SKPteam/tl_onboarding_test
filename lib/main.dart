import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_test/app/modules%20/authentication/bloc/login_bloc.dart';
import 'package:flutter_firebase_test/app/modules%20/authentication/presentation/pages/login_screen.dart';
import 'package:flutter_firebase_test/app/modules%20/bottomnavbar/bloc/create_chat_bloc.dart';
import 'package:flutter_firebase_test/app/modules%20/bottomnavbar/domain/service/create_chat_service.dart';

import 'app/modules /authentication/domain/service/authentication_service.dart';
import 'app/modules /conversation/domain/bloc/topic_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TopicBloc>(
          create: (context) => TopicBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(AuthService()),
        ),
        BlocProvider<CreateChatBloc>(
          create: (context) => CreateChatBloc(CreateChatService()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
