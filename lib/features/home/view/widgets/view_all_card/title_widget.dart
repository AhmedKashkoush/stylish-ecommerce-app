part of 'view_all_card.dart';

class TitleWidget extends StatelessWidget {
  final ViewAllCardType type;
  const TitleWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      type == ViewAllCardType.dealOfTheDay
          ? 'Deal of the day'
          : 'Trending Products',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}
