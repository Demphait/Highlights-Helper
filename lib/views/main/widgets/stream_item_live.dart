import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/db/streams_db.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/duration_format.dart';
import 'package:single_house/views/current_stream/current_stream_view.dart';
import 'package:single_house/widgets/box_text.dart';

class StreamItemLive extends StatefulWidget {
  const StreamItemLive({
    Key? key,
    required this.startDateTime,
  }) : super(key: key);

  final DateTime startDateTime;

  @override
  State<StreamItemLive> createState() => _StreamItemLiveState();
}

class _StreamItemLiveState extends State<StreamItemLive> {
  final streams = StreamsDB.getStreams();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.sm),
      child: Stack(
        children: [
          Container(
            height: 112,
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
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
                  Row(
                    children: [
                      Text(
                        DateTime.now().difference(widget.startDateTime).toHms(),
                        style: AppTextStyles.large.white,
                      ),
                      const Spacer(),
                      TextBox(
                          text: 'Streaming',
                          textStyle: AppTextStyles.secondary.pink),
                    ],
                  ),
                  SizedBox(height: AppSpace.def),
                  Row(
                    children: [
                      SizedBox(
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                        height: AppSpace.smd,
                        width: AppSpace.smd,
                      ),
                      SizedBox(width: AppSpace.smd),
                      Text(
                        'Stream ${streams.length + 1}',
                        style: AppTextStyles.mediumThin.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  RouterCore.push(CurrentStreamView.name,
                      argument: DateTime.now());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
