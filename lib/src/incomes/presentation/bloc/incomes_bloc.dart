import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:mobile/src/incomes/domain/repositories/incomes.repository.dart';

import '../../data/models/income.model.dart';

part 'incomes_event.dart';
part 'incomes_state.dart';

class IncomesBloc extends Bloc<IncomesEvent, IncomesState> {
  final IncomesRepository _repository;
  IncomesBloc(this._repository) : super(IncomesState()) {
    on<IncomesCreated>(_onIncomesCreated);
  }

  Future<void> _onIncomesCreated(
    IncomesCreated event,
    Emitter emit,
  ) async {
    try {
      await _repository.createIncome(event.incomeForm);
      emit(state.copyWith(status: IncomesStatus.success));
    } on DioException catch (_) {
      emit(state.copyWith(status: IncomesStatus.failure));
    }
  }
}
