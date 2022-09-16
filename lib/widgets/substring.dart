String substring(String original, {required int start, int? end}) {
  if (end == null) {
    return original.substring(start);
  }
  if (original.length < end) {
    return original.substring(start, original.length);
  }
  return original.substring(start, end);
}
