import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/models/stream_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/duration_format.dart';
import 'package:single_house/views/past_stream/cubit/past_stream_cubit.dart';
import 'package:single_house/views/past_stream/widgets/highlight_item.dart';
import 'package:single_house/widgets/loading_wrapper.dart';

class PastStreamView extends StatefulWidget {
  static const String name = 'PastStreamView';
  static PageRoute route(StreamModel streamModel) => RouterCore.createRoute(
        PastStreamView(streamModel: streamModel),
      );

  const PastStreamView({
    Key? key,
    required this.streamModel,
  }) : super(key: key);

  final StreamModel streamModel;

  @override
  State<PastStreamView> createState() => _PastStreamViewState();
}

class _PastStreamViewState extends State<PastStreamView> {
  final PastStreamCubit _cubit = PastStreamCubit();

  String substring(String original, {required int start, int? end}) {
    if (end == null) {
      return original.substring(start);
    }
    if (original.length < end) {
      return original.substring(start, original.length);
    }
    return original.substring(start, end);
  }

  @override
  Widget build(BuildContext context) {
    String streamTime = widget.streamModel.time;
    String firstPart = substring(streamTime, start: 0, end: 8);
    String secondPart = substring(streamTime, start: 11, end: 19);
    DateTime startStream = DateFormat("hh:mm:ss").parse(firstPart);
    DateTime endStream = DateFormat("hh:mm:ss").parse(secondPart);
    String durationStream = endStream.difference(startStream).toHms();

    return BlocProvider(
      create: (context) => _cubit..fetch(widget.streamModel),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
          title: Text(widget.streamModel.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpace.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSpace.xlg),
                Center(
                  child: Text(
                    durationStream,
                    style: AppTextStyles.veryLarge.white,
                  ),
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
                BlocBuilder<PastStreamCubit, PastStreamState>(
                  builder: (context, state) {
                    return LoadingWrapper(
                      isLoading: state.status == PastStreamStatus.loading,
                      child: buildHighligts(state),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildHighligts(PastStreamState state) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: state.highlights.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          HighlightItem(
            highlightModel: state.highlights[index],
          ),
          SizedBox(height: AppSpace.md),
        ],
      );
    },
  );
}
