enum CheckAttendanceStep {
  condition,
  location,
  survey,
  finish,
}

extension CheckAttendanceStepExtension on CheckAttendanceStep {
  int get page {
    switch (this) {
      case CheckAttendanceStep.condition:
        return 0;
      case CheckAttendanceStep.location:
        return 1;
      case CheckAttendanceStep.survey:
        return 2;
      case CheckAttendanceStep.finish:
        return 3;
    }
  }
}
