import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:study/core/extension/size_extension.dart';
import 'package:study/features/home/presentation/bloc/home_bloc.dart';
import 'package:study/features/home/presentation/widgets/custom_date_picker.dart';
import 'package:study/features/shared/widgets/custom_form_field.dart';

part '../mixins/user_profile_info_mixin.dart';

@immutable
final class UserProfileInfo extends StatefulWidget {
  const UserProfileInfo({
    super.key,
  });

  @override
  State<UserProfileInfo> createState() => _UserProfileInfoState();
}

final class _UserProfileInfoState extends State<UserProfileInfo>
    with UserProfileInfoMixin {
  @override
  Widget build(BuildContext context) {
    const userProfileInfoGap = Gap(20);
    return SingleChildScrollView(
      child: Form(
        key: _userProfileInfoFormKey,
        child: Center(
          child: Column(
            children: [
              Text(
                'Enter your profile information',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              CustomFormField(
                labelText: 'Full-Name',
                controller: _fullNameController,
                
              ),
              userProfileInfoGap,
              CustomDatePickerButton(
                focusNode: _biographyFocusNode,
              ),
              CustomFormField(
                focusNode: _biographyFocusNode,
                labelText: 'Biography',
                controller: _biographyController,
                height: context.height * 0.2,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => createUser(),
              ),
              userProfileInfoGap,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(context.width * 0.9, 50),
                ),
                onPressed: createUser,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
