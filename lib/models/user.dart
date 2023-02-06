part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  const User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = const User(
    id: 1,
    name: 'Ical',
    email: 'haical31@gmail.com',
    address: 'Jl. Cibaduyut',
    houseNumber: '123',
    phoneNumber: '08123456789',
    city: 'Bandung',
    picturePath: 'assets/user_pic.png');
