class IncomeEntity {
  final String description;
  final double amount;
  final String incomeType;
  final String incomeDate;
  final int userId;

  IncomeEntity({
    required this.description,
    required this.amount,
    required this.incomeType,
    required this.incomeDate,
    required this.userId,
  });
}
