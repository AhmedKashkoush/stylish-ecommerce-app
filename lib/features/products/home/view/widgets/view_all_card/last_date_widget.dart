part of 'view_all_card.dart';

class LastDateWidget extends StatelessWidget {
  final DateTime until;
  const LastDateWidget({
    super.key,
    required this.until,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
         Icon(
          Icons.calendar_month_outlined,
          color: Colors.white,
          size: 12.sp,
        ),
        4.width,
        Text(
          'Last Date: ${until.day}/${until.month}/${until.year}',
          style:  TextStyle(
            color: Colors.white,
            fontSize: 12.sp.sp,
          ),
        ),
      ],
    );
  }
}
