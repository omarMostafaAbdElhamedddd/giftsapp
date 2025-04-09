class UserDataModel {
  final int id ;
  final String name;
  final String email;
  final int friends;
  final dynamic balance;
  final int requests;
  final String image;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.balance,
    required this.friends,
    required this.requests,
    required this.image,
  });

  factory UserDataModel.fromJson(data) {
    return UserDataModel(
      id: data['id'],
        name: data['name'],
        email: data['email'],
        balance: data['balance'] ?? 0.0,
        friends: data['friends'] ?? 30,
        image: data['image']??'',
        requests: data['requests'] ?? 40);

  }

  @override
  String toString() {
    return 'UserDataModel(id: $id, name:$name,email:$email,balance:$balance,friends : $friends,requests:$requests ,image:$image )';
  }
}
