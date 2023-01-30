import 'package:daytrack_apps/features/timeline/presentation/timeline/widgets/news_card.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CalculateSize.getWidth(20),
            vertical: CalculateSize.getHeight(10),
          ),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => NewsCard(
              index: index,
              onPressed: () => _launchUrl(
                Uri.parse(
                    'https://kabarjombang.com/tekno/daftar-aplikasi-bikin-boros-baterai-ponsel/'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
