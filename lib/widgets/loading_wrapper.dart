import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/widgets/app_loader.dart';

class LoadingWrapper extends StatelessWidget {
  const LoadingWrapper({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            child: AppLoader(),
            color: AppColors.black.withOpacity(0.2),
          ),
      ],
    );
  }
}
