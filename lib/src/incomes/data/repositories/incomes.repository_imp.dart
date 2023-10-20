import 'package:mobile/src/incomes/data/datasources/incomes.datasource.dart';
import 'package:mobile/src/incomes/data/models/income.model.dart';
import 'package:mobile/src/incomes/domain/entities/income.entity.dart';
import 'package:mobile/src/incomes/domain/repositories/incomes.repository.dart';

class IncomesRepositoryImpl implements IncomesRepository {
  final IncomesDataSource _service;

  IncomesRepositoryImpl(this._service);

  @override
  Future<void> createIncome(IncomeEntity income) {
    return _service.createIncome(IncomeModel.fromEntity(income));
  }
}
