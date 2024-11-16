abstract class TopicEvent {}

class SelectTopicEvent extends TopicEvent {
  final int selectedContainer;
  final String selectedTopic;

  SelectTopicEvent({
    required this.selectedContainer,
    required this.selectedTopic,
  });
}

class ResetTopicEvent extends TopicEvent {}
