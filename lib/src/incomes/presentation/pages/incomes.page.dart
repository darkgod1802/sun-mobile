import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/incomes/data/models/income.model.dart';
import 'package:mobile/src/incomes/presentation/bloc/incomes_bloc.dart';
import 'package:mobile/src/shared/loading.dart';
import 'package:mobile/src/shared/app_bar_minimal.widget.dart';
import '../../../../injection.dart';
import '../../../../commons/info.dart';
import '../../../shared/components/sun_button/sun_button.dart';
import '../../../shared/components/sun_field/date/sun_date_field.dart';
import '../../../shared/components/sun_field/selection/sun_selection_field.dart';
import '../../../shared/components/sun_field/text/sun_text_field.dart';
import '../../../shared/components/sun_text/sun_text.dart';
import '../../../shared/dialog.dart';

class IncomesPage extends StatefulWidget {
  const IncomesPage({super.key});

  @override
  State<IncomesPage> createState() => _IncomesPageState();
}

class _IncomesPageState extends State<IncomesPage> {
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerDestination = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String, String> optionMap = {
    'Interest': 'Interés',
    'Salary': 'Salario',
  };

  @override
  void initState() {
    super.initState();
    _controllerDate.text = 'Seleccionar Fecha';
  }

  updateDateField(String newValue) {
    setState(() {
      _controllerDate.text = newValue;
    });
  }

  updateSelectionField(dynamic newValue) {
    setState(() {
      _controllerDestination.text = newValue;
    });
  }

  String getKey(String value) {
    return optionMap.keys.lastWhere(
      (element) => optionMap[element] == value,
      orElse: () => 'VariousIncomes',
    );
  }

  @override
  void dispose() {
    _controllerDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loading = LoadingWidget(context);

    return Scaffold(
      appBar: AppBarMinimal(
        textTitle: 'Registro de Ingresos',
        onLeftIconTap: () => Navigator.pop(context),
      ),
      body: BlocProvider<IncomesBloc>(
          create: (_) => Injector.getItBloc<IncomesBloc>(),
          child: BlocListener<IncomesBloc, IncomesState>(
              listener: (context, state) async {
                switch (state.status) {
                  case IncomesStatus.success:
                    loading.hideOverlay();
                    bool? clear = await showDialogPopUpSuccess(context);
                    if (clear != null && clear) {
                      clearData();
                    }
                  case IncomesStatus.failure:
                    loading.hideOverlay();
                    // ignore: use_build_context_synchronously
                    showDialogPopUpFailure(context);
                }
              },
              child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                      key: _formKey,
                      child: CustomScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          slivers: [
                            SliverFillRemaining(
                              hasScrollBody: false,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SunText(
                                    text:
                                        'Ingresa la informacion que desea registrar \n*Campos requeridos',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!,
                                  ),
                                  const SizedBox(height: 24),
                                  SunText(
                                      text: 'Descripcion de Ingreso*',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!),
                                  SunTextField(
                                    controller: _controllerDescription,
                                    validator: (value) {
                                      if (value == '' || value!.isEmpty) {
                                        return '*';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 24),
                                  SunText(
                                      text: 'Destino',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!),
                                  const SizedBox(height: 22),
                                  SunSelectionField(
                                    optionMap: optionMap,
                                    controller: _controllerDestination,
                                    voidCallback: updateSelectionField,
                                    hintText:
                                        'Seleccionar una Fuente de Ingresos',
                                  ),
                                  const SizedBox(height: 24),
                                  SunText(
                                      text: 'Monto',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!),
                                  SunTextField(
                                    controller: _controllerAmount,
                                    keyboardType: TextInputType.number,
                                  ),
                                  const SizedBox(height: 24),
                                  SunText(
                                      text: 'Fecha',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!),
                                  SunDateField(
                                    controller: _controllerDate,
                                    voidCallback: updateDateField,
                                  ),
                                  const Spacer(),
                                  Builder(
                                    builder: (context) {
                                      return SunButton(
                                        title: 'Comenzar',
                                        colorTitle: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        onPressed: () {
                                          if (!_formKey.currentState!
                                              .validate()) return;
                                          loading.showOverlay();
                                          final incomeForm = IncomeModel(
                                            description:
                                                _controllerDescription.text,
                                            amount: double.parse(
                                              _controllerAmount.text.isEmpty
                                                  ? '0'
                                                  : _controllerAmount.text,
                                            ),
                                            incomeType: getKey(
                                                _controllerDestination.text),
                                            incomeDate: _controllerDate.text,
                                            userId: Info.userId,
                                          );
                                          context.read<IncomesBloc>().add(
                                                IncomesCreated(
                                                    incomeForm: incomeForm),
                                              );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ]))))),
    );
  }

  void clearData() {
    _controllerDescription.clear();
    _controllerDestination.clear();
    _controllerAmount.clear();
    _controllerDate.clear();
  }
}
