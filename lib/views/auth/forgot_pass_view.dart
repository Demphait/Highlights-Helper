import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/widgets/app_textfield.dart';

class ForgotPassView extends StatefulWidget {
  static const String name = 'ForgotPassView';
  static PageRoute route() => RouterCore.createRoute(
        const ForgotPassView._(),
      );

  const ForgotPassView._();

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPassView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          'Reset your password',
          style: AppTextStyles.regular.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpace.def),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              const _ForgotPassWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForgotPassWidget extends StatefulWidget {
  const _ForgotPassWidget({Key? key}) : super(key: key);

  @override
  __ForgotPassWidgetState createState() => __ForgotPassWidgetState();
}

final _emailTextController = TextEditingController();

class __ForgotPassWidgetState extends State<_ForgotPassWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          name: 'Enter your email addres',
          textInputType: TextInputType.emailAddress,
          controller: _emailTextController,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Reset password'),
            style: AppButtonStyles.primaryRedButton(context),
          ),
        ),
      ],
    );
  }
}
