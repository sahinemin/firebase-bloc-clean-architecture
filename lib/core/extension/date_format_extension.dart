extension DateFormatExtension on DateTime {
  String formatAsDMY() {
    final day = this.day < 10 ? '0${this.day}' : this.day;
    final month = this.month < 10 ? '0${this.month}' : this.month;
    return '$day/$month/$year';
  }
}
