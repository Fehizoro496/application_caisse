import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:intl/intl.dart';

String formatNumber(int number) {
  return NumberFormat.decimalPattern('fr_FR').format(number);
}

String getDay(DateTime date) {
  return DateFormat.EEEE().format(date);
}

String toLetter(int amount) {
  final words = amount.toFrench();
  return words[0].toUpperCase() + words.substring(1);
}
