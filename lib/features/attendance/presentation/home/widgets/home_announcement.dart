import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

class HomeAnnouncementContent {
  final String title;
  final String description;

  HomeAnnouncementContent({
    required this.title,
    required this.description,
  });
}

class HomeAnnouncement extends StatelessWidget {
  HomeAnnouncement({
    Key? key,
  }) : super(key: key);

  final List<HomeAnnouncementContent> list = [
    HomeAnnouncementContent(
      title: 'Cuti Bersama',
      description:
          'Tanggal 25 Januari ditetapkan pemerintah sebagai hari cuti bersama.',
    ),
    HomeAnnouncementContent(
      title: 'Performance Review Periode Q2',
      description:
          'Diberitahukan untuk seluruh pegawai melakukan pengisian performance review baik untuk rekan sejawat dan atasan.',
    ),
    HomeAnnouncementContent(
      title: 'Bonus Akhir Tahun',
      description:
          'Bonus akhir tahun akan cair pada tanggal 31 Januari 2023, dimohon seluruh pegawai mengikuti ketentuan sebagai berikut',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Pengumuman',
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: ColorFamily.blackPrimary),
      ),
      Text(
        'Informasi terbaru dari perusahaan',
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
            ),
          )
          .toList(),
    ]);
  }
}
