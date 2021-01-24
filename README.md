# **KH SemiProject WGU** 
## 대학교통합정보시스템 WGU e-campus

### :raising_hand_woman: Project Team Member
> :sunflower: Team Leader : 김기쁨 <br>
> :blossom: Team Member : 명다정, 이영실, 최하윤, 한지원

### :hammer_and_wrench: Project Part
> :peach: 기쁨<br>
과목 개설/조회<br>
수강 신청/취소<br>
성적 입력/수정/조회<br>
강의평가 입력/조회<br>
수강생 조회<br><br>
> :grapes: 다정<br>
식당 등록/수정/삭제<br>
요일메뉴 등록/수정<br>
식당 조회<br>
식권 구매/조회 <br><br>
> :lemon: 영실<br>
회원가입/로그인<br>
정보수정<br>
아이디/비밀번호 찾기<br>
회원탈퇴<br><br>
> :apple: 하윤<br>
익명게시판 등록/수정/삭제<br>
공지사항 등록/수정/삭제<br>
댓글 등록/수정/삭제<br>
학사일정 등록/수정/삭제<br><br>
> :tomato: 지원<br>
스쿨버스 등록/삭제<br>
스쿨버스 예약/결제<br>
스쿨버스 예약 현황확인<br>

### :building_construction: Development schedule (2020.07.24 ~ 2020.09.11)
> 프로젝트 기획 : 2020.07.24 ~ 2020.07.29<br>
> UI회의 / 설계 : 2020.07.30 ~ 2020.08.05<br>
> DB회의 / 설계 : 2020.08.06 ~ 2020.08.09<br>
> UI제작 / DB검토 : 2020.08.10 ~ 2020.08.24<br>
> 프로젝트 구현 : 2020.08.25 ~ 2020.09.08<br>
> 통합 테스트 : 2020.09.09 ~ 2020.09.11<br>

### :computer:  Development Environment
> Development Tool : Eclipse 4.15.0, sqlDeveloper<br>
> Server : Apache Tomcat 9.0<br>
> Database : Oracle 11g<br>
> Development Language : JAVA , HTML5, CSS3, JavaScript, jQuery, SQL, JSP, Servlet<br>
> Team Coop : ERDCloud, kakaoOven<br>

### :mag: Development Background
> 기존에 만들어진 대학교 홈페이지에서 불편한 기능들을 보완하여<br>
> 학생들의 수강신청, 성적조회 서비스는 물론 더 나아가 학생들의<br>
> 편리한 대학생활을 위한 학식 예약 서비스와 스쿨버스 좌석 예약 서비스도<br>
> 함께 운영, 관리할 수 있는 시스템을 구현한다.<br>

###  Implementation Goal
> - 편리한 UI
> - 수강신청 : 어디에서나 간편하게 수강신청
> - 성적조회 : 수강한 과목의 성적조회 및 강의평가와 건의사항 작성
> - 예약서비스 : 학식 예약과 스쿨버스 예약

###  Implementation Screen

#### :+1: Main<br>
![메인페이지](https://user-images.githubusercontent.com/66005208/105622856-3b4d8080-5e58-11eb-9b82-2ae77f7d5a4c.jpg)
메인페이지에서 공지사항은 ajax를 이용하여 등록한 최신순으로 5개만 나타나게 하였습니다. <br>
학사일정은 JavaScript를 이용해서 이번달과 지난달, 다음달의 월을 알아내고 그것을 이용해 ajax에 값을 넘겨<br> 해당달의 일정들을 가져오게 하였습니다.<br><br>


#### :+1: Anonymous Board<br>
![익명게시판](https://user-images.githubusercontent.com/66005208/105623329-34c10800-5e5c-11eb-82b2-545cacbdc40d.jpg)
사용자 모두가 사용할 수 있는 익명게시판은 한 페이당 5개씩 게시물이 나타나게 됩니다.<br>
페이징처리가 되어있으며 등록하기 버튼을 클릭시 익명게시물을 작성할 수 있습니다.<br><br>


#### :+1: Board Write<br>
![익명게시글 쓰기](https://user-images.githubusercontent.com/66005208/105623508-93d34c80-5e5d-11eb-97ab-8c95439e3632.jpg)
사용자 모두가 작성할 수 있으며, 작성자는 무조건 익명으로 등록이 됩니다.<br>
첨부파일은 두개만 등록이 가능하고 제목과 내용을 입력 후 등록하기 버튼을 클릭하면 자동으로 등록이 되면서<br>
익명게시판으로 넘어가게 됩니다.<br><br>

#### :+1: Board Detail<br>
![익명게시글보기 (2)](https://user-images.githubusercontent.com/66005208/105623641-9da97f80-5e5e-11eb-9820-9a125cabd15e.jpg)
게시글 상세보기 페이지를 들어가게 되면 글 제목, 글작성자와 글작성날짜가 나타나고<br>
게시글을 등록 시 같이 등록한 파일의 이름이 나타납니다.<br>
게시글과 함께 댓글의 목록도 같이 뜨며 상단에는 게시글 작성자일 경우 삭제버튼과 수정버튼을 배치하였습니다.<br>
하단에는 이전 글과 다음 글로 넘어갈 수 있게 배치하였습니다.<br><br>

#### :+1: Notice Management<br>
![공지사항관리페이지](https://user-images.githubusercontent.com/66005208/105623815-178e3880-5e60-11eb-9e24-2632fca1ab70.jpg)
게시판 관리자페이지는 관리자가 로그인했을 경우 들어올 수 있고 탭을 이용해서 공지사항과 익명게시판을 관리할 수 있습니다.<br>
게시글을 선택하면 등록한 공지사항을 볼 수 있고 번호 앞에 체크박스를 이용해 공지사항을 여러 개 삭제할 수 있습니다.<br> 
공지사항 등록은 익명게시판과 같이 제목, 첨부파일, 내용을 입력할 수 있습니다.<br>
게시한 공지사항을 검색해서 삭제도 가능합니다.<br><br>


#### :+1: Schedule<br>
![학사일정페이지](https://user-images.githubusercontent.com/66005208/105623793-ed3c7b00-5e5f-11eb-9d22-55587e458791.jpg)
학사일정 관리자 페이지는 왼쪽에는 등록된 일정 리스트들이 나타나고 오른쪽에는 일정을 등록할 수 있는 공간이 나타납니다.<br>
왼쪽 리스트의 수정하기 버튼을 클릭하면 ajax를 통해 오른쪽 공간이 등록하기대신 수정하기로 변경이 됩니다.<br><br>

