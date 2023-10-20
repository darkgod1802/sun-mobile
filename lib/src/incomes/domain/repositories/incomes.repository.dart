import 'package:mobile/src/incomes/domain/entities/income.entity.dart';

abstract class IncomesRepository {
  Future<void> createIncome(IncomeEntity income);
}
