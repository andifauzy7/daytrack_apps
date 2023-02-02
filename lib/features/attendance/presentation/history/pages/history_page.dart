import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/attendance/presentation/history/bloc/history_bloc.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/components/error_result_widget.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl.get<HistoryBloc>(),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              const Duration(seconds: 1),
            );
          },
          child: const HistoryBody(),
        ),
      ),
    );
  }
}

class HistoryBody extends StatefulWidget {
  const HistoryBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryBody> createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
  @override
  void initState() {
    BlocProvider.of<HistoryBloc>(context).add(
      HistoryFetchData(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CalculateSize.getWidth(16),
        vertical: CalculateSize.getHeight(10),
      ),
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryError) {
            return ErrorResultWidget(errorMessage: state.errorMessage);
          }

          if (state is HistoryLoaded) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.list.length,
              itemBuilder: (context, index) => HistoryAttendanceCard(
                attendanceRecord: state.list[index],
                onTap: () => Navigator.pushNamed(
                  context,
                  ConstantsValue.historyDetailRoute,
                  arguments: state.list[index],
                ),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
