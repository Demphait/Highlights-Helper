import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/auth/forgot_pass_view.dart';
import 'package:single_house/views/auth/sign_up_view.dart';
import 'package:single_house/views/main/main_view.dart';
import 'package:single_house/widgets/app_passfield.dart';
import 'package:single_house/widgets/app_textfield.dart';

class LoginView extends StatefulWidget {
  static const String name = 'LoginView';
  static PageRoute route() => RouterCore.createRoute(
        const LoginView._(),
      );

  const LoginView._();

  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpace.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Login',
                style: AppTextStyles.regular.white,
              ),
              TextButton(
                onPressed: () => RouterCore.push(SignUpView.name),
                child: Text(
                  'Sign Up',
                  style: AppTextStyles.middleThin.red,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: AppSpace.def,
                right: AppSpace.def,
                bottom: MediaQuery.of(context).size.height * 0.1),
            child: const _FormWidget(),
          ),
        ),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          name: 'User Name',
          obscureText: false,
          controller: _loginTextController,
          iconSuffix: const SizedBox(height: 0),
        ),
        AppPassField(
          name: 'Password',
          textInputAction: TextInputAction.done,
          controller: _passwordTextController,
        ),
        const SizedBox(height: 32),
        Center(
          child: TextButton(
            onPressed: () => RouterCore.push(ForgotPassView.name),
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.mediumThin.lightGrey,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            style: AppButtonStyles.primaryRedButton(context),
            onPressed: () {
              RouterCore.push(MainView.name);
            },
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }
}
