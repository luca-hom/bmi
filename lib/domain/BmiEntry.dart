class BmiEntry {
  final String user;
  final double value;
  final String date;

  const BmiEntry({
    required this.user,
    required this.value,
    required this.date,
});

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'value': value,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'BmiEntry{user: $user, value: $value, date: $date}';
  }
}

