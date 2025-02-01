class Patient {
  final String name;
  final String package;
  final String date;
  final String staff;
  final String button;

  Patient({
    required this.name,
    required this.package,
    required this.date,
    required this.staff,
    required this.button,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      name: json['name'],
      package: json['package'],
      date: json['date'],
      staff: json['staff'],
      button: json['button'],
    );
  }
}
