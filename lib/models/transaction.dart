class Transaction {
  final String id;
  final String title;
  final String from;
  final String to;
  final double amount;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.from,
      required this.to});
}
