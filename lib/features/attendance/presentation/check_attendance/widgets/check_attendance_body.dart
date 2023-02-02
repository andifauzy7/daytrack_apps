import 'package:daytrack_apps/features/attendance/presentation/check_attendance/bloc/check_attendance_bloc.dart';
import 'package:daytrack_apps/shared/components/error_result_widget.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets.dart';

class CheckAttendanceBody extends StatefulWidget {
  const CheckAttendanceBody({super.key});

  @override
  State<CheckAttendanceBody> createState() => _CheckAttendanceBodyState();
}

class _CheckAttendanceBodyState extends State<CheckAttendanceBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CheckAttendanceBloc>(context).add(
      CheckAttendanceFetchData(),
    );
  }

  void nextPage(int val) => BlocProvider.of<CheckAttendanceBloc>(context).add(
        CheckAttendanceNextStep(answer: val),
      );

  void prevPage() => BlocProvider.of<CheckAttendanceBloc>(context).add(
        CheckAttendancePreviousStep(),
      );

  void finishStep() => BlocProvider.of<CheckAttendanceBloc>(context).add(
        CheckAttendanceSubmit(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckAttendanceBloc, CheckAttendanceState>(
      listener: (context, state) {
        if (state is CheckAttendanceNavigateBack ||
            state is CheckAttendanceFinished) {
          Navigator.pop(context);
        }
      },
      child: WillPopScope(
        onWillPop: () {
          prevPage();
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<CheckAttendanceBloc, CheckAttendanceState>(
              builder: (context, state) {
                if (state is CheckAttendanceLoaded &&
                    state.indexPage < state.question.length) {
                  return Text(
                    state.question[state.indexPage].title,
                  );
                }

                return const Text(StringValue.finish);
              },
            ),
          ),
          body: BlocBuilder<CheckAttendanceBloc, CheckAttendanceState>(
            builder: (context, state) {
              if (state is CheckAttendanceLoaded) {
                return IndexedStack(
                  index: state.indexPage,
                  children: [
                    AttendanceCondition(
                      user: state.user,
                      question: state.question[0],
                      onNext: nextPage,
                    ),
                    AttendanceLocation(
                      question: state.question[1],
                      onNext: nextPage,
                      onPrevious: prevPage,
                    ),
                    AttendanceSurvey(
                      question: state.question[2],
                      onNext: nextPage,
                      onPrevious: prevPage,
                    ),
                    AttendanceFinished(
                      onFinished: finishStep,
                    )
                  ],
                );
              }

              if (state is CheckAttendanceError) {
                return ErrorResultWidget(errorMessage: state.errorMessage);
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
