import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/widgets/app_passfield.dart';
import 'package:single_house/widgets/app_textfield.dart';

class SignUpView extends StatefulWidget {
  static const String name = 'SignUpView';
  static PageRoute route() => RouterCore.createRoute(
        const SignUpView._(),
      );

  const SignUpView._();

  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => RouterCore.pop(),
          splashRadius: 20,
        ),
        title: Text(
          'Sign Up',
          style: AppTextStyles.regular.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpace.def),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const _SignUpWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignUpWidget extends StatefulWidget {
  const _SignUpWidget({Key? key}) : super(key: key);

  @override
  __SignUpWidgetState createState() => __SignUpWidgetState();
}

final _loginTextController = TextEditingController();
final _passwordTextController = TextEditingController();
final _emailTextController = TextEditingController();

class __SignUpWidgetState extends State<_SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          name: 'User Name',
          obscureText: false,
          controller: _loginTextController,
        ),
        AppTextField(
          name: 'Email',
          obscureText: false,
          textInputType: TextInputType.emailAddress,
          controller: _emailTextController,
        ),
        AppPassField(
          name: 'Password',
          controller: _passwordTextController,
        ),
        AppPassField(
          name: 'Password',
          controller: _passwordTextController,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Create Account'),
            style: AppButtonStyles.primaryRedButton(context),
          ),
        ),
      ],
    );
  }
}
