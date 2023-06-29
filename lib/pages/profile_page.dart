import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/components/user_avatar.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/config/app_strings.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_full_course/styles/app_text.dart';
import 'package:provider/provider.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppRepo>().user;
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.profile,
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.editProfile);
                  break;
                case ProfileMenu.logout:
                  print('log out');
                  break;
                default:
              }
            },
            icon: const Icon(Icons.more_vert_rounded),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(AppStrings.edit),
                  value: ProfileMenu.edit,
                ),
                PopupMenuItem(
                  child: Text(AppStrings.logout),
                  value: ProfileMenu.logout,
                ),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          UserAvatar(
            size: 90,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            '${user?.id} ${user?.firstname} ${user?.lastname}',
            style: AppText.header2,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Madahascar',
            style: AppText.subtitle3,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '472',
                    style: AppText.header2,
                  ),
                  Text(AppStrings.followers),
                ],
              ),
              Column(
                children: [
                  Text(
                    '119',
                    style: AppText.header2,
                  ),
                  Text(AppStrings.posts),
                ],
              ),
              Column(
                children: [
                  Text(
                    '860',
                    style: AppText.header2,
                  ),
                  Text(AppStrings.following),
                ],
              )
            ],
          ),
          Divider(thickness: 1, height: 24),
        ],
      ),
    );
  }
}
