import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroller/features/featuers/presentation/pages/screen.dart';
import 'features/featuers/presentation/Cubits/MyCubit/my_cubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MyCubitCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: AnimatedSplashScreen(
          backgroundColor: Color.fromARGB(255, 32, 32, 32),
          nextScreen: chatscreen(),
          centered: true,
          animationDuration: Duration(milliseconds: 700),
          duration: 10000,
          splash: CircleAvatar(
            radius: 40,
            child: Image(
                image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/024/558/811/original/openai-chatgpt-logo-icon-free-png.png")),
          ),
        ),
      ),
    );
  }
}
