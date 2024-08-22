import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        radius: 55,
        backgroundImage: AssetImage('assets/images/avatar.png'),
        child: Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 17,
            backgroundImage: AssetImage('assets/images/edit.png'),
            child: Image(
              image: AssetImage('assets/images/pen.png'),
            ),
          ),
        ),
      ),
    );
  }
}
