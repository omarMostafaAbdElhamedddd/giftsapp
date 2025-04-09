

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image
});

  factory UserModel.fromJson(data){
    return UserModel(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        phone: data['mobile'],
        image: data['image'] ?? ''
    );
  }




}