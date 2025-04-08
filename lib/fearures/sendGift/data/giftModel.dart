
class GiftModel{
  final int id ;
  final String name;
  final String amount;
  final String image;
  final String content;
  final dynamic type_id;

  GiftModel( {
    required this.name,
    required this.image,
    required this.amount,
    required this.content,
   required this.type_id,
    required this.id
});

  factory GiftModel.fromJson(data){
    return GiftModel(
      id: data['id'],
        name: data['name'],
        image: data['image'],
        amount: data['price'] ?? '100',
        content: data['content'],
        type_id: data['type_id,']
    );
  }
  @override
  String toString() {
    return 'GiftModel(name: $name,image: $image,content: $content ,type_id : $type_id ,amount : $amount)';
  }

}