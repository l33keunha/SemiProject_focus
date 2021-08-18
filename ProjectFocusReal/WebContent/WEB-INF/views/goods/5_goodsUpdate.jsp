<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, goods.model.vo.Goods" %>
<%
	Board b = (Board)request.getAttribute("b");
	Goods g = (Goods)request.getAttribute("g");
	String[] imgChange = (String[])request.getAttribute("imgChange");
	String[] imgOrigin = (String[])request.getAttribute("imgOrigin");
	String[] imgNo = (String[])request.getAttribute("imgNo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성 틀</title>
    <link rel="stylesheet" href="css/goods.css">
    <link rel="stylesheet" href="css/0_main.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
    <script src="js/jquery-3.6.0.min.js"></script>
</head>
<body class="goods_write_body">
    <header class="header">
        <div class="header-box">
            <div class="font_main_title header-title">상품 수정</div>
            <button class="submitBtn btn" onclick="submit();">수정하기</button>
        </div>
    </header>
    
    <main>
        <div class="post-container">
            <div class="note-wrap">
                <div class="note-title">
                    <span class="main-color point">!</span><span class="font_main_title">상품 업로드 시 유의해주세요.</span>
                </div>
                <div class="note-content">
                    <ul>
                        <li class="font_content">식품의 경우 식품 위생법에 따른 표시 사항을 준수해주세요.</li>
                        <li class="font_content">거래 조건에 관한 정보를 입력해주세요.</li>
                        <li class="font_content">반품/교환 정보에 대한 안내를 기입해주세요.</li>
                        <li class="font_content">전자상거래에서 소비자보호에 관한 법률에 의한 반품규정이 판매자가 지정한 반품 조건보다 우선입니다.</li>
                    </ul>
                </div>  
            </div>

            <form action="<%= request.getContextPath() %>/updateGoods.sl" method="post" encType="multipart/form-data">
                <div class="area-wrap">
                    <div class="OOTC">
                       <div class="input-container">
                           <div class="input-wrap">
                               <input type="text" name="title" class="OOTC-input input-title" value="<%= b.getbTitle() %>">
                               <input type="text" name="price" class="OOTC-input input-price" value="<%= g.getgPrice() %>">
                               <input type="hidden" name="bNo" value="<%= b.getbNo() %>">                               
                           </div>
                            <div class="input-wrap">
                                <input type="text" name="company" class="OOTC-input input-brand" value="<%= g.getgCompany() %>">
                                <input type="text" name="date" class="OOTC-input input-price" placeholder="등록 날짜">
                                <input type="text" name="amount" class="OOTC-input input-price" value="<%= g.getgAmount() %>">
                            </div>
                       </div>
                    </div>
    
                    <div class="area">
                        <textarea name="content" id="content-area" class="goods_write_textarea"><%= b.getbContent() %></textarea>
                        <div class="area-line"></div>
                    	<div class="goods_thumbnail_box">
			            	<div class="goods_thumbnail_img_box">
			            		<img class="goods_thumbnail_img" id="titleImg" 
			            		src="<%= request.getContextPath() %>/goods_uploadFiles/<%= imgChange[0] %>">
<!-- 			            		<p class="goods_img_upload_text" id="text1">썸네일 이미지 등록</p> -->
				            </div>
				           	<div class="goods_thumbnail_img_box">
				           		<img class="goods_thumbnail_img" id="contentImg1" 
				           		<% if(imgChange.length >= 2) { %>
				           			src="<%= request.getContextPath() %>/goods_uploadFiles/<%= imgChange[1] %>"
				           		<% } %>>
				           		<% if(imgChange.length < 2) { %>
				           			<p class="goods_img_upload_text" id="text2">이미지 등록</p>
				           		<% } %>
				           	</div>
				           	<div class="goods_thumbnail_img_box">
				           		<img  class="goods_thumbnail_img" id="contentImg2" 
				           		<% if(imgChange.length >= 3) { %>
				           			src="<%= request.getContextPath() %>/goods_uploadFiles/<%= imgChange[2] %>"
				           		<% } %>>
				           		<% if(imgChange.length < 3) { %>
				           			<p class="goods_img_upload_text" id="text3">이미지 등록</p>
				           		<% } %>
				           	</div>
				           	<div class="goods_thumbnail_img_box">
				           		<img class="goods_thumbnail_img" id="contentImg3" 
				           		<% if(imgChange.length >= 4) { %>
				           			src="<%= request.getContextPath() %>/goods_uploadFiles/<%= imgChange[3] %>"
				           		<% } %>>
				           		<% if(imgChange.length < 4) { %>
				           			<p class="goods_img_upload_text" id="text4">이미지 등록</p>
				           		<% } %>
				           	</div>
	        			</div>
				        <div id="fileArea">
				        	<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this, 1)">
			                <input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this, 2)">
			                <input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this, 3)">
			           		<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this, 4)">
			           		<input type="hidden" name="imgNo" value="<%= imgNo[0] %>">
			           		<% if(imgChange.length >= 2) { %>
			           			<input type="hidden" name="imgNo" value="<%= imgNo[1] %>">
			           		<% } %>
			           		<% if(imgChange.length >= 3) { %>
			           			<input type="hidden" name="imgNo" value="<%= imgNo[2] %>">
			           		<% } %>
			           		<% if(imgChange.length >= 4) { %>
			           			<input type="hidden" name="imgNo" value="<%= imgNo[3] %>">
			           		<% } %>
			            </div>
                        <div class="area-line"></div>                        
<!--                         <div class="image_btn_box"><input type="button" class="btn image_btn" value="이미지 첨부"></div> -->
                    </div>
                </div>
                <input type="submit" style="display: none;" id="write_submit">
            </form>
        </div>

    </main>
    
    <footer>
		<div class="footer-container">
			<div class="footer-top">
				<div class="footer-logo"></div>
				<div class="footer-nav">
					<div class="footer-nav-wrap">
						<a href="#">믿을 수 있는 중고거래</a>
						<a href="#">자주 묻는 질문</a>
					</div>
					<div class="footer-nav-wrap">
						<a href="#" class="blur">회사소개</a>
						<a href="#">광고주센터</a>
						<a href="#" class="blur">동네가게</a>
					</div>
					<div class="footer-nav-wrap">
						<a href="#" class="blur">이용약관</a>
						<a href="#" class="blur">개인정보처리방침</a>
						<a href="#" class="blur">위치기반서비스 이용약관</a>
					</div>
				</div>
			</div>
			<div class="footer-content">
				<div class="footer-content-wrap">
					<div class="footer-content-info">(06234) 서울특별시 강남구 테헤란로 14길 6 남도빌딩 | TEL : 0000 - 0000 | FAX : 02 - 0000 - 0000</div>
					<div class="footer-content-info">MAIL : focus@service.com</div>
					<div class="footer-content-info">copyright @FOCUS CORP.ALL LIGHT RESERVED</div>
				</div>
			</div>
			<div class="footer-bottom"></div>
		</div>
	</footer>

    <script>
        window.addEventListener('scroll', function() {
            var scrollY = window.scrollY;
            var header = document.querySelector(".header");
            console.log(scrollY);
            if (scrollY > 101) {
                header.classList.add("active");
            } else {
                header.classList.remove("active");
            }
        });
        
        $(function() {
        	$('#fileArea').hide();
        	
        	$('#titleImg').click(function(){
        		$('#thumbnailImg1').click();
        	});
        	$('#contentImg1').click(function(){
        		$('#thumbnailImg2').click();
        	});
        	$('#contentImg2').click(function(){
        		$('#thumbnailImg3').click();
        	});
        	$('#contentImg3').click(function(){
        		$('#thumbnailImg4').click();
        	});
        });
        
        function LoadImg(value, num) {
        	if(value.files && value.files[0]) {
        		var reader = new FileReader();
        		
        		reader.onload = function(e) {
        			switch(num) {
        			case 1:
        				$('#titleImg').attr('src', e.target.result);
//         				console.log($('#thumbnailImg1').val());
        				$('#text1').hide();
        				break;
        			case 2:
        				$('#contentImg1').attr('src', e.target.result);
        				$('#text2').hide();
        				break;
        			case 3:
        				$('#contentImg2').attr('src', e.target.result);
        				$('#text3').hide();
        				break;
        			case 4:
        				$('#contentImg3').attr('src', e.target.result);
        				$('#text4').hide();
        				break;
        			}
        		}
        		
        		reader.readAsDataURL(value.files[0]);
        	}
        }
        
        function submit() {
        	$('#write_submit').click();
        }
        
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>