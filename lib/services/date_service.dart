import 'package:intl/intl.dart';
class DateService {
  String formatDate(String isoDate) {
    DateTime date = DateTime.parse(isoDate);
    DateTime now = DateTime.now();


    if (date.day == now.day &&
        date.month == now.month &&
        date.year == now.year) {
      return "aujourd'hui à ${DateFormat.Hm().format(date)}";
    }

    if (date.day == now.subtract(const Duration(days: 1)).day &&
        date.month == now.subtract(const Duration(days: 1)).month &&
        date.year == now.subtract(const Duration(days: 1)).year) {
      return 'hier à ${DateFormat.Hm().format(date)}';
    }

    return DateFormat('le dd/MM/yyyy à hh:mm').format(date);
  }
}
