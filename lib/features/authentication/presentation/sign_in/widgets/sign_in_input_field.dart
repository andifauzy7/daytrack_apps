import 'package:daytrack_apps/features/authentication/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:daytrack_apps/features/main/presentation/main/page/main_page.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:daytrack_apps/shared/components/dt_text_field.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignInInputField extends StatefulWidget {
  const SignInInputField({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInInputField> createState() => _SignInInputFieldState();
}

class _SignInInputFieldState extends State<SignInInputField> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        BlocProvider.of<SignInBloc>(context).add(
          SignInEmailUnfocused(),
        );
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        BlocProvider.of<SignInBloc>(context).add(
          SignInPasswordUnfocused(),
        );
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Navigator.pushReplacementNamed(
            context,
            ConstantsValue.mainRoute,
          );
        }
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(StringValue.signInFailure),
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
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: CalculateSize.getWidth(28),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringValue.signInWelcome,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: ColorFamily.blackPrimary,
                  ),
            ),
            SizedBox(
              height: CalculateSize.getHeight(10),
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return DTTextField(
                  focusNode: _emailFocusNode,
                  textInputType: TextInputType.emailAddress,
                  errorText:
                      state.email.invalid ? StringValue.signInEmailError : null,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInEmailChanged(email: value),
                    );
                  },
                  type: DTTextFieldType.text,
                  hintText: StringValue.signInHintEmail,
                );
              },
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return DTTextField(
                  focusNode: _passwordFocusNode,
                  errorText: state.password.invalid
                      ? StringValue.signInPasswordError
                      : null,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInPasswordChanged(password: value),
                    );
                  },
                  type: DTTextFieldType.password,
                  hintText: StringValue.signInHintPassword,
                );
              },
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: CalculateSize.getHeight(12),
              ),
              child: RichText(
                text: TextSpan(
                  text: '${StringValue.signInHaventAccount} ',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: ColorFamily.greyPrimary,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: StringValue.signInCallHumanResource,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorFamily.tealPrimary,
                          ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
            DTElevatedButton(
                onPressed: () => context.read<SignInBloc>().add(
                      SignInFormSubmitted(),
                    ),
                text: StringValue.signInEntry,
                type: DTElevatedButtonType.primary),
          ],
        ),
      ),
    );
  }
}
