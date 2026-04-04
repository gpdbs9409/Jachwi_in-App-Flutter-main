# Flutter 앱 - README

**자취인 (Jachwi-in) - 자취생을 위한 커뮤니티&지도 앱**

---

## 개요

자취인은 자취생들을 위한 **지도 기반 커뮤니티 플랫폼**입니다.

- **플랫폼**: iOS, Android, 웹
- **프레임워크**: Flutter 3.0.1+
- **상태 관리**: GetX
- **지도**: Naver Map SDK
- **주요 기능**:
  - 네이버 지도 기반 건물/시설 표시
  - 공동구매, 룸메이트, 방 구하기 커뮤니티
  - 회원가입/로그인 (이메일 인증)
  - 마이페이지 & 설정

---

## 프로젝트 구조

```
lib/
├── main.dart                         # 앱 진입점, 라우터 설정
├── core/
│   ├── constants/
│   │   ├── colors.dart               # 앱 색상 팔레트
│   │   ├── sizes.dart                # 텍스트/요소 크기
│   │   └── strings.dart              # 다국어 문자열 (예정)
│   └── utils/
│       ├── size_config.dart          # 반응형 사이즈 계산
│       └── validators.dart           # 유효성 검증
├── data/
│   ├── models/                       # 데이터 모델 (JSON 직렬화)
│   │   ├── user.dart
│   │   ├── posting.dart
│   │   ├── comment.dart
│   │   └── map_bounds.dart
│   └── repositories/                 # API 통신 계층 (백엔드와 유일한 접점)
│       ├── auth_repository.dart      # 인증 (로그인, 회원가입)
│       └── map_repository.dart       # 지도 (건물, 마커)
├── presentation/
│   ├── screens/                      # 화면별 페이지
│   │   ├── splash/
│   │   ├── login/
│   │   ├── signup/
│   │   ├── home/
│   │   ├── map/
│   │   ├── profile/
│   │   └── settings/
│   ├── widgets/                      # 재사용 가능한 위젯
│   │   ├── custom_app_bar.dart
│   │   ├── custom_button.dart
│   │   └── ...
│   └── view_models/                  # GetX 컨트롤러 (상태 관리)
│       ├── auth_view_model.dart
│       ├── map_view_model.dart
│       └── ...
├── pubspec.yaml                      # 의존성 선언
└── CLAUDE.md                         # 개발 가이드
```

---

## 로컬 환경 설정

### 1. 필수 설치 항목
- Flutter SDK 3.0.1 이상
- Dart SDK 3.0.1 이상
- Xcode (iOS) 또는 Android Studio
- 네이버 지도 API 키

### 2. Flutter 설치 & 확인

```bash
# Flutter 버전 확인
flutter --version

# Doctor 실행 (의존성 확인)
flutter doctor
```

### 3. 프로젝트 설정

```bash
# 프로젝트 디렉토리 진입
cd Jachwi_in-App-Flutter-main

# 의존성 설치
flutter pub get

# 코드 생성 (GetX, JSON serialization)
flutter pub run build_runner build
```

### 4. 네이버 지도 API 키 설정

**main.dart에서**:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: "g4v4m4nte0");
  runApp(const JaChwuiinApp());
}
```

> API 키는 environment 환경에 따라 달리 설정할 수 있습니다.

### 5. 백엔드 연결 설정

**lib/data/repositories/auth_repository.dart**:
```dart
class AuthRepository {
  static const String _baseUrl = 'http://localhost:8081';
  // Auth Server (port 8081) 연결
}
```

**lib/data/repositories/map_repository.dart**:
```dart
class MapRepository {
  static const String _baseUrl = 'http://localhost:8080';
  // Main Server (port 8080) 연결
}
```

로컬 테스트 시:
- Auth Server: `http://localhost:8081`
- Main Server: `http://localhost:8080`

실서버 배포 시:
- `http://your-domain.com:port`로 변경

### 6. 앱 실행

#### Android
```bash
flutter run -d android
```

#### iOS
```bash
cd ios
pod install
cd ..
flutter run -d iPhone
```

#### 웹
```bash
flutter run -d web
```

---

## 주요 화면 흐름

```
SplashScreen (3초 로딩)
    ↓
HomeScreen (메인 - 게시판)
    ├─ PostingListView (카테고리별 게시글)
    │    └─ PostingDetailScreen (게시글 상세)
    │         └─ CommentListView (댓글)
    ├─ NavBar: Map, Home, MyPage, Settings
    │
Map (네이버 지도 + 건물 마커)
    ├─ 지도 범위 내 건물 표시
    ├─ 건물 클릭 → 상세 정보 팝업
    └─ 검색 & 필터링 (예정)
    │
MyPageScreen (사용자 프로필)
    ├─ 사용자 정보
    ├─ 내가 쓴 글
    ├─ 북마크
    └─ 로그아웃
    │
SettingsScreen (앱 설정)
    ├─ 알림 설정
    ├─ 테마 변경
    ├─ 언어 설정 (예정)
    └─ 약관 (예정)
    
로그아웃 시 → LoginScreen
    ├─ 로그인
    └─ 회원가입
        ├─ 이메일 입력
        ├─ 이메일 인증 (6자리 코드)
        ├─ 회원정보 입력
        └─ 회원가입 완료
```

---

## API 연동 가이드

### 1. 로그인

```dart
// auth_view_model.dart
class AuthViewModel extends GetxController {
  final authRepo = Get.put(AuthRepository());
  
  void login(String email, String password) async {
    try {
      await authRepo.login(email, password);
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      Get.snackbar('오류', '로그인 실패: $e');
    }
  }
}
```

### 2. 지도 건물 조회

```dart
// map_view_model.dart
class MapViewModel extends GetxController {
  final mapRepo = Get.put(MapRepository());
  var buildingList = <Building>[].obs;
  
  void fetchBuildingsInArea(double minX, double maxX, double minY, double maxY) async {
    try {
      final buildings = await mapRepo.fetchBuildingsInArea(minX, maxX, minY, maxY);
      buildingList.value = buildings;
      // 지도에 마커 표시
    } catch (e) {
      print('건물 조회 실패: $e');
    }
  }
}
```

### 3. 백엔드 응답 처리

모든 HTTP 통신은 **repositories/** 에서만 수행:
- `auth_repository.dart` - 인증 API (Auth Server)
- `map_repository.dart` - 지도 API (Main Server)

새로운 API 추가 시:
1. `data/models/` 에 데이터 모델 생성
2. `data/repositories/` 에 API 호출 로직 작성
3. `presentation/view_models/` 에 UI 로직 작성

---

## 의존성

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3              # HTTP 클라이언트
  get: ^4.3.8                # 상태관리 & 라우팅
  flutter_naver_map: ^1.0.0  # 네이버 지도
  comment_tree: ^0.3.0       # 댓글 트리 구조
  cupertino_icons: ^1.0.2    # iOS 아이콘
```

---

## 상태 관리 (GetX 가이드)

### 반응형 변수

```dart
class MyViewModel extends GetxController {
  var count = 0.obs;  // 반응형
  var name = ''.obs;
  var items = <String>[].obs;
  
  void increment() {
    count.value++;  // 자동으로 UI 업데이트
  }
}
```

### 구독 (UI 업데이트)

```dart
// Obx 위젯 사용
Obx(() => Text('Count: ${controller.count.value}')),

// GetBuilder 사용 (수동 업데이트)
GetBuilder<MyViewModel>(
  builder: (controller) => Text('Count: ${controller.count}'),
),
```

### 네비게이션

```dart
// 화면 이동
Get.to(() => const NextScreen());

// 이전 화면 제거하고 이동
Get.off(() => const NextScreen());

// 모든 화면 제거하고 이동
Get.offAll(() => const HomeScreen());

// 이름으로 이동
Get.toNamed('/home');
```

### 의존성 주입 (DI)

```dart
// 컨트롤러 등록
Get.put(AuthViewModel());

// 조회
final authVM = Get.find<AuthViewModel>();

// 또는 간단히
Get.put(AuthRepository());
```

---

## 반응형 사이즈 설정

화면 크기에 따라 동적으로 사이즈 조정:

```dart
// core/utils/size_config.dart
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

// 사용
SizedBox(
  width: SizeConfig.blockSizeHorizontal * 80,  // 화면의 80%
  height: 50,
)
```

---

## 주의사항

⚠️ **개발 시 주의**:

1. **SizeConfig.init()**: 각 화면 build() 첫 줄에서 호출
2. **더미 데이터**: `dummyPostings` → 추후 API 연동으로 교체
3. **HTTPS**: 프로덕션에서는 반드시 SSL/TLS 사용
4. **토큰 저장**: SecureStorage나 SharedPreferences 사용 (하드코딩 금지)
5. **에러 처리**: 모든 API 호출에 try-catch 또는 error callback

---

## 문제 해결

### "네이버 지도 표시 안 됨"
→ API 키가 올바른지, Android/iOS 패키지명 설정 확인

### "Auth Server 연결 안 됨"
→ `auth_repository.dart`의 `_baseUrl` 확인 (localhost:8081 또는 실서버)

### "Flutter pub get 실패"
```bash
flutter pub cache clean
flutter pub get
```

### "Hot Reload 안 됨"
```bash
flutter clean
flutter pub get
flutter run
```

---

## 추가 개발 예정 기능

- [ ] 게시글 검색 & 필터링
- [ ] 실시간 댓글 알림 (WebSocket)
- [ ] 메시지/채팅 (1:1)
- [ ] 사용자 차단 기능
- [ ] 다국어 지원 (i18n)
- [ ] 다크 테마
- [ ] 푸시 알림 (FCM)
- [ ] 페이스북/카카오 로그인 (OAuth2)

---

## 참고 자료

- [Flutter 공식 문서](https://flutter.dev/docs)
- [GetX 공식 문서](https://github.com/jonataslaw/getx)
- [네이버 지도 Flutter SDK](https://navermaps.github.io/flutter-sdk/)
- [HTTP 패키지](https://pub.dev/packages/http)

---

**마지막 업데이트**: 2026-04-04  
**작성자**: 자취인 개발팀
