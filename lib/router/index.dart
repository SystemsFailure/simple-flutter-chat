import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppRoute { home, profile, settings }

class AppBloc extends Bloc<AppRoute, dynamic> {
  AppBloc() : super(AppRoute.home);

  @override
  Stream<dynamic> mapEventToState(AppRoute event) async* {
    yield event;
  }
}