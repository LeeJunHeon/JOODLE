//회원가입, 로그인을 할 때 입력값을 모두 넣거나 넣지 않고 확인 버튼을 눌러도 출력 값이 false임 -- true임 수정함
//이를 검증하기 정확하게 입력값을 넣었을 때만 확인 버튼이 동작해야함 -- 해결

///amplify method들을 controller로 분리 -- Amplify configured는 login_controller로 분리 -- 조금 해결

//회원가입에서 인증코드 넣을 때 휴대폰 번호를 또 입력하지 않도록 provider로 값을 가져와야 함 ★★★ & confirm page 어떤 식으로 띄울지 구상 후 적용 -- 해결

//숫자만 입력하는 textfield들을 입력창이 숫자 패드로 뜨도록 함 -- 해결

//TODO: 주소창 주소 검색 -- 보류

//T로그인, 회원가입 페이지에서 자판이 생성되면 스크롤이 안됨, 그래서 밑에 값을 입력하기 매우 불편함 -- 해결

//  비밀번호 찾기 활성화


///구글, 카카오 로그인 API 추가  -- google은 연결했으나 myapp block으로 뜸

//TODO:  회원가입 페이지 비밀번호 재입력 및 그에 따른 confirm 구문 작성

//로그인 페이지에 있는 텍스트 인풋을 utils 디렉토리 안에 넣고 불러쓰기 -- 해결

//TODO:  로그인 페이지 -> 회원가입 페이지(pop) -> 인증 페이지(pop) -> SnackBar(회원가입이 완료되었습니다) : confirm페이지에서 인증을 마치면 페이지 라우팅하면서 생긴 confirm페이지와 signup페이지를 pop하여 login페이지로 돌아오고 snackbar(가입완료, 로그인 요청)를 띄워줌
//로그인 페이지에서 로그인 하고 창에 들어간 상태에서 로그아웃(amplify.signout을 하지만 뒤로가기 버튼을 누르면 다시 로그인 이후 페이지로 이동함 --> 이전 창을 지우고 새창을 여는 방식으로 로그인이 되도록 goroute를 이용해야 함 -- 해결(Navigator를 사용함)

//TODO:  login controller에 handleSignUpResult에서 각각의 Exception에서 걸리지 않고 넘어감

//TODO:  amplify auth 에는 address가 없지만 signup_page에서 활성화 한 상태로 가입을 했을 때 어떤 현상이 일어나는지 체크

// confirm page 디자인 변경(중앙 정렬 포함) -- 해결(MainAxisAlignment.center가 안먹혀서 Container를 SizedBox로 감싸니까 해결됨

//TODO: 사이즈 수치(상수값)들 constant에 수치값으로 저장하고 사용(ex. ScreenHeignt/2.64) 여러 폰에서 같은 비율의 사이즈로 표출 - get.context가 null error가 생김 대체할 것이 필요함

//TODO:  confirm_button에 Future<void> Function이 OnPress안에 잘 적용되도록 해야 함

// 숫자만 입력받는 textfield는 숫자만 입력되게 제한했는데 이메일칸도 영어하고 @만 작성되게 할 지 고민해보고 적용 - 해결(문자 정규식으로 해결)

//TODO: dispose()를 어디에 넣어야 할지 생각해야함

// 키보드가 올라온 상태에서는 snackbar가 작동하지 않음 에러구문(Floating SnackBar presented off screen.) -- textFormField로 대체 및 validator로 검증 후 에러메세지 하단에 출력

// 키보드 다음 버튼 인식하게끔 바꿔야됨 loginpage는 password에서 완료만 잘 됨 signup page는 잘 안됨 - 해결(FocusNode()를 이용해서 해결함)

// snackbar를 빼고 배민에서 쓰는 것처럼 textfield 밑에 빨간 글씨로 나오게끔 할 지 고민하고 실행 -- 해결

//TODO: textFormField 안에 errorText가 텍스트 작성 중 일때는 사라지게 해서 UX 높히기

// Amplify 에는 비밀번호 최소문자 수를 설정하는 것이 없으므로 8자 이내로 작성하면 confirm이 동작하면 안 됨