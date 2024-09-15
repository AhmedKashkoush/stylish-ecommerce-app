part of 'view_all_card.dart';

class RemainingTimeWidget extends StatelessWidget {
  const RemainingTimeWidget({
    super.key,
    required this.remaining,
  });

  final ValueNotifier<Duration?> remaining;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.alarm,
          color: Colors.white,
          size: 12,
        ),
        4.width,
        ValueListenableBuilder(
          valueListenable: remaining,
          builder: (context, value, _) {
            return Text(
              value == null
                  ? '00h 00m 00s'
                  : '${value.inHours.toString().padLeft(2, '0')}h ${(value.inMinutes % 60).toString().padLeft(2, '0')}m ${(value.inSeconds % 60).toString().padLeft(2, '0')}s remaining',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            );
          },
        ),
      ],
    );
  }
}
