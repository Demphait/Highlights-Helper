import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/app/router/index.dart';
import 'package:single_house/db/streams_db.dart';
import 'package:single_house/models/stream_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/current_stream/current_stream_view.dart';
import 'package:single_house/views/main/cubit/stream_cubit.dart';
import 'package:single_house/views/main/widgets/stream_item.dart';
import 'package:single_house/views/main/widgets/stream_item_live.dart';
import 'package:single_house/widgets/dialog.dart';
import 'package:single_house/widgets/loading_wrapper.dart';

class MainView extends StatefulWidget {
  static const String name = 'MainView';
  static PageRoute route() => RouterCore.createRoute(
        const MainView._(),
      );

  const MainView._();

  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final StreamCubit _cubit = StreamCubit();
  final TextEditingController textEditingController = TextEditingController();
  final liveStream = StreamsDB.getLivedStreams();
  final RegExp regExp = RegExp(r'.*[^ ].*');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..fetch(),
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpace.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSpace.smd, horizontal: AppSpace.md),
                      child: Row(
                        children: [
                          Text(
                            'Streams',
                            style: AppTextStyles.regular.white,
                          ),
                          const Spacer(),
                          liveStream == null
                              ? IconButton(
                                  splashRadius: 18,
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    showTextField(
                                      context: context,
                                      title: 'Enter a stream name',
                                      controller: textEditingController,
                                      callbackYes: () {
                                        if (textEditingController
                                                .text.isNotEmpty &&
                                            regExp.hasMatch(
                                                textEditingController.text)) {
                                          RouterCore.push(
                                            CurrentStreamView.name,
                                            argument: StreamModel(
                                              name: textEditingController.text,
                                              date: DateTime.now().toString(),
                                              time: DateTime.now().toString(),
                                              highlights: [],
                                            ),
                                          );
                                          _cubit.addLiveStream(
                                            timeStartStream: DateTime.now(),
                                            highlights: [],
                                            title: textEditingController.text,
                                            streamModel:
                                                StreamsDB.getLivedStreams(),
                                          );
                                        } else {
                                          RouterCore.pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                'Enter a stream name',
                                              ),
                                              backgroundColor: AppColors.red,
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.add),
                                  color: AppColors.white,
                                  iconSize: 28,
                                )
                              : const SizedBox(height: 0),
                        ],
                      ),
                    ),
                    liveStream != null
                        ? StreamItemLive(
                            streamModel: liveStream!,
                          )
                        : const SizedBox(height: 0),
                    SizedBox(height: AppSpace.md),
                    BlocBuilder<StreamCubit, StreamState>(
                      builder: (context, state) {
                        return LoadingWrapper(
                          isLoading: state.status == StreamStatus.loading,
                          child: _buildStreams(state, _cubit, context),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildStreams(
    StreamState state, StreamCubit cubit, BuildContext context) {
  if (state.status != StreamStatus.loading && state.streams.isEmpty) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
      child: Text(
        'Streams not found',
        style: TextStyle(color: AppColors.white, fontSize: 18),
      ),
    ));
  }
  return ListView.builder(
    reverse: true,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: state.streams.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          StreamItem(
            streamModel: state.streams[index],
            deleteStream: () => cubit.deleteStream(index),
          ),
          SizedBox(height: AppSpace.md),
        ],
      );
    },
  );
}
