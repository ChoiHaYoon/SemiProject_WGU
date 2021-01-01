<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wgu.bulletin.model.vo.*,wgu.member.model.vo.*, java.util.ArrayList" %>
<%
	ArrayList<Bulletin> list = (ArrayList<Bulletin>)request.getAttribute("list");
	PageNum p = (PageNum)request.getAttribute("p");
	
	int listCount = p.getListCount();
	int currentPage = p.getCurrentPage();
	int maxPage = p.getMaxPage();
	int startPage = p.getStartPage();
	int endPage = p.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 익명게시판</title>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet"> 
<style>
@media screen and (min-width: 480px) {
background-color: lightgreen;
}
	
	#banner{
	position: absolute;
	top: 160px;
	left: 0px;
	width: 1519.5px;
	height: 240px;
	display: inline-block;
	}
	
	.mypage{
	position: absolute;
	top: 435px;
	left: 310px;
	font-weight: 800;
	font-size: 48px;
	width: 500px;
	}
	
	
	/* 좌측 메뉴바 */
	aside {
	position: absolute;
	top: 470px;
	width: 230px;
	height: 1500px;
	background: white;
	font-family: "맑은 고딕";
	font-weight: 700;
	}
	
	
	#menu {
	width: 200px;
	height: 100%;
	padding-right: 10px;
	font-size: 22px;
	}
	
	.menuList {
	list-style: none;
	text-align: center;
	}
	
	
	a {
	text-decoration: none;
	color: black;
	}
	
	.community {
	font-size: 18px;
	}
	
	/* 세션시작 */
	.bannerTxt{
	position : absolute;
	top : -700px;
	left : -300px;
	}
	
	.mypageDiv{
	position : absolute;
	top : 5px;
	left : 10px;
	width : 300px;
	}
		
	.mypage {
	width : 250px;
	}
	
	.hr1 {
	position: absolute;
	top: 575px;
	left: 300px;
	width: 1150px;
	border: 0.5px solid lightgray;
	}



	/* 각자 구현 내용*/
	section {
	position: absolute;
	top: 700px;
	left: 300px;
	background: white;
	width: 1200px;   
	}
   
	/* 게시글 보기 */
	#bulletin{
	margin-top: -40px;
	border-bottom: 1px solid black;
	border-collapse: collapse; /* th,tr,td하고 table간격하고 없애기(한줄만들기) */
	width: 95%;
	margin-left: 29px;
	background: rgb(255, 255, 255);
	}
	
	#bulletin>th,tr,td{
	border-bottom: 2px solid rgb(224, 224, 224);
	text-align: center;
	}
	
	.th{
	padding-top: 5px;
	padding-bottom: 5px;
	height: 50px;	
	background: rgb(114,114,114);/* 수정해야함 */
	border-bottom: 2px solid rgb(224, 224, 224);
	color: white;
	}
	
	#num{border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;}
	#see{border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;}
	
	.td{
	padding-top: 10px;
	padding-bottom: 10px;
	height: 40px;
	}
	
	#num{
	padding-right: 25px;
	padding-left: 25px;
	}
	
	/* 제목 */
	#title{padding-right: 200px; padding-left: 200px;}
	/* 작성자 */
	#writer{padding-right: 50px; padding-left: 50px;}
	/* 작성일 */
	#date{padding-right: 30px; padding-left: 30px;}
	/* 조회수 */
	#see{padding-right: 25px; padding-left: 25px;}
	/* 등록하기 */
	#write{
	margin-left: 1080px; margin-top: 5px;
	padding-left: 10px; padding-right: 10px; 
	padding-top: 5px; padding-bottom: 5px; 
	border: none; background: rgb(94, 94, 94);
	border-radius: 6px; color: white;}
	
	/* 등록하기 버튼의 링크 */
	#write>a{color: white;}
	
	/* 페이지 갯수 */
	.paging{
	list-style: none; margin: 0px; 
	margin-left: 470px; margin-top: 25px;}
	
	.pagingnum{
	display: inline-block; margin-right: 4px;}
		
	.link{border: none; width: 30px; height: 30px; 
	text-align: center; padding-top: 3px; padding-bottom: 3px;
	border-radius: 6px; background: rgb(236,236,236);}
	
	footer {
	display: inline-block;
    position : absolute;
    left : 0px;
	top: 1845px;
	width : 1519px;
	height : 150px;
	background : #3867A6;
	color : white;
	text-align: center;
	}
	
	
	
</style>
</head>

<body>
<%@ include file="../common/menubar.jsp" %>

   <!-- 각자 구현부분 -->
   <section>
        <div class="bannerTxt" id="bannerTxt">
        <img id='banner' src="image/5.png">
      <div id='mypageDiv' class="mypageDiv">
         <p class='mypage'>익명게시판</p>
      </div>
      <br>
      <hr class="hr1">
      </div>
      <div id = 'content'>
     	<!-- 게시글목록 -->
		<form>
		<div>
		<table id="bulletin">
            <tr>
               <th id=num class=th>글번호</th>
               <th id=title class=th>글제목</th>
               <th id=writer class=th>작성자</th>
               <th id=date class=th>작성일</th>
               <th id=see class=th>조회수</th>
            </tr>
            <% if(list.isEmpty()){ %>
            <tr>
               <td colspan="5">등록된 게시물이 없습니다.</td>
            </tr>
            <% } else { %>
            		<% for(Bulletin b : list) {%>
            		<tr class=tr>
				<td class=td><input type="hidden" value="<%= b.getBulletinNo() %>"><%= b.getBulletinNo() %></td>
				<td class=td style="overflow: hidden; text-overflow:ellipsis;"><%= b.getBulletinTitle() %></td>
				<td class=td>익명<input type="hidden" value="<%= b.getMemberNo() %>"></td>
				<td class=td><%= b.getBulletinDate() %></td>
				<td class=td><%= b.getBulletinCount() %></td>
			</tr>
            	<% } %>
            <% } %>
         </table>
		
		<br>
		<% if(loginUser != null) { %>
		<input type="button" id="write" value="등록하기" onclick="b_write();">
		<% } %>
		</div>
		
		
		
		</form>
		
		<!-- 페이지갯수넘버링 -->
		<div id='paging'>
			<ul class="paging">
				<li class=pagingnum><button onclick='location.href="<%= request.getContextPath() %>/BulletinList.bu?currentPage=1"' class=link>&lt;&lt;</button></li>
				<li class=pagingnum><button onclick="location.href='<%= request.getContextPath() %>/BulletinList.bu?currentPage=<%= currentPage - 1 %>'" id= "before" class=link>&lt;</button></li>
				<% for(int n = startPage; n <= endPage; n++) { %>
					<% if(n == currentPage) { %>
					<li class=pagingnum>
						<button id="choosen" class=link disabled style="background: rgba(56,103,166,0.56); color: white;"><%= n %></button>
					</li>
					<% } else { %>
					<li class=pagingnum>
						<button id="num_b" class=link onclick="location.href='<%= request.getContextPath() %>/BulletinList.bu?currentPage=<%= n %>'"><%= n %></button>
					</li>
					<% } %>
				<% } %>
				<li class=pagingnum><button onclick="location.href='<%= request.getContextPath() %>/BulletinList.bu?currentPage=<%= currentPage + 1 %>'" id="after" class=link>&gt;</button></li>
				<li class=pagingnum><button onclick="location.href='<%= request.getContextPath() %>/BulletinList.bu?currentPage=<%= maxPage %>'" class=link>&gt;&gt;</button></li>
			</ul>
		</div>
		
		
      </div>
      
      <script>
			if(<%= currentPage <= 1 %>){
				var before = $("#before");
				
				before.attr('disabled', 'true');
			}
			
			if(<%= currentPage <= endPage %>) {
				var after = $("#after");
				
				after.attr('disabled', 'true');
			}
			
			function b_write(){
				location.href="<%= request.getContextPath() %>/BulletinWriter.bu"
			}
		</script>
      
      
      
   </section>
   
   
   
   <!-- 좌측 메뉴바 -->
   <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li><a href='#'>커뮤니티</a></li>
            <li><img src="image/줄.PNG"></li>
            <br>
            <li><a href="<%= request.getContextPath() %>/BulletinList.bu" class='community'>익명게시판</a></li>
            <br>
            <li><a href="<%= request.getContextPath() %>/NoticeList.nr" class='community'>공지사항</a></li>
         </ul>
      </div>
   </aside>


	<script>
		
		// 게시물마우스올렸을때 색변화
		$("#bulletin td").mouseenter(function(){
			$(this).parent().css({'background': 'lightgray','cursor':'pointer'});
		}).mouseout(function(){
			$(this).parent().css('background', 'none');
		}).click(function(){
			var bNo = $(this).parent().children().children('input').val();
			
			<% if(loginUser == null) {%>
				alert("회원만 이용할 수 있는 서비스입니다.");
				location.href="<%= request.getContextPath() %>/loginForm.me";
			<% } else {%>
				// 게시글보기
				location.href="<%= request.getContextPath() %>/BulletinDetail.bu?bNo=" + bNo;
			<% }%>
		});
		
		
		// 등록하기 버튼
		$('#write').mouseenter(function(){
			$(this).css({'background':'lightgray','color':'black'});
		}).mouseout(function(){
			$(this).css({'background':'rgb(94, 94, 94)','color':'white'});
		});
		
		function b_write(){
			location.href="<%= request.getContextPath() %>/BulletinWriter.bu";
		}
		
		// 페이징버튼 >> 누르면 색변화
	   	$(".pagingnum").click(function(){
	   		$(this).children().css({'background':'lightblue','cursor':'pointer'});
	   	});
		
      
	</script>
  	
  	<footer>
	<%@ include file = "../common/foot.jsp" %>
	</footer>
  	
</body>
</html>