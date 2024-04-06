part of '../widgets/add_hobby_button.dart';

mixin AddHobbyDialogMixin on State<AddHobbyDialog> {
  final _hobbyController = TextEditingController();
  final _hobbyFormKey = GlobalKey<FormState>();

  void addNewHobby(BuildContext context) {
    context.read<HomeBloc>().add(
          AddHobbyEvent(
            _hobbyController.text,
            (context.read<HomeBloc>().state as HomeUserProfileLoaded)
                .userProfile,
            _hobbyFormKey,
          ),
        );
    context.pop();
  }

  @override
  void dispose() {
    _hobbyController.dispose();
    _hobbyFormKey.currentState?.dispose();
    super.dispose();
  }
}
