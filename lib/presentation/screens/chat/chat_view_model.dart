import 'package:get/get.dart';
import 'package:ja_chuiin/data/repositories/llm_repository.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatViewModel extends GetxController {
  final LlmRepository _repository = LlmRepository();

  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxBool isLoading = false.obs;

  // 대화 단계 관리
  final RxInt step = 0.obs;
  String _school = '';
  final List<String> _preferences = [];

  static const List<String> _prefOptions = ['카페', '편의점', 'CCTV', '버스정류장', '가로등', '병원'];

  // 좌표 (기본값: 서울 중심)
  final double _centerX = 127.0;
  final double _centerY = 37.5;

  @override
  void onInit() {
    super.onInit();
    _addBot('안녕하세요! 자취방 AI 추천 서비스예요 🏠\n\n먼저 다니시는 학교 이름을 알려주세요.');
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty || isLoading.value) return;

    _addUser(text);

    switch (step.value) {
      case 0:
        _school = text.trim();
        step.value = 1;
        _addBot('$_school 근처를 찾아볼게요!\n\n선호하는 편의시설을 알려주세요.\n(예: 카페, 편의점, CCTV, 버스정류장, 병원)\n\n여러 개면 쉼표로 구분해서 입력해주세요.\n없으면 "없음"을 입력해주세요.');
        break;

      case 1:
        if (text.trim() != '없음') {
          _preferences.addAll(
            text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty),
          );
        }
        step.value = 2;
        _requestRecommendation();
        break;
    }
  }

  Future<void> _requestRecommendation() async {
    isLoading.value = true;
    _addBot('조건에 맞는 자취방을 찾는 중이에요... ⏳');

    try {
      final result = await _repository.recommend(
        school: _school,
        preferences: _preferences,
        centerX: _centerX,
        centerY: _centerY,
      );
      messages.removeLast(); // 로딩 메시지 제거
      _addBot(result);
      _addBot('다시 추천받으시려면 학교 이름을 입력해주세요.');
      step.value = 0;
      _preferences.clear();
      _school = '';
    } catch (e) {
      messages.removeLast();
      _addBot('추천 서비스에 연결할 수 없어요. 잠시 후 다시 시도해주세요.');
      step.value = 0;
    } finally {
      isLoading.value = false;
    }
  }

  void _addBot(String text) {
    messages.add(ChatMessage(text: text, isUser: false));
  }

  void _addUser(String text) {
    messages.add(ChatMessage(text: text, isUser: true));
  }

  List<String> get prefOptions => _prefOptions;
}
