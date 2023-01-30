import 'package:daytrack_apps/features/main/presentation/widgets/main_text_theme.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeAttendanceCard extends StatelessWidget {
  const HomeAttendanceCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.actionText,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CalculateSize.getWidth(18),
          vertical: CalculateSize.getHeight(17),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: MainTextTheme.homeTitleCard,
                ),
                StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    return Text(
                      DateFormat('EEEE, dd MMMM yyyy HH:mm:ss').format(
                        DateTime.now(),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: MainTextTheme.homeSubtitleCard,
                    );
                  },
                ),
                const Text(
                  'Lihat Info Presensi',
                  style: MainTextTheme.homeSubtitleColoredCard,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.login,
              color: ColorFamily.tealPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
