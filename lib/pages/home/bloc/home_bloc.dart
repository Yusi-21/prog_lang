import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:prog_lang/data/language_repository.dart';
import '../../../models/language.dart';
import '../../../mock/languages_data.dart';

part 'home_event.dart';
part 'home_state.dart';

// for practice-7
// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(const HomeInitial()) {
//     on<LoadLanguagesEvent>(_onLoadLanguages); // Регистрирует обработчик для события LoadLanguagesEvent
//   }
//
//   Future<void> _onLoadLanguages(LoadLanguagesEvent event, Emitter<HomeState> emit) async {
//     emit(const HomeLoading());
//     try {
//       await Future.delayed(const Duration(milliseconds: 1500));
//       emit(HomeLoaded(languages));
//     } catch (e) {
//       emit(const HomeError('Не удалось загрузить данные'));
//     }
//   }
// }

// for practice-8
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LanguageRepository repository;

  HomeBloc(this.repository) : super(const HomeInitial()) {
    on<LoadLanguagesEvent>(_onLoadLanguages);
  }

  Future<void> _onLoadLanguages(LoadLanguagesEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    try {
      final languages = await repository.fetchLanguages();
      emit(HomeLoaded(languages));
    } catch (e) {
      emit(const HomeError('Не удалось загрузить данные'));
    }
  }
}