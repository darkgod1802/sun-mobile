import 'package:mobile/src/incomes/domain/entities/income.entity.dart';

class IncomeModel extends IncomeEntity {
  IncomeModel({
    required super.description,
    required super.amount,
    required super.incomeType,
    required super.incomeDate,
    required super.userId,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['amount'] = amount;
    data['expenseType'] = incomeType;
    data['expenseDate'] = incomeDate.split('/').reversed.join('-');
    data['userId'] = userId;
    return data;
  }

  IncomeModel.fromEntity(IncomeEntity entity)
      : super(
          description: entity.description,
          amount: entity.amount,
          incomeType: entity.incomeType,
          incomeDate: entity.incomeDate,
          userId: entity.userId,
        );
}
