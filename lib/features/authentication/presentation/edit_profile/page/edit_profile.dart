import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/features/authentication/presentation/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: BlocProvider(
        create: (_) => sl.get<EditProfileBloc>(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CalculateSize.getWidth(24),
            vertical: CalculateSize.getHeight(24),
          ),
          child: EditProfileInputField(user: user),
        ),
      ),
    );
  }
}
