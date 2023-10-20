import 'package:dio/dio.dart';

import '../models/expense.model.dart';

class ExpensesDataSource {
  Future<void> createExpense(ExpenseModel expenseModel) async {
    try {
      await Future.delayed(
        const Duration(seconds: 2),
      );
    } catch (e) {
      throw DioException(requestOptions: RequestOptions());
    }
  }
}
