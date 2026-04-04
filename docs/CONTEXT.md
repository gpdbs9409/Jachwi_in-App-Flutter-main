# 프로젝트 컨텍스트

## 앱 소개
**자취인** — 자취생을 위한 커뮤니티 앱
- 근처 카페/버스/안전/학교 정보를 지도로 확인
- 공동구매, 룸메이트 구하기, 방 구하기 게시판
- 회원가입/로그인, 마이페이지

## 화면 흐름
```
SplashScreen (3초)
  └─ MapScreen (메인)
       ├─ HomeScreen (게시판 목록)
       │    └─ PostingDetailScreen (게시글 상세)
       ├─ LoginScreen
       │    ├─ AgreementScreen (약관동의)
       │    │    └─ VerificationScreen (본인인증)
       │    │         └─ ProfileFormScreen (회원정보)
       │    │              └─ HomeScreen
       ├─ MyPageScreen
       └─ SettingsScreen
```

## 백엔드 연동 현황 (2026-04-04 기준)
| 기능 | 상태 | 비고 |
|---|---|---|
| 로그인 | 플레이스홀더 | BACKEND_IP 미설정 |
| 이메일 인증 | 플레이스홀더 | BACKEND_IP 미설정 |
| 지도 범위 전송 | 플레이스홀더 | BACKEND_IP 미설정 |
| 마커 조회 | 플레이스홀더 | BACKEND_IP 미설정 |
| 게시글 목록 | 더미 데이터 | API 연동 미구현 |

## 개발 환경
- Flutter SDK ≥ 3.0.1
- Dart SDK ≥ 3.0.1
- Android / iOS 지원
