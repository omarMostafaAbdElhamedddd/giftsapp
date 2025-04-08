class UserDataModel {
  final String name;
  final String email;
  final int friends;
  final dynamic balance;
  final int requests;
  final String image;

  UserDataModel({
    required this.name,
    required this.email,
    required this.balance,
    required this.friends,
    required this.requests,
    required this.image,
  });

  factory UserDataModel.fromJson(data) {
    return UserDataModel(
        name: data['name'],
        email: data['email'],
        balance: data['balance'] ?? 2700.000,
        friends: data['friends'] ?? 30,
        image: data['image']??'',
        requests: data['requests'] ?? 40);

  }

  @override
  String toString() {
    return 'UserDataModel(name:$name,email:$email,balance:$balance,friends : $friends,requests:$requests ,image:$image )';
  }
}
