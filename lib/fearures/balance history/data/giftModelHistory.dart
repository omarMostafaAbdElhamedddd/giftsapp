
class GiftModelHistory{
  final int id ;
  final String name;
  // final String image;
  final String amount;
  final String phone;
  final String date;
  final String type;


  GiftModelHistory({
    required this.id,
    required this.name,
    // required this.image,
    required this.amount,
    required this.phone,
    required this.date,
    required this.type
});

  factory GiftModelHistory.fromJson(data){
    return GiftModelHistory(
        name: data['name'] ??'Omar Mostafa',
        // image: data['image'] ??'',
        amount: data['amount'] ??'100',
      phone: data['phone'] ??'01000000000',
      date: data['created_at'],
      type: data['type'],
      id: data['id']
    );
  }


}

