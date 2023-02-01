import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';

class AnnouncementCardContent {
  final String title;
  final String description;

  AnnouncementCardContent({
    required this.title,
    required this.description,
  });
}

class AnnouncementCard extends StatelessWidget {
  AnnouncementCard({
    Key? key,
  }) : super(key: key);

  final List<AnnouncementCardContent> list = [
    AnnouncementCardContent(
      title: StringValue.announceTitleFirst,
      description: StringValue.announceSubtitleFirst,
    ),
    AnnouncementCardContent(
      title: StringValue.announceTitleSecond,
      description: StringValue.announceSubtitleSecond,
    ),
    AnnouncementCardContent(
      title: StringValue.announceTitleThird,
      description: StringValue.announceSubtitleThird,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        StringValue.announcement,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: ColorFamily.blackPrimary),
      ),
      Text(
        StringValue.announcementSubtitle,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: ColorFamily.blackPrimary,
              fontWeight: FontWeight.w500,
            ),
      ),
      SizedBox(
        height: CalculateSize.getHeight(8),
      ),
      ...list
          .map(
            (e) => ListTile(
              title: Text(e.title),
              subtitle: Text(
                e.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              dense: true,
              trailing: Icon(
                Icons.navigate_next,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () => Navigator.pushNamed(
                context,
                ConstantsValue.announcementRoute,
                arguments: e,
              ),
            ),
          )
          .toList(),
    ]);
  }
}
