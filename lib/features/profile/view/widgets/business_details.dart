import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/profile/view/widgets/shared_widget.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({
    super.key,
    required this.cityController,
    required this.stateController,
    required this.countryController,
    required this.pincodeController,
    required this.addressController,
  });

  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  final TextEditingController pincodeController;
  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Business Address Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
        SharedWidget(
          text: 'Pincode',
          hintText: '450116',
          textController: pincodeController,
          keyboardType: TextInputType.number,
        ),
        SharedWidget(
          text: 'Address',
          hintText: '216 St Paul\'s Rd,',
          textController: addressController,
          keyboardType: TextInputType.streetAddress,
        ),
        SharedWidget(
          text: 'City',
          hintText: 'London',
          textController: cityController,
          keyboardType: TextInputType.text,
        ),
        SharedWidget(
          text: 'State',
          hintText: 'N1 2LL',
          textController: stateController,
          keyboardType: TextInputType.text,
        ),
        SharedWidget(
          text: 'Country',
          hintText: 'United Kingdom',
          textController: countryController,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 25),
        Divider(
          thickness: 0.8,
          color: isDarkTheme ? Colors.white54 : const Color(0xffC4C4C4),
        ),
      ],
    );
  }
}
