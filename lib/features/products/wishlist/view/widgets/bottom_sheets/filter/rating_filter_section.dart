part of 'filter_bottom_sheet.dart';

class RatingsFilterSection extends StatelessWidget {
  final ValueNotifier<RangeValues?> ratings;
  final void Function(RangeValues)? onChanged;
  const RatingsFilterSection(
      {super.key, required this.ratings, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Text(
          'Rating:',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        5.width,
         Text(
          '0',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        2.width,
        Icon(Icons.star, color: Colors.yellowAccent.shade700),
        5.width,
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: ratings,
              builder: (_, ratings, __) {
                return RangeSlider(
                  min: 0,
                  max: 5,
                  divisions: 10,
                  labels: RangeLabels(
                    ratings?.start.toString() ?? '0',
                    ratings?.end.toString() ?? '0',
                  ),
                  values: ratings ?? const RangeValues(0, 0),
                  onChanged: onChanged,
                );
              }),
        ),
         Text(
          '5',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        2.width,
        Icon(Icons.star, color: Colors.yellowAccent.shade700),
      ],
    );
  }
}
