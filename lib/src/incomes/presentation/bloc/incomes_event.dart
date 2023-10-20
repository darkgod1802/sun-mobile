part of 'incomes_bloc.dart';

sealed class IncomesEvent {
  const IncomesEvent();
}

class IncomesCreated extends IncomesEvent {
  final IncomeModel incomeForm;

  const IncomesCreated({
    required this.incomeForm,
  });
}
