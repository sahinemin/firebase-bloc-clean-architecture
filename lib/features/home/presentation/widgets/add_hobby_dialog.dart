part of 'add_hobby_button.dart';

@immutable
final class AddHobbyDialog extends StatefulWidget {
  const AddHobbyDialog({
    required this.upperContext,
    super.key,
  });
  final BuildContext upperContext;
  @override
  State<AddHobbyDialog> createState() => _AddHobbyDialogState();
}

final class _AddHobbyDialogState extends State<AddHobbyDialog>
    with AddHobbyDialogMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>.value(
      value: widget.upperContext.read<HomeBloc>(),
      child: Dialog(
        child: Form(
          key: _hobbyFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(30),
              Text(
                'Add your hobby',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Gap(30),
              CustomFormField(
                autoFocus: true,
                labelText: 'Hobby',
                controller: _hobbyController,
                textInputAction: TextInputAction.send,
                onFieldSubmitted: (_) => addNewHobby(widget.upperContext),
              ),
              const Gap(15),
              TextButton(
                onPressed: () => addNewHobby(widget.upperContext),
                child: const Text('Add'),
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
