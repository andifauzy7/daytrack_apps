import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/dt_elevated_button.dart';
import 'package:flutter/material.dart';

class AttendanceFinished extends StatelessWidget {
  const AttendanceFinished({
    Key? key,
    required this.onFinished,
  }) : super(key: key);

  final VoidCallback onFinished;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(
                CalculateSize.getWidth(16),
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: CalculateSize.getWidth(45),
                      ),
                      child: Image.asset(
                        Assets.images.greeting.path,
                        width: double.infinity,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Andi Fauzy',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorFamily.tealPrimary,
                          ),
                    ),
                    Text(
                      'Selamat Bekerja',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorFamily.blackPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: CalculateSize.getHeight(16),
                    ),
                    Text(
                      '🤧 Semoga cepat sehat kembali',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorFamily.blackPrimary,
                          ),
                    ),
                    Text(
                      '🏢 Jaga protokol kesehatan di Kantor',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorFamily.blackPrimary,
                          ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    DTElevatedButton(
                      onPressed: onFinished,
                      text: 'Selesai',
                      type: DTElevatedButtonType.primary,
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
