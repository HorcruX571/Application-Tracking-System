class Applicant {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String position;

  Applicant({
    this.id = '',
    required this.name,
    required this.email,
    required this.phone,
    required this.position,
  });

  factory Applicant.fromMap(Map<String, dynamic> data) {
    return Applicant(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      position: data['position'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'position': position,
    };
  }
}
