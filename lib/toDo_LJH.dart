
//todo : 1. 장바구니 만들기, 일단 HomePage의 Appbar에 아이콘 생성, 장바구니 DB와 연결필요
//todo : 2. 현재 S3는 업로드한 사진 순서대로 출력이 됨, 메뉴에 사진의 메타데이터를 입력해서 해당 데이터에 맞게 사진을 불러오는 방법으로 수정
//todo : 3. 메뉴의 카테고리 번호를 입력해서 해당 카테고리 별로 출력하도록
//todo : 4. 현재 메뉴 순서가 맞지 않음, MenuListModel의 sequence를 2개를 만들어서, 큰틀의 순서와 내부 틀의 순서 2가지로 분류해야 할듯
//todo : 5. 카테고리 방식 수정 필요, 기존의 이미지가 아닌 배달의민족과 같이 텍스트만 있고, 아래로 스크롤 하면 appbar에 있게, 이때 listview와 chip 사용해서 초기준비

//todo : 2023-05-31
//todo : 카테고리 및 인기 메뉴를 어떻게 불러올지, 메뉴를 불러오는 곳에서 불러올지, 따로 불러올지, 불러와도 메뉴를 띄우는 방법
//todo : 데이터 구조에 변화를 줌, MenuListModel을 기존 2차원에서 3차원으로 변경하고, 카테고리 별로 메뉴를 저장하도록
//todo : 인기 메뉴는 그냥 따로 PopularMenuListModel을 만듬, MenuListModel과 분리돼서 동작함 <- 해당 부분 수정 필요
//todo : 추후에 Query를 통해 보다 효율적이고 고차원적으로 DB 운영 필요, 현재는 오류로 인해 보류

//todo : 현재 S3에서 이미지를 불러오는 방식은 한번에 파일 순서대로 받아와, 순서대로 출력하는 방식이다.
//todo : 따라서 메뉴와 이미지가 매칭되지 않는 문제점이 발생, 따라서 MenuListModel에 이미지 URL을 넣을수 있는 공간 만들기
//todo : 이때 이미지 URL은 관리자가 사진과 메뉴를 업로드할때 입력되도록 진행, 현재 상황에서는 좀더 찾아보기

//todo : 2023-06-12
//todo : 현재 ShoppingCart의 UI 데모 완성, 백엔드는 아직 연결하지 않음
//todo : ShoppingCart에 데이터를 넣을때 기존의 데이터를 정제해서 넣어야됨
//todo : DB의 구조가 다르기 때문, 추후에 Amplify 데이터 모델이 아닌 따로 모델을 만들어서 작업하는 방법 생각해보기
//todo : detail 페이지의 bottom appbar에 DB 업로드하는 코드 작성중
//todo : DB의 구조가 다르기 때문, 추후에 Amplify 데이터 모델이 아닌 따로 모델을 만들어서 작업하는 방법 생각해보기

//todo : 2023-06-13
//todo : 현재 radiobox, checkbox 옵션들을 String으로 만들어 provider에 올리는 작업 완료
//todo : 이제 메뉴이름, 가격, 그리고 옵션 가격을 더하는 총가격 provider가 있어야 하고,
//todo : 메뉴이름은 어떻게 할지 고민중...

/**
 * 2023-06-14
 * 현재 menu name, menu price는 provider를 사용해 가져오기 성공,
 * 또한 radiobox, checkbox의 옵션 및 가격을 불러오는 provider 및 함수 생성 완료
 * 지금까지 count를 provider로 실행하는 방법 진행 중 계속 오류 발생함
 */

