import 'package:daytrack_apps/features/attendance/presentation/check_attendance/bloc/check_attendance_bloc.dart';
import 'package:daytrack_apps/features/attendance/presentation/check_attendance/pages/check_attendance_page.dart';
import 'package:daytrack_apps/shared/components/error_result_widget.dart';
import 'package:daytrack_apps/shared/constants_value.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets.dart';

class CheckAttendanceBody extends StatefulWidget {
  const CheckAttendanceBody({super.key, required this.args});
  final CheckAttendanceArgs args;

  @override
  State<CheckAttendanceBody> createState() => _CheckAttendanceBodyState();
}

class _CheckAttendanceBodyState extends State<CheckAttendanceBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CheckAttendanceBloc>(context).add(
      CheckAttendanceFetchData(args: widget.args),
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

  void refreshPosition() => BlocProvider.of<CheckAttendanceBloc>(context).add(
        CheckAttendanceRefreshPosition(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckAttendanceBloc, CheckAttendanceState>(
      listener: (context, state) {
        if (state is CheckAttendanceNavigateBack) {
          Navigator.pop(context);
        }

        if (state is CheckAttendanceFinished) {
          Navigator.popAndPushNamed(context, ConstantsValue.mainRoute);
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

                if (state is CheckAttendanceLoaded &&
                    state.indexPage == state.question.length) {
                  return const Text(StringValue.finish);
                }

                return const Text('');
              },
            ),
          ),
          body: BlocBuilder<CheckAttendanceBloc, CheckAttendanceState>(
            builder: (context, state) {
              if (state is CheckAttendanceLoaded) {
                return [
                  AttendanceCondition(
                    initial: state.attendanceRecord.condition?.answer,
                    user: state.user,
                    question: state.question[0],
                    onNext: nextPage,
                  ),
                  AttendanceLocation(
                    attendanceRecord: state.attendanceRecord,
                    initial: state.attendanceRecord.location?.answer,
                    question: state.question[1],
                    onRefresh: refreshPosition,
                    onNext: nextPage,
                    onPrevious: prevPage,
                  ),
                  AttendanceSurvey(
                    initial: state.attendanceRecord.survey?.answer,
                    question: state.question[2],
                    onNext: nextPage,
                    onPrevious: prevPage,
                  ),
                  AttendanceSurvey(
                    initial: state.attendanceRecord.workingHours?.answer,
                    question: state.question[3],
                    onNext: nextPage,
                    onPrevious: prevPage,
                  ),
                  AttendanceFinished(
                    user: state.user,
                    attendanceRecord: state.attendanceRecord,
                    type: widget.args.type,
                    onFinished: finishStep,
                  )
                ].elementAt(state.indexPage);
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
