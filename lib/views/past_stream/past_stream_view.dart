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
import 'package:single_house/widgets/substring.dart';

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
          leading: IconButton(
              splashRadius: 18,
              onPressed: () => RouterCore.pop(),
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.streamModel.name,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpace.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSpace.def),
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
                    'Highlights:',
                    style: AppTextStyles.middle.white,
                  ),
                ),
                SizedBox(height: AppSpace.md),
                BlocBuilder<PastStreamCubit, PastStreamState>(
                  builder: (context, state) {
                    return LoadingWrapper(
                      isLoading: state.status == PastStreamStatus.loading,
                      child: _buildHighligts(
                          state, _cubit, widget.streamModel, context),
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

Widget _buildHighligts(PastStreamState state, PastStreamCubit cubit,
    StreamModel stream, BuildContext context) {
  if (state.status != PastStreamStatus.loading && state.highlights.isEmpty) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
      child: Text(
        'Highlights not found',
        style: TextStyle(color: AppColors.white, fontSize: 18),
      ),
    ));
  }
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: state.highlights.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          HighlightItem(
            highlightModel: state.highlights[index],
            deleteHighlight: () => cubit.deleteHighlight(stream, index),
          ),
          SizedBox(height: AppSpace.md),
        ],
      );
    },
  );
}
