part of 'filter_bottom_sheet.dart';

class PriceFilterSection extends StatelessWidget {
  final ValueNotifier<RangeValues?> price;
  final void Function(RangeValues)? onChanged;
  const PriceFilterSection({super.key, required this.price, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          'Price:',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        5.width,
         Text(
          '0 EGP',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: price,
              builder: (_, price, __) {
                return RangeSlider(
                  min: 0,
                  max: 10000,
                  divisions: 10,
                  labels: RangeLabels(
                    price?.start.toString() ?? '0',
                    price?.end.toString() ?? '0',
                  ),
                  values: price ?? const RangeValues(0, 0),
                  onChanged: onChanged,
                );
              }),
        ),
         Text(
          '10000 EGP',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
