import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/db/streams_db.dart';
import 'package:single_house/models/stream_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/current_stream/current_stream_view.dart';
import 'package:single_house/widgets/box_text.dart';
import 'package:single_house/widgets/timer.dart';

class StreamItemLive extends StatefulWidget {
  const StreamItemLive({
    Key? key,
    required this.streamModel,
  }) : super(key: key);

  final StreamModel streamModel;

  @override
  State<StreamItemLive> createState() => _StreamItemLiveState();
}

class _StreamItemLiveState extends State<StreamItemLive> {
  final streams = StreamsDB.getStreams();
  DateTime get startDateTime =>
      DateFormat("yyyy-MM-dd hh:mm:ss").parse(widget.streamModel.time);

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TimerWidget(
                          startDateTime: startDateTime,
                          textStyle: AppTextStyles.large.white),
                      const Spacer(),
                      TextBox(
                          text: 'Streaming',
                          textStyle: AppTextStyles.secondary.pink),
                    ],
                  ),
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          widget.streamModel.name,
                          style: AppTextStyles.mediumThin.white,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
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
                      argument: widget.streamModel);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
