import 'package:carousel_slider/carousel_slider.dart';
import 'package:daytrack_apps/features/attendance/presentation/home/widgets/home_header.dart';
import 'package:daytrack_apps/features/attendance/presentation/home/widgets/home_attendance_card.dart';
import 'package:daytrack_apps/features/main/presentation/widgets/main_text_theme.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
          );
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CalculateSize.getWidth(16),
                      vertical: CalculateSize.getHeight(20),
                    ),
                    child: const HomeAppBar(
                      title: 'Selamat Siang',
                      name: 'Andi Fauzy',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: CalculateSize.getWidth(8),
                    vertical: CalculateSize.getHeight(8),
                  ),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: imageSliders,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CalculateSize.getWidth(8),
                    vertical: CalculateSize.getHeight(8),
                  ),
                  child: HomeAttendanceCard(
                    title: 'Saatnya Check-In',
                    subtitle: '21:13 WIB',
                    actionText: 'Check-In',
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CalculateSize.getWidth(12),
                    vertical: CalculateSize.getHeight(12),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Pengumuman',
                          style: MainTextTheme.homeHeadingDark,
                        ),
                        Text(
                          'Informasi terbaru dari perusahaan',
                          style: MainTextTheme.homeSubtitleCard,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: EdgeInsets.all(
          CalculateSize.getWidth(4),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Stack(
            children: <Widget>[
              Image.network(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    )
    .toList();
