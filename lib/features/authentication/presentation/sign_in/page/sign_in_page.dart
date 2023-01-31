import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/authentication/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SignInHeader(),
      body: BlocProvider(
        create: (_) => sl.get<SignInBloc>(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SignInImage(),
                SignInInputField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
