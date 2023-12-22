import 'package:flutter/material.dart';


class Posting{
  String title;
  String contents;
  Image image;
  Posting(this.title,this.contents,this.image);
}

List<Posting> postings =[
  Posting('title', '''콜백 함수(callback function)는 프로그래밍에서 중요한 개념 중 하나로 
    다른 함수에 전달되어 실행되는 함수를 의미합니다. 콜백 함수는 함수를 인자로 전달하고, 이후에 특정 조건이나 시점에 해당 함수를 호출하여 원하는 작업을 수행할 수 있게 해줍니다. 이러한 기능은 비동기 프로그래밍이나 이벤트 처리와 같은 상황에서 매우 유용하게 사용됩니다.
콜백 함수의 동작은 언어나 프레임워크에 따라 다소 다를 수 있지만, 일반적으로 아래와 같은 패턴을 따릅니다:
''' , Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),
  Posting('title', 'examplecontents', Image.asset('assets/images/my_logo.png')),


];
