class BmiEntry {
  final int id;
  final String user;
  final double value;
  final String date;

  const BmiEntry({
    required this.id,
    required this.user,
    required this.value,
    required this.date,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
      'value': value,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'BmiEntry{id: $id, user: $user, value: $value, date: $date}';
  }
}

