import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/models/stream_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/past_stream/widgets/highlight_item.dart';

class PastStreamView extends StatelessWidget {
  static const String name = 'PastStreamView';
  static PageRoute route(StreamModel streamModel) => RouterCore.createRoute(
        PastStreamView(streamModel: streamModel),
      );

  const PastStreamView({
    Key? key,
    required this.streamModel,
  }) : super(key: key);

  final StreamModel streamModel;

  List<HighlightModel> get highlightList => List.generate(
      20, (index) => HighlightModel(time: '04:15:10', isAfk: true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(streamModel.name),
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
                  '04:15:10',
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
