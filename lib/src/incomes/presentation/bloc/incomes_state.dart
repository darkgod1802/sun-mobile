part of 'incomes_bloc.dart';

enum IncomesStatus { success, failure }

class IncomesState {
  final IncomesStatus status;

  IncomesState({
    this.status = IncomesStatus.success,
  });

  IncomesState copyWith({IncomesStatus? status}) {
    return IncomesState(
      status: status ?? this.status,
    );
  }
}
