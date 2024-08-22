import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/profile_header.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileHeader(),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Personal Details',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SharedWidget(
            text: 'Email Address', hintText: 'aashifa@gmail.com'),
        const SharedWidget(text: 'Password', hintText: '***********'),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Stack(
            children: [
              const Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffF83758),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 1,
                  color: const Color(0xffF83758),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const Divider(
          thickness: 0.8,
          color: Color(0xffC4C4C4),
        ),
      ],
    );
  }
}
