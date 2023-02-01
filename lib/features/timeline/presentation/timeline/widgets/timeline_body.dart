import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timeline_bloc.dart';
import 'widgets.dart';

class TimelineBody extends StatefulWidget {
  const TimelineBody({
    Key? key,
  }) : super(key: key);

  @override
  State<TimelineBody> createState() => _TimelineBodyState();
}

class _TimelineBodyState extends State<TimelineBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TimelineBloc>(context).add(
      TimelineFetchNews(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<TimelineBloc>(context).add(
          TimelineFetchNews(),
        );
        return Future.delayed(
          const Duration(seconds: 1),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CalculateSize.getWidth(20),
          vertical: CalculateSize.getHeight(10),
        ),
        child: BlocBuilder<TimelineBloc, TimelineState>(
          builder: (context, state) {
            if (state is TimelineLoaded) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.news.length,
                itemBuilder: (context, index) => TimelineNewsCard(
                  title: state.news[index].title,
                  desc: state.news[index].description,
                  urlImage: state.news[index].urlToImage,
                  onPressed: () => urlLauncher(
                    Uri.parse(state.news[index].url),
                  ),
                ),
              );
            }

            if (state is TimelineError) {
              return TimelineErrorWidget(
                errorMessage: state.message,
              );
            }

            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const TimelineNewsCardDummy(),
            );
          },
        ),
      ),
    );
  }
}
