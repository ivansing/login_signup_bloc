import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/bloc/app/app_bloc.dart';
import 'package:flutter_firebase_login/repositories/authentication_repository.dart';
import 'package:flutter_firebase_login/theme.dart';


class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;

  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FlowBuilder<AppStatus>{
        state: context.select((AppBloc bloc) => bloc.state.status),
        
      },
    );
  }
}
