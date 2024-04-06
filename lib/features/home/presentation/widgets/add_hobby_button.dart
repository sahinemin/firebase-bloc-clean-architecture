import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:study/features/home/presentation/bloc/home_bloc.dart';
import 'package:study/features/shared/widgets/custom_form_field.dart';

part '../mixins/add_hobby_button_mixin.dart';
part 'add_hobby_dialog.dart';

@immutable
final class AddHobbyButton extends StatelessWidget {
  const AddHobbyButton( {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('Add Hobby'),
      onPressed: () => showDialog<AddHobbyDialog>(
        context: context,
        builder: (dialogContext) => AddHobbyDialog(
          upperContext: context,
        ),
      ),
    );
  }
}
