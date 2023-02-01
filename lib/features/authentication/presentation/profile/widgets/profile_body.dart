import 'package:daytrack_apps/features/authentication/presentation/profile/bloc/profile_bloc.dart';
import 'package:daytrack_apps/shared/components/error_result_widget.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(
      ProfileFetchData(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return ProfileInformation(
            name: state.user.name,
            email: state.user.email,
            avatar: state.user.avatar,
            onEdit: () {
              Navigator.pushNamed(
                context,
                ConstantsValue.editProfileRoute,
                arguments: state.user,
              ).then(
                (value) => BlocProvider.of<ProfileBloc>(context).add(
                  ProfileFetchData(),
                ),
              );
            },
          );
        }

        if (state is ProfileError) {
          ErrorResultWidget(
            errorMessage: state.errorMessage,
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
