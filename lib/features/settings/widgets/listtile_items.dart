import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ecommerce_app/config/routes/routes.dart';
import 'package:stylish_ecommerce_app/core/extensions/navigation_extension.dart';
import 'package:stylish_ecommerce_app/features/auth/view_model/auth_cubit.dart';

Widget buildProfileHeader(bool isDarkTheme) {
  return Row(
    children: [
      Container(
        width:120.w,
        height:120.h,
        decoration: BoxDecoration(
          color: isDarkTheme ? Colors.black : Colors.white,
          shape: BoxShape.circle,
          image: const DecorationImage(
            image: AssetImage('assets/images/avatar.png'),
            fit: BoxFit.fill,
          ),
          border: Border.all(
              color: isDarkTheme ? Colors.black : Colors.grey, width:2.w),
        ),
      ),
       SizedBox(width:10.w),
       Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Fatma Atef",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildLanguageTile(bool isDarkTheme) {
  return ListTile(
    leading:  Image(
      width:40.w,
      height:40.h,
      image: const AssetImage(
        'assets/images/lang.png',
      ),
    ),
    title: Text(
      "Languages",
      style: TextStyle(
        color: isDarkTheme ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      "English US",
      style: TextStyle(
        color: isDarkTheme ? Colors.white70 : Colors.black54,
      ),
    ),
    trailing: Icon(
      Icons.keyboard_arrow_right,
      color: isDarkTheme ? Colors.white : Colors.black,
    ),
    onTap: () {},
  );
}

void _goToProfile(BuildContext context) {
  context.pop();
  context.pushNamed(AppRoutes.profile);
}

Widget buildProfileSettingsTile(bool isDarkTheme, BuildContext context) {
  return ListTile(
    leading:  Image(
      width:40.w,
      height:40.h,
      image: const AssetImage(
        'assets/images/user.png',
      ),
    ),
    title: Text(
      "Profile Settings",
      style: TextStyle(
        color: isDarkTheme ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      "Fatma Atef",
      style: TextStyle(
        color: isDarkTheme ? Colors.white70 : Colors.black54,
      ),
    ),
    trailing: Icon(
      Icons.keyboard_arrow_right,
      color: isDarkTheme ? Colors.white : Colors.black,
    ),
    onTap: () {
      Navigator.pushNamed(context, AppRoutes.profile);
    },
  );
}

Widget buildDarkModeTile(bool isDarkTheme) {
  return SwitchListTile(
    secondary:  Image(
      width:40.w,
      height:40.h,
      image: const AssetImage(
        'assets/images/dark.png',
      ),
    ),
    activeColor: const Color(0xffF83758),
    title: Text(
      "Dark Mode",
      style: TextStyle(
        color: isDarkTheme ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      "off",
      style: TextStyle(
        color: isDarkTheme ? Colors.white70 : Colors.black54,
      ),
    ),
    value: false,
    onChanged: (val) {},
  );
}

Widget buildPushNotificationsTile(bool isDarkTheme) {
  return SwitchListTile(
    secondary:  Image(
      width:40.w,
      height:40.h,
      image: const AssetImage(
        'assets/images/notification.png',
      ),
    ),
    activeColor: const Color(0xffF83758),
    title: Text(
      "Push Notifications",
      style: TextStyle(
        color: isDarkTheme ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      "on",
      style: TextStyle(
        color: isDarkTheme ? Colors.white70 : Colors.black54,
      ),
    ),
    value: true,
    onChanged: (val) {},
  );
}

Widget buildLogoutTile(bool isDarkTheme) {
  return
    BlocConsumer<AuthCubit,AuthState>(
      builder: (context,state) {
        return ListTile(
        leading:  Image(
          width:40.w,
          height:40.h,
          image: const AssetImage(
            'assets/images/logout.png',
          ),
        ),
        trailing: Icon(
          Icons.logout_rounded,
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        title: Text(
          "Logout",
          style: TextStyle(
            color: isDarkTheme ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: ()async {
          await context.read<AuthCubit>().signOut();
        },
          );
      },
      listener: (BuildContext context, AuthState state) {
        if(state is SignOutSuccess){
          context.pushNamedAndRemoveUntil(AppRoutes.signIn);
        }

      },
    );
}
