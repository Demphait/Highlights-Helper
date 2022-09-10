import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:single_house/models/highlight_model.dart';
import 'package:single_house/utils/duration_format.dart';

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
    final prefs = await SharedPreferences.getInstance();

    Future<void> buildAfk(bool isAfk) async {
      String? startAfk = prefs.getString('startAfk');
      if (startAfk == null) {
        startAfk = DateTime.now().difference(startDateTime).toHms();
        await prefs.setString('startAfk', startAfk);
      }

      if (isAfk == false) {
        String endAfk = DateTime.now().difference(startDateTime).toHms();

        highlightList.insert(
            0, HighlightModel(time: '$startAfk - $endAfk', isAfk: true));
        await prefs.remove('startAfk');
      }
    }

    buildAfk(isAfk);
    emit(HighlightModel(time: '', isAfk: true));
  }
}
