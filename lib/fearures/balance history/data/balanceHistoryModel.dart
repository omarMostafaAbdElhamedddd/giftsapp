
class BalanceHistoryModel {
  final String amount;
  final String date;

  BalanceHistoryModel({required this.amount, required this.date});

  factory BalanceHistoryModel.fromjson(data) {
    return BalanceHistoryModel(amount: data['amount'] ?? '100', date: data['created_at'] ??'2025-11-10');
  }
}
