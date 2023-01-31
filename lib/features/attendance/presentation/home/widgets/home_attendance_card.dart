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
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorFamily.blackPrimary,
                      ),
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
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorFamily.blackPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                    );
                  },
                ),
                Text(
                  'Lihat Info Presensi',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorFamily.tealPrimary,
                      ),
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
