import 'package:mobile/src/expenses/data/datasources/expenses.datasource.dart';
import 'package:mobile/src/expenses/data/models/expense.model.dart';
import 'package:mobile/src/expenses/domain/entities/expense.entity.dart';
import 'package:mobile/src/expenses/domain/repositories/expenses.repository.dart';

class ExpensesRepositoryImpl implements ExpensesRepository {
  final ExpensesDataSource _service;

  ExpensesRepositoryImpl(this._service);

  @override
  Future<void> createExpense(ExpenseEntity expense) {
    return _service.createExpense(ExpenseModel.fromEntity(expense));
  }
}
