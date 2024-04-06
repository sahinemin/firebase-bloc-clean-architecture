import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:study/core/extension/date_format_extension.dart';
import 'package:study/core/extension/size_extension.dart';
import 'package:study/core/extension/snackbar_extension.dart';
import 'package:study/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:study/features/home/domain/entities/user_profile_entity.dart';
import 'package:study/features/home/presentation/bloc/home_bloc.dart';
import 'package:study/features/home/presentation/widgets/add_hobby_button.dart';
import 'package:study/features/home/presentation/widgets/log_out_button.dart';
import 'package:study/features/home/presentation/widgets/user_profile_info.dart';
import 'package:study/features/shared/widgets/custom_app_bar.dart';
import 'package:study/features/shared/widgets/custom_loading_indicator.dart';
import 'package:study/injection/injection_container.dart';

part '../widgets/custom_card.dart';

@immutable
final class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()
        ..add(GetUserProfileEvent(context.read<AuthenticationBloc>().user!)),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) => state is HomeFailure
          ? context.showCustomSnackBar(state.message)
          : null,
        builder: (context, state) {
          return Scaffold(
            appBar: const CustomAppBar(
              title: 'Home Page',
              actions: [
                LogOutButton(),
              ],
            ),
            body: switch (state) {
              HomeUserProfileLoaded() => CustomCard(state.userProfile),
              EnterUserProfileInformation() => const UserProfileInfo(),
              _ => const CustomLoadingIndicator(),
            },
            floatingActionButton: switch (state) {
              HomeUserProfileLoaded() => const AddHobbyButton(),
              _ => null,
            },
          );
        },
      ),
    );
  }
}
