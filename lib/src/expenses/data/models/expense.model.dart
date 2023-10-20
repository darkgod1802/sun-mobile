import 'package:mobile/src/expenses/domain/entities/expense.entity.dart';

class ExpenseModel extends ExpenseEntity {
  ExpenseModel({
    required super.description,
    required super.amount,
    required super.expenseType,
    required super.expenseDate,
    required super.userId,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['amount'] = amount;
    data['expenseType'] = expenseType;
    data['expenseDate'] = expenseDate.split('/').reversed.join('-');
    data['userId'] = userId;
    return data;
  }

  ExpenseModel.fromEntity(ExpenseEntity entity)
      : super(
          description: entity.description,
          amount: entity.amount,
          expenseType: entity.expenseType,
          expenseDate: entity.expenseDate,
          userId: entity.userId,
        );
}
