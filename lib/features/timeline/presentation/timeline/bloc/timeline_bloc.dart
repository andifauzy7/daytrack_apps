import 'package:daytrack_apps/core/usecase/usecase.dart';
import 'package:daytrack_apps/features/timeline/domain/entities/news.dart';
import 'package:daytrack_apps/features/timeline/domain/usecases/get_latest_news_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  final GetLatestNewsUsecase getLatestNewsUsecase;
  TimelineBloc({required this.getLatestNewsUsecase})
      : super(TimelineInitial()) {
    on<TimelineFetchNews>(_fetchNewsHandle);
  }

  Future<void> _fetchNewsHandle(
    TimelineFetchNews event,
    Emitter<TimelineState> emit,
  ) async {
    emit(TimelineLoading());
    final loginSession = await getLatestNewsUsecase(
      NoParams(),
    );

    loginSession.fold(
      (err) => emit(
        TimelineError(
          message: err.toString(),
        ),
      ),
      (value) => emit(
        TimelineLoaded(news: value),
      ),
    );
  }
}
