import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/models/stream_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/example/example_view.dart';
import 'package:single_house/views/past_stream/past_stream_view.dart';

class StreamItem extends StatelessWidget {
  const StreamItem({
    Key? key,
    required this.streamModel,
  }) : super(key: key);
  final StreamModel streamModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 84,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSpace.def, vertical: AppSpace.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  streamModel.name,
                  style: AppTextStyles.medium.white,
                ),
                SizedBox(height: AppSpace.smd),
                Row(
                  children: [
                    Text(
                      streamModel.date,
                      style: AppTextStyles.secondary.grey,
                    ),
                    SizedBox(width: AppSpace.def),
                    Text(
                      streamModel.time,
                      style: AppTextStyles.secondary.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.grey,
            size: 18,
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // RouterCore.push(
                //   PastStreamView.name,
                //   context: context,
                //   argument: streamModel,
                // );
                RouterCore.push(ExampleView.name);
              },
            ),
          ),
        ),
      ],
    );
  }
}
