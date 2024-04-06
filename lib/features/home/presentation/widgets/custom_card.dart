part of '../pages/home_page.dart';

@immutable
final class CustomCard extends StatelessWidget {
  const CustomCard(
    this.userProfile, {
    super.key,
  });
  final UserProfileEntity userProfile;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        margin: EdgeInsets.only(
          top: context.height * 0.05,
          left: context.width * 0.03,
          right: context.width * 0.03,
          bottom: context.height * 0.15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(20),
              Text(
                'User Profile Information',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Gap(20),
              ListTile(
                title: const Text('Name'),
                subtitle: Text(userProfile.fullName),
              ),
              ListTile(
                title: const Text('Email'),
                subtitle: Text(userProfile.email),
              ),
              ListTile(
                title: const Text('Date of Birth'),
                subtitle: Text(userProfile.birthDate.formatAsDMY()),
              ),
              ListTile(
                title: const Text('Biography'),
                subtitle: Text(userProfile.biography),
              ),
              ListTile(
                title: const Text('Hobbies'),
                subtitle: Text(
                  userProfile.hobbies.join(', '),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
