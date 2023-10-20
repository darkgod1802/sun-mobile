class ExpenseEntity {
  final String description;
  final double amount;
  final String expenseType;
  final String expenseDate;
  final int userId;

  ExpenseEntity({
    required this.description,
    required this.amount,
    required this.expenseType,
    required this.expenseDate,
    required this.userId,
  });
}
