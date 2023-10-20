import 'package:mobile/src/expenses/domain/entities/expense.entity.dart';

abstract class ExpensesRepository {
  Future<void> createExpense(ExpenseEntity expense);
}
