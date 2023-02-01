import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/authentication/domain/entities/user.dart';
import 'package:daytrack_apps/features/authentication/presentation/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:daytrack_apps/features/authentication/presentation/edit_profile/widgets/profile_avatar.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:daytrack_apps/shared/components/dt_text_field.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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

class EditProfileInputField extends StatefulWidget {
  const EditProfileInputField({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<EditProfileInputField> createState() => _EditProfileInputFieldState();
}

class _EditProfileInputFieldState extends State<EditProfileInputField> {
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EditProfileBloc>(context).add(
      EditProfileAvatarChanged(avatar: widget.user.avatar),
    );
    BlocProvider.of<EditProfileBloc>(context).add(
      EditProfileNameChanged(name: widget.user.name),
    );
    BlocProvider.of<EditProfileBloc>(context).add(
      EditProfilePasswordChanged(password: widget.user.password),
    );
    BlocProvider.of<EditProfileBloc>(context).add(
      EditProfileEmailChanged(email: widget.user.email),
    );
    _nameFocusNode.addListener(() {
      if (!_nameFocusNode.hasFocus) {
        BlocProvider.of<EditProfileBloc>(context).add(
          EditProfileNameUnfocused(),
        );
        FocusScope.of(context).requestFocus(_emailFocusNode);
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        BlocProvider.of<EditProfileBloc>(context).add(
          EditProfileEmailUnfocused(),
        );
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        BlocProvider.of<EditProfileBloc>(context).add(
          EditProfilePasswordUnfocused(),
        );
      }
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(StringValue.editProfileSuccess),
              ),
            );
        }
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(StringValue.editProfileFailure),
              ),
            );
        }
        if (state.status.isSubmissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(StringValue.signInLoading),
              ),
            );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileAvatar(
              avatar: widget.user.avatar,
              onChanged: (value) {
                BlocProvider.of<EditProfileBloc>(context).add(
                  EditProfileAvatarChanged(avatar: value),
                );
              },
            ),
            SizedBox(
              height: CalculateSize.getHeight(8),
            ),
            BlocBuilder<EditProfileBloc, EditProfileState>(
              builder: (context, state) {
                return DTTextField(
                  focusNode: _nameFocusNode,
                  initialValue: widget.user.name,
                  textInputType: TextInputType.name,
                  errorText: state.name.invalid
                      ? StringValue.editProfileNameError
                      : null,
                  onChanged: (value) {
                    BlocProvider.of<EditProfileBloc>(context).add(
                      EditProfileNameChanged(name: value),
                    );
                  },
                  type: DTTextFieldType.text,
                  hintText: StringValue.editProfileHintName,
                );
              },
            ),
            BlocBuilder<EditProfileBloc, EditProfileState>(
              builder: (context, state) {
                return DTTextField(
                  focusNode: _emailFocusNode,
                  initialValue: widget.user.email,
                  textInputType: TextInputType.emailAddress,
                  errorText:
                      state.email.invalid ? StringValue.signInEmailError : null,
                  onChanged: (value) {
                    BlocProvider.of<EditProfileBloc>(context).add(
                      EditProfileEmailChanged(email: value),
                    );
                  },
                  type: DTTextFieldType.text,
                  hintText: StringValue.signInHintEmail,
                );
              },
            ),
            BlocBuilder<EditProfileBloc, EditProfileState>(
              builder: (context, state) {
                return DTTextField(
                  initialValue: widget.user.password,
                  focusNode: _passwordFocusNode,
                  errorText: state.password.invalid
                      ? StringValue.signInPasswordError
                      : null,
                  onChanged: (value) {
                    BlocProvider.of<EditProfileBloc>(context).add(
                      EditProfilePasswordChanged(password: value),
                    );
                  },
                  type: DTTextFieldType.password,
                  hintText: StringValue.signInHintPassword,
                );
              },
            ),
            DTElevatedButton(
                onPressed: () => context.read<EditProfileBloc>().add(
                      EditProfileFormSubmitted(),
                    ),
                text: StringValue.editProfile,
                type: DTElevatedButtonType.primary),
          ],
        ),
      ),
    );
  }
}
