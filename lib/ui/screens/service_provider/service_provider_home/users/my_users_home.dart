import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_users/my_user_widgets/my_users_screen/my_user_screens.dart';
import 'my_users/my_user_widgets/user_option_widgets.dart';
import 'user_requests/user_requests.dart';

class ServiceProviderMyUsersHome extends StatelessWidget {
  ServiceProviderMyUsersHome({super.key});

  PageController userPageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.9, // Adjust the height to fit the container
      child: Column(
        children: [
          UserPageOptionWidget(
            userPageController: userPageController,
          ),
          8.h.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: SizedBox(
              height: size.height * 0.75, // Give the container a height

              child: PageView(
                controller:
                    userPageController, // Make sure to add the controller
                children: const [
                  MyUsers(),
                  UserRequestForProvider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
