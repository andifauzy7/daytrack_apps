import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is SplashRequestSession) {
        emit(SplashLoading());
        await Future.delayed(const Duration(seconds: 3), () {});
        emit(SplashLoaded());
      }
    });
  }
}
