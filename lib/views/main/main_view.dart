import 'package:flutter/material.dart';
import 'package:single_house/app/router/index.dart';
import 'package:single_house/models/stream_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/views/example/example_view.dart';
import 'package:single_house/views/main/widgets/stream_item.dart';
import 'package:single_house/views/main/widgets/stream_item_live.dart';

class MainView extends StatelessWidget {
  static const String name = 'MainView';
  static PageRoute route() => RouterCore.createRoute(
        const MainView._(),
      );

  const MainView._();

  const MainView({Key? key}) : super(key: key);

  List<StreamModel> get streams => List.generate(
      20,
      ((index) => StreamModel(
          name: 'Stream $index', date: '31.08.2021', time: '19:20 - 19:50')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpace.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpace.smd),
                  child: Row(
                    children: [
                      Text(
                        'Streams',
                        style: AppTextStyles.regular.white,
                      ),
                      const Spacer(),
                      IconButton(
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          RouterCore.push(
                            ExampleView.name,
                          );
                        },
                        icon: const Icon(Icons.add),
                        color: AppColors.white,
                        iconSize: 28,
                      ),
                    ],
                  ),
                ),
                const StreamItemLive(),
                SizedBox(height: AppSpace.md),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: streams.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        StreamItem(
                          streamModel: streams[index],
                        ),
                        SizedBox(height: AppSpace.md),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
