import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/widgets/app_textfield.dart';

class AppPassField extends StatefulWidget {
  const AppPassField({
    Key? key,
    this.isHide = true,
    this.validator,
    this.textInputAction = TextInputAction.next,
    required this.controller,
    required this.name,
    required this.icon,
  }) : super(key: key);
  final bool isHide;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String name;
  final String icon;
  final TextInputAction textInputAction;

  @override
  State<AppPassField> createState() => _AppPassFieldState();
}

class _AppPassFieldState extends State<AppPassField> {
  bool _isHide = true;
  @override
  void initState() {
    _isHide = widget.isHide;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppTextField(
          name: widget.name.toUpperCase(),
          obscureText: _isHide,
          controller: widget.controller,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
        ),
        Positioned(
          right: 10,
          top: 30,
          child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              setState(() {
                _isHide = !_isHide;
              });
            },
            icon: _isHide
                ? Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.grey,
                  )
                : Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.grey,
                  ),
          ),
        ),
      ],
    );
  }
}
