import 'package:dio/dio.dart';
import 'package:mobile/src/incomes/data/models/income.model.dart';

class IncomesDataSource {
  Future<void> createIncome(IncomeModel expenseModel) async {
    try {
      await Future.delayed(
        const Duration(seconds: 2),
      );
    } catch (e) {
      throw DioException(requestOptions: RequestOptions());
    }
  }
}
