import 'package:daytrack_apps/features/timeline/presentation/announcement/widgets/announcement_card.dart';
import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    AnnouncementCardContent? content =
        ModalRoute.of(context)!.settings.arguments as AnnouncementCardContent;
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringValue.announcement),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          CalculateSize.getWidth(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                content.title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: ColorFamily.blackPrimary),
              ),
              SizedBox(
                height: CalculateSize.getHeight(16),
              ),
              Text(
                content.description,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: ColorFamily.blackPrimary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
