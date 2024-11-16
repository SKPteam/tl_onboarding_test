import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../event/topic_event.dart';
import '../event/topic_event.dart';
import '../state/topic_state.dart';
import '../state/topic_state.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc() : super(TopicState(selectedContainer: -1, selectedTopic: null)) {
    on<SelectTopicEvent>((event, emit) {
      emit(TopicState(
        selectedContainer: event.selectedContainer,
        selectedTopic: event.selectedTopic,
      ));
    });

    on<ResetTopicEvent>((event, emit) {
      emit(TopicState(selectedContainer: -1, selectedTopic: null));
    });
  }
}
