extension DurationFormat on Duration {
  String toHms() {
    String hours = inHours.toString().padLeft(2, '0');
    String minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = inSeconds.remainder(60).toString().padLeft(2, '0');

    String result = '$hours:$minutes:$seconds';
    return result;
  }
}
