import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/utils/duration_format.dart';
import 'package:single_house/utils/sp_core.dart';

class CurrentStreamCubit extends Cubit<HighlightModel> {
  CurrentStreamCubit()
      : super(HighlightModel(time: DateTime.now().toString(), isAfk: false));

  Future<void> addHighlightMoment(
      DateTime startDateTime, List<HighlightModel> highlightList) async {
    String time = DateTime.now().difference(startDateTime).toHms();
    highlightList.insert(0, HighlightModel(time: time, isAfk: false));
    emit(HighlightModel(time: time, isAfk: false));
  }

  Future<void> addAfk(DateTime startDateTime,
      List<HighlightModel> highlightList, bool isAfk) async {
    Future<void> buildAfk(bool isAfk) async {
      String? startAfk = SpCore.getStartAfk();
      if (startAfk == '') {
        startAfk = DateTime.now().difference(startDateTime).toHms();

        SpCore.setStartAfk(startAfk);
      }

      if (isAfk == false) {
        String endAfk = DateTime.now().difference(startDateTime).toHms();

        highlightList.insert(
            0, HighlightModel(time: '$startAfk - $endAfk', isAfk: true));

        SpCore.delStartAfk();
      }
    }

    buildAfk(isAfk);
    emit(HighlightModel(time: '', isAfk: true));
  }
}
