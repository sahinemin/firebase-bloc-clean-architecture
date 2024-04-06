part of '../widgets/user_profile_info.dart';

mixin UserProfileInfoMixin on State<UserProfileInfo> {
  final _fullNameController = TextEditingController();
  final _biographyController = TextEditingController();
  final _userProfileInfoFormKey = GlobalKey<FormState>();
  final _biographyFocusNode = FocusNode();

  void createUser() {
    return context.read<HomeBloc>().add(
          CreateUserProfileEvent(
            _fullNameController.text,
            _biographyController.text,
            _userProfileInfoFormKey,
          ),
        );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _biographyController.dispose();
    _userProfileInfoFormKey.currentState?.dispose();
    _biographyFocusNode.dispose();
    super.dispose();
  }
}
