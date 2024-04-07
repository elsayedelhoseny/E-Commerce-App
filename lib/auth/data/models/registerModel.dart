class RegistrationResponse {
  final String message;
  final RegistrationData data;

  RegistrationResponse({required this.message, required this.data});

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      message: json['message'],
      data: RegistrationData.fromJson(json['data']),
    );
  }
}

class RegistrationData {
  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;

  RegistrationData({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  factory RegistrationData.fromJson(Map<String, dynamic> json) {
    return RegistrationData(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      id: json['id'],
      image: json['image'],
      token: json['token'],
    );
  }
}
