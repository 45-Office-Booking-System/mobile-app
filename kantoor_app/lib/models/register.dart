class Register {
  final String email;
  final String name;
  final String fullname;
  final String alamat;
  final String phone;
  final String password;

  Register({
    required this.email,
    required this.name,
    required this.fullname,
    required this.alamat,
    required this.phone,
    required this.password,
  });

  static Map<String, dynamic> toJson(Register register) => {
        "email": register.email,
        "name": register.name,
        "fullname": register.fullname,
        "alamat": register.alamat,
        "phone": register.phone,
        "password": register.password
      };
}
