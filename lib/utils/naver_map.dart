// Conditional import: on web (dart.library.html) use stubs, on mobile use real package
export 'naver_map_web_stub.dart'
    if (dart.library.io) 'naver_map_io.dart';
