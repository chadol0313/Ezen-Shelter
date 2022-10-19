# :pushpin: 이젠쉼터(Ezen-Shelter)
- 유기동물 보호소 연계 입양 사이트
- [요약 PDF](https://drive.google.com/file/d/1H_2cWuqbTyeWTTjuMFHTGxpQOhAxfxse/view?usp=sharing)
>최근 반려인구가 증가하면서 그에 따른 유기동물들도 증가하고 있습니다. 유기동물들의 유기 이후 행적은 가정에 입양되는 경우도 있으나, 보호시설에 맡겨지는 경우가 가장 많았습니다 하지만, 보호시설로 옮겨진다고 하여도 일정 기간이 지나면 안락사를 진행해야합니다. 또한 펫샵에서 팔리는 동물들의 반인륜적인 생태를 감안한다면 유기동물 입양 시장이 적극적으로 활성화되어야 한다고 생각합니다 해당 홈페이지는 전국에 있는 유기동물 보호소와 유기동물 입양을 희망하는 예비 보호자를 연결해주는 통로가 되고자 만들어졌습니다. 모든 유기동물들이 따뜻한 가족의 품으로 돌아갈 수 있기를 희망합니다


</br>

## 1. 제작 기간 & 참여 인원
- 2022.08.15 ~ 2022.08.31
- 5명

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 8
  - Spring Boot 2.7.4
  - Gradle
  - Mybatis
  - Spring tool suite 3.9.17
  - Apache Tomcat 9
  - MySQL 5.7
  - Oracle 11g
#### `Front-end`
  - HTML5 & CSS3
  - JavaScript

</br>

## 3. ERD 설계
![](https://user-images.githubusercontent.com/115128823/195017521-8e5c8a5e-3996-43a2-98a8-94ecbfe5db03.jpg)


## 4. 담당 핵심 기능
해당 사이트에서는 사용자가 마음에 드는 유기동물에 '찜하기' 기능이 있습니다  
쇼핑몰 장바구니 기능과 유사하며, 유효기간은 없습니다  
찜하기 버튼을 통해 DB 추가/삭제를 할 수 있습니다.  

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow1.png)

### 4.2. 사용자 요청
![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_vue.png)

- **URL 정규식 체크** :pushpin: [코드 확인](https://github.com/Integerous/goQuality/blob/b587bbff4dce02e3bec4f4787151a9b6fa326319/frontend/src/components/PostInput.vue#L67)
  - Vue.js로 렌더링된 화면단에서, 사용자가 등록을 시도한 URL의 모양새를 정규식으로 확인합니다.
  - URL의 모양새가 아닌 경우, 에러 메세지를 띄웁니다.

- **Axios 비동기 요청** :pushpin: [코드 확인]()
  - URL의 모양새인 경우, 컨텐츠를 등록하는 POST 요청을 비동기로 날립니다.

### 4.3. Controller

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_controller.png)

- **요청 처리** :pushpin: [코드 확인](https://github.com/Integerous/goQuality/blob/b2c5e60761b6308f14eebe98ccdb1949de6c4b99/src/main/java/goQuality/integerous/controller/PostRestController.java#L55)
  - Controller에서는 요청을 화면단에서 넘어온 요청을 받고, Service 계층에 로직 처리를 위임합니다.

- **결과 응답** :pushpin: [코드 확인]()
  - Service 계층에서 넘어온 로직 처리 결과(메세지)를 화면단에 응답해줍니다.

### 4.4. Service

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_service1.png)

- **Http 프로토콜 추가 및 trim()** :pushpin: [코드 확인]()
  - 사용자가 URL 입력 시 Http 프로토콜을 생략하거나 공백을 넣은 경우,  
  올바른 URL이 될 수 있도록 Http 프로토콜을 추가해주고, 공백을 제거해줍니다.

- **URL 접속 확인** :pushpin: [코드 확인]()
  - 화면단에서 모양새만 확인한 URL이 실제 리소스로 연결되는지 HttpUrlConnection으로 테스트합니다.
  - 이 때, 빠른 응답을 위해 Request Method를 GET이 아닌 HEAD를 사용했습니다.
  - (HEAD 메소드는 GET 메소드의 응답 결과의 Body는 가져오지 않고, Header만 확인하기 때문에 GET 메소드에 비해 응답속도가 빠릅니다.)

  ![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_service2.png)

- **Jsoup 이미지, 제목 파싱** :pushpin: [코드 확인]()
  - URL 접속 확인결과 유효하면 Jsoup을 사용해서 입력된 URL의 이미지와 제목을 파싱합니다.
  - 이미지는 Open Graphic Tag를 우선적으로 파싱하고, 없을 경우 첫 번째 이미지와 제목을 파싱합니다.
  - 컨텐츠에 이미지가 없을 경우, 미리 설정해둔 기본 이미지를 사용하고, 제목이 없을 경우 생략합니다.


### 4.5. Repository

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_repo.png)

- **컨텐츠 저장** :pushpin: [코드 확인]()
  - URL 유효성 체크와 이미지, 제목 파싱이 끝난 컨텐츠는 DB에 저장합니다.
  - 저장된 컨텐츠는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.

</div>
</details>

</br>

