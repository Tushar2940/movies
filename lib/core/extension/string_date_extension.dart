import 'package:intl/intl.dart';

extension DateFormatter on String {
  String toFormattedDate() {
    try {
      // Parse the input date assuming it's in 'yyyy-MM-dd' format
      DateTime parsedDate = DateTime.parse(this);

      // Format the date in 'dd-MM-yyyy' format
      return DateFormat('dd-MM-yyyy').format(parsedDate);
    } catch (e) {
      // Handle error if the string is not a valid date
      return 'Invalid Date';
    }
  }
}
