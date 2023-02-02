import 'package:daytrack_apps/features/attendance/data/models/attendance_record_model.dart';
import 'package:daytrack_apps/features/attendance/data/models/option_answer_model.dart';
import 'package:daytrack_apps/features/attendance/data/models/question_model.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/attendance_record.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/option_answer.dart';
import 'package:daytrack_apps/features/attendance/domain/entities/question.dart';

class AttendanceMapper {
  static Question convertQuestionModelToQuestion(QuestionModel questionModel) =>
      Question(
        option: (questionModel.option ?? [])
            .map(
              (e) => convertOptionAnswerModelToOptionAnswer(e),
            )
            .toList(),
        question: questionModel.question ?? '',
        title: questionModel.title ?? '',
        answer: questionModel.answer,
      );

  static QuestionModel convertQuestionToQuestionModel(Question question) =>
      QuestionModel(
        title: question.title,
        question: question.question,
        answer: question.answer,
        option: question.option
            .map(
              (e) => convertOptionAnswerToOptionAnswerModel(e),
            )
            .toList(),
      );

  static OptionAnswer convertOptionAnswerModelToOptionAnswer(
          OptionAnswerModel optionAnswerModel) =>
      OptionAnswer(
        image: optionAnswerModel.image,
        emoji: optionAnswerModel.emoji,
        body: optionAnswerModel.body ?? '',
      );

  static OptionAnswerModel convertOptionAnswerToOptionAnswerModel(
          OptionAnswer optionAnswer) =>
      OptionAnswerModel(
        image: optionAnswer.image,
        emoji: optionAnswer.emoji,
        body: optionAnswer.body,
      );

  static AttendanceRecordModel convertAttendanceRecordToAttendanceRecordModel(
          AttendanceRecord attendanceRecord) =>
      AttendanceRecordModel(
        dateTime: attendanceRecord.dateTime,
        condition: attendanceRecord.condition != null
            ? convertQuestionToQuestionModel(attendanceRecord.condition!)
            : null,
        location: attendanceRecord.location != null
            ? convertQuestionToQuestionModel(attendanceRecord.location!)
            : null,
        latitude: attendanceRecord.latitude,
        langitude: attendanceRecord.langitude,
        detailAddress: attendanceRecord.detailAddress,
        survey: attendanceRecord.survey != null
            ? convertQuestionToQuestionModel(attendanceRecord.survey!)
            : null,
        checkIn: attendanceRecord.checkIn,
        checkOut: attendanceRecord.checkOut,
        workingHours: attendanceRecord.workingHours != null
            ? convertQuestionToQuestionModel(attendanceRecord.workingHours!)
            : null,
      );

  static AttendanceRecord convertAttendanceRecordModelToAttendanceRecord(
          AttendanceRecordModel attendanceRecordModel) =>
      AttendanceRecord(
        dateTime: attendanceRecordModel.dateTime,
        condition: attendanceRecordModel.condition != null
            ? convertQuestionModelToQuestion(attendanceRecordModel.condition!)
            : null,
        location: attendanceRecordModel.location != null
            ? convertQuestionModelToQuestion(attendanceRecordModel.location!)
            : null,
        latitude: attendanceRecordModel.latitude,
        langitude: attendanceRecordModel.langitude,
        detailAddress: attendanceRecordModel.detailAddress,
        survey: attendanceRecordModel.survey != null
            ? convertQuestionModelToQuestion(attendanceRecordModel.survey!)
            : null,
        checkIn: attendanceRecordModel.checkIn,
        checkOut: attendanceRecordModel.checkOut,
        workingHours: attendanceRecordModel.workingHours != null
            ? convertQuestionModelToQuestion(
                attendanceRecordModel.workingHours!)
            : null,
      );
}
