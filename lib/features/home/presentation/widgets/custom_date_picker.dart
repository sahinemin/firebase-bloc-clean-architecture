import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study/core/extension/date_format_extension.dart';
import 'package:study/core/extension/size_extension.dart';
import 'package:study/features/home/presentation/bloc/home_bloc.dart';

final class CustomDatePickerButton extends StatelessWidget {
  const CustomDatePickerButton({
    this.focusNode,
    super.key,
  });
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final dateOfBirthController =
        context.select((HomeBloc bloc) => bloc.dateOfBirthController);
    return TextButton(
      onFocusChange: (value) =>
          showDateSelectorOnFocused(value: value, context),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).unselectedWidgetColor,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        fixedSize: Size(context.width * 0.9, 75),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      onPressed: () => showDateSelector(context),
      child: dateOfBirthController == null
          ? const Text('Date of Birth')
          : Text(dateOfBirthController.formatAsDMY()),
    );
  }

  Future<void> showDateSelectorOnFocused(
    BuildContext context, {
    required bool value,
  }) async =>
      value ? showDateSelector(context) : null;

  Future<void> showDateSelector(BuildContext context) async {
    final result = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime(DateTime.now().year - 18),
    );
    if (result != null) {
      if (context.mounted) {
        context.read<HomeBloc>().add(AddBirthDayEvent(result));
        FocusScope.of(context).requestFocus(focusNode);
      }
    }
  }
}
