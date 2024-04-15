import 'dart:developer';

extension StringExtention on String? {
  String checkNull() {
    return this ?? "";
  }
}

extension StringDateExtention on String {
  DateTime toDate() {
    List<int> list = [];
    if (contains("-")) {
      split("-").forEach((element) {
        list.add(int.parse(element));
      });
    } else if (contains("/")) {
      split("/").forEach((element) {
        list.add(int.parse(element));
      });
    }
    if (list.length == 3) {
      return DateTime(list[0], list[1], list[2]);
    } else {
      return DateTime.now();
    }
  }
}

extension IntExtention on int? {
  int checkNull() {
    return this ?? 0;
  }
}

extension DoubleExtention on double? {
  double checkNull() {
    return this ?? 0.0;
  }
}

extension BoolExtention on bool? {
  bool checkNull() {
    return this ?? false;
  }
}

extension DateExtention on DateTime? {
  DateTime checkNull() {
    return this ?? DateTime.now();
  }
}

extension DateTime2Extention on DateTime {
  toDateString() {
    return "$year/$month/$day";
  }

  toTime() {
    log(toString(), name: "DATETIME");
    log(toString().substring(11, 16), name: "DATETIME");
    return toString().substring(11, 16);
  }

  String toTimeWithoutSeconds() {
    return toUtc().toString().substring(11, 15);
  }
}
