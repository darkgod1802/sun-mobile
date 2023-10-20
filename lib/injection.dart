import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/src/expenses/data/repositories/expenses.repository_imp.dart';
import 'package:mobile/src/expenses/domain/repositories/expenses.repository.dart';
import 'package:mobile/src/expenses/presentation/bloc/expenses_bloc.dart';
import 'package:mobile/src/incomes/data/datasources/incomes.datasource.dart';
import 'package:mobile/src/incomes/data/repositories/incomes.repository_imp.dart';
import 'package:mobile/src/incomes/domain/repositories/incomes.repository.dart';
import 'package:mobile/src/incomes/presentation/bloc/incomes_bloc.dart';
import 'src/expenses/data/datasources/expenses.datasource.dart';
import 'src/historical_income/data/datasources/historical.datasource.dart';
import 'src/historical_income/data/repositories/historical.repository_imp.dart';
import 'src/historical_income/domain/repositories/historical.repository.dart';
import 'src/historical_income/presentation/bloc/historical_bloc.dart';

class Injector {
  static GetIt? _instance;
  static GetIt get getIt =>
      _instance == null ? _instance = GetIt.I : _instance!;
  static getItBloc<T extends Bloc>() => _instance!<T>();

  initInjector() {
    Injector.getIt;
    return [
      /// Injector expense

      getIt.registerFactory(() => ExpensesBloc(_instance!())),
      getIt.registerFactory(() => ExpensesDataSource()),
      getIt.registerLazySingleton<ExpensesRepository>(
        () => ExpensesRepositoryImpl(_instance!()),
      ),

      /// Injector income

      getIt.registerFactory(() => IncomesBloc(_instance!())),
      getIt.registerFactory(() => IncomesDataSource()),
      getIt.registerLazySingleton<IncomesRepository>(
        () => IncomesRepositoryImpl(_instance!()),
      ),

      /// Injecto Histical

      getIt.registerFactory(() => HistoricalBloc(_instance!())),
      getIt.registerLazySingleton<HistoricalDataSource>(
        () => HistoricalServices(),
      ),
      getIt.registerLazySingleton<HistoricalRepository>(
        () => HistoricalRepositoryImpl(_instance!()),
      ),
    ];
  }
}
