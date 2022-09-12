import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/db/streams_db.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/sp_core.dart';
import 'package:single_house/views/current_stream/cubit/current_stream_cubit.dart';
import 'package:single_house/views/current_stream/widgets/group_of_buttons.dart';
import 'package:single_house/views/main/cubit/stream_cubit.dart';
import 'package:single_house/widgets/timer.dart';
import 'package:single_house/views/past_stream/widgets/highlight_item.dart';

class CurrentStreamView extends StatefulWidget {
  static const String name = 'CurrentStreamView';
  static PageRoute route(DateTime startDateTime) => RouterCore.createRoute(
        CurrentStreamView(startDateTime: startDateTime),
      );

  const CurrentStreamView({
    Key? key,
    required this.startDateTime,
  }) : super(key: key);
  final DateTime startDateTime;

  @override
  State<CurrentStreamView> createState() => _CurrentStreamViewState();
}

class _CurrentStreamViewState extends State<CurrentStreamView> {
  List<HighlightModel> highlightList = [];
  final CurrentStreamCubit _cubit = CurrentStreamCubit();
  final StreamCubit _streamCubit = StreamCubit();
  final streams = StreamsDB.getStreams();
  bool isAfk = false;

  void callback() {
    isAfk = !isAfk;
  }

  @override
  void dispose() {
    SpCore.delStartAfk();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDateTime = DateTime.now();
    return BlocProvider(
      create: (context) => _cubit,
      child: WillPopScope(
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            centerTitle: true,
            title: Text('Stream ${streams.length + 1}'),
            leading: IconButton(
                onPressed: () async {
                  RouterCore.pop();
                  SpCore.delStartAfk();
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpace.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSpace.xlg),
                TimerWidget(
                  startDateTime: DateTime.now(),
                  textStyle: AppTextStyles.veryLarge.white,
                ),
                SizedBox(height: AppSpace.def),
                GroupOfButtons(
                  highlightList: highlightList,
                  callback: callback,
                  startDateTime: startDateTime,
                  highlightCallback: () =>
                      _cubit.addHighlightMoment(startDateTime, highlightList),
                  isAfk: isAfk,
                  afkCallBack: () =>
                      _cubit.addAfk(startDateTime, highlightList, isAfk),
                  addStreamCallBack: () =>
                      _streamCubit.addStream(startDateTime, highlightList),
                ),
                SizedBox(height: AppSpace.def),
                Padding(
                  padding: EdgeInsets.only(left: AppSpace.sm),
                  child: Text(
                    'Помітки',
                    style: AppTextStyles.middle.white,
                  ),
                ),
                SizedBox(height: AppSpace.md),
                BlocBuilder<CurrentStreamCubit, HighlightModel>(
                    builder: (context, state) {
                  return buildHighlightList(highlightList);
                }),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          SpCore.delStartAfk();
          return true;
        },
      ),
    );
  }

  Expanded buildHighlightList(List<HighlightModel> highlightList) {
    return Expanded(
      child: ListView.builder(
        itemCount: highlightList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              HighlightItem(
                highlightModel: highlightList[index],
              ),
              SizedBox(height: AppSpace.md),
            ],
          );
        },
      ),
    );
  }
}
