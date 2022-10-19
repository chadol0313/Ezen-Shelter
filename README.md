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

### 4.1. 찜하기

- **유기동물 상세페이지 조회 Controller** :pushpin: [코드 확인](https://github.com/chadol0313/Ezen-Shelter/blob/452a718d8e362438d9a93aeb6e77c83cd91743d5/Spring_EzenShelter/src/main/java/com/ezen/p2/controller/PetController.java#L84)
  - 상세페이지 클릭시 PetController에서는 Session에서 얻은 로그인유저의 아이디와 
  - 클릭한 상세페이지의 동물번호를 파라미터로 Heart테이블 DB를 조회합니다
  - 조회한 값을 Dto에 담고 setAttribute로 보냅니다
  - 서비스에서 동물번호로 조회한 결과를 해쉬맵에 담습니다
 
- **찜등록 및 삭제** :pushpin: [코드 확인](https://github.com/chadol0313/Ezen-Shelter/blob/452a718d8e362438d9a93aeb6e77c83cd91743d5/Spring_EzenShelter/src/main/java/com/ezen/p2/controller/PetController.java#L113)
  - session에서 회원정보를 얻어 MemberVO에 담습니다
  - Heart 객체를 생성하고 MemberVO 아이디와 @RequestParam으로 얻은 동물 번호를 HeartDto에 담습니다
  - Service에 HeartDto로 DB를 추가하는/삭제하는 메서드를 실행합니다
  - 페이지 유지를 위해 redirect로 돌아갑니다
  

### 4.2. 입양신청

- **요청 처리** :pushpin: [코드 확인](https://github.com/chadol0313/Ezen-Shelter/blob/452a718d8e362438d9a93aeb6e77c83cd91743d5/Spring_EzenShelter/src/main/java/com/ezen/p2/controller/PetController.java#L160)
  - @RequestParam으로 얻은 값을 HeartDto에 넣고 동물 상태를 변경합니다
  - 완료처리되면 mypage로 이동합니다


### 4.5. Repository

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_repo.png)

- **컨텐츠 저장** :pushpin: [코드 확인]()
  - URL 유효성 체크와 이미지, 제목 파싱이 끝난 컨텐츠는 DB에 저장합니다.
  - 저장된 컨텐츠는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.

</div>
</details>

</br>

