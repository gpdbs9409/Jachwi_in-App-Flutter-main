# CLAUDE.md — 자취인 Flutter 앱 개발 가이드

## 프로젝트 개요
자취생을 위한 커뮤니티/지도 앱. Flutter + GetX + Naver Map SDK 기반.

## 아키텍처: MVVM + Repository Pattern

```
lib/
  core/constants/       # 앱 전역 상수 (색상, 사이즈)
  data/
    models/             # 데이터 클래스 (JSON 직렬화 포함)
    repositories/       # API 통신 로직 (백엔드와의 유일한 접점)
  presentation/
    screens/            # 화면별 디렉토리 (screen + view_model 한 쌍)
    widgets/            # 재사용 위젯
  main.dart
```

## 파일 네이밍 규칙
- 파일: `snake_case.dart`
- 클래스: `UpperCamelCase`
- ViewModel: `XxxViewModel extends GetxController`
- Repository: `XxxRepository` (인스턴스 주입은 GetX DI 사용)

## 브랜치 전략
- `master`: 배포용, 직접 커밋 금지
- `develop`: 통합 브랜치
- `feat/기능명`: 기능 단위 브랜치 → 완성 시 develop에 merge

## 상태 관리 (GetX)
- `.obs`로 반응형 변수 선언
- `Obx(() => ...)` 위젯으로 구독
- `Get.to()` / `Get.off()` / `Get.offAll()`로 네비게이션
- `Get.put()` 으로 컨트롤러 등록, `Get.find()`로 조회

## 백엔드 연동
- 모든 HTTP 통신은 `data/repositories/` 에서만 수행
- BASE_URL은 `auth_repository.dart`, `map_repository.dart` 내 `_baseUrl` 상수 수정
- 현재 `BACKEND_IP:BACKEND_PORT` 플레이스홀더 → 실제 배포 시 교체

## 주요 의존성
| 패키지 | 용도 |
|---|---|
| `get` | 상태관리, 라우팅, DI |
| `flutter_naver_map` | 네이버 지도 |
| `http` | REST API 통신 |

## 주의사항
- `SizeConfig.init(context)` 는 각 화면 `build()` 첫 줄에서 호출
- Naver Map 클라이언트 ID: `g4v4m4nte0` (main.dart에서 초기화)
- `dummyPostings`는 임시 더미 데이터 → 추후 API 연동으로 교체 필요
