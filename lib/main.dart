import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/bloc_observer.dart';
import 'package:tic_tac_toe/home_page.dart';

void main() {
  BlocOverrides.runZoned(
    (() => runApp(const MyApp())),
    blocObserver: AppBlocObserver(),
  );
  ;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage.provider(context),
    );
  }
}
