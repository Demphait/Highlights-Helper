import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/db/streams_db.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/models/stream_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/sp_core.dart';
import 'package:single_house/views/current_stream/cubit/current_stream_cubit.dart';
import 'package:single_house/views/current_stream/widgets/group_of_buttons.dart';
import 'package:single_house/views/main/cubit/stream_cubit.dart';
import 'package:single_house/views/main/main_view.dart';
import 'package:single_house/widgets/timer.dart';
import 'package:single_house/views/past_stream/widgets/highlight_item.dart';

class CurrentStreamView extends StatefulWidget {
  static const String name = 'CurrentStreamView';
  static PageRoute route(StreamModel streamModel) => RouterCore.createRoute(
        CurrentStreamView(streamModel: streamModel),
      );

  const CurrentStreamView({
    Key? key,
    required this.streamModel,
  }) : super(key: key);
  final StreamModel streamModel;

  @override
  State<CurrentStreamView> createState() => _CurrentStreamViewState();
}

class _CurrentStreamViewState extends State<CurrentStreamView> {
  List<HighlightModel> get highlightList => widget.streamModel.highlights;
  final CurrentStreamCubit _cubit = CurrentStreamCubit();
  final StreamCubit _streamCubit = StreamCubit();
  String get streamTime => widget.streamModel.time;
  DateTime get startStream => DateFormat("yy-MM-dd HH:mm:ss").parse(streamTime);

  bool isAfk = SpCore.getBoolAfk();

  void callback() {
    isAfk = !isAfk;
    SpCore.setBoolAfk(isAfk);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: WillPopScope(
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            centerTitle: true,
            title: Text(
              widget.streamModel.name,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            leading: IconButton(
                splashRadius: 18,
                onPressed: () async {
                  _streamCubit.addLiveStream(
                    timeStartStream: startStream,
                    highlights: widget.streamModel.highlights,
                    title: widget.streamModel.name,
                    streamModel: StreamsDB.getLivedStreams(),
                  );
                  RouterCore.push(MainView.name);
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpace.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSpace.xlg),
                TimerWidget(
                  startDateTime: startStream,
                  textStyle: AppTextStyles.veryLarge.white,
                ),
                SizedBox(height: AppSpace.def),
                GroupOfButtons(
                    highlightList: highlightList,
                    callback: callback,
                    highlightCallback: () {
                      _cubit.addHighlightMoment(startStream, highlightList);
                      _streamCubit.addLiveStream(
                        timeStartStream: startStream,
                        highlights: widget.streamModel.highlights,
                        title: widget.streamModel.name,
                        streamModel: StreamsDB.getLivedStreams(),
                      );
                    },
                    isAfk: isAfk,
                    afkCallBack: () {
                      _cubit.addAfk(startStream, highlightList, isAfk);
                      _streamCubit.addLiveStream(
                        timeStartStream: startStream,
                        highlights: widget.streamModel.highlights,
                        title: widget.streamModel.name,
                        streamModel: StreamsDB.getLivedStreams(),
                      );
                    },
                    addStreamCallBack: () {
                      _streamCubit.addStream(
                          startStream, highlightList, widget.streamModel.name);
                      SpCore.delBoolAfk();
                      SpCore.delStartAfk();
                    }),
                SizedBox(height: AppSpace.def),
                Padding(
                  padding: EdgeInsets.only(left: AppSpace.sm),
                  child: Text(
                    'Highlights:',
                    style: AppTextStyles.middle.white,
                  ),
                ),
                SizedBox(height: AppSpace.md),
                BlocBuilder<CurrentStreamCubit, HighlightModel>(
                    builder: (context, state) {
                  return buildHighlightList(highlightList, _cubit);
                }),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          _streamCubit.addLiveStream(
            timeStartStream: startStream,
            highlights: widget.streamModel.highlights,
            title: widget.streamModel.name,
            streamModel: StreamsDB.getLivedStreams(),
          );
          RouterCore.push(MainView.name);
          return false;
        },
      ),
    );
  }

  Expanded buildHighlightList(
      List<HighlightModel> highlightList, CurrentStreamCubit cubit) {
    return Expanded(
      child: ListView.builder(
        itemCount: highlightList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              HighlightItem(
                highlightModel: highlightList[index],
                deleteHighlight: () =>
                    cubit.deleteHighlight(highlightList, index),
              ),
              SizedBox(height: AppSpace.md),
            ],
          );
        },
      ),
    );
  }
}
