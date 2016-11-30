<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<sec:authentication property="name" var="LoingUser" />

<style type="text/css">
.table_write {
	margin-left: auto;
	margin-right: auto;
	width: 40%;
	text-align: center;
	border-collapse: collapse;
	font-family: 'Jeju Gothic', sans-serif;
}

.th_write {
	text-align: left;
	background: #054A75;
	color: #fff;
	text-align: center;
	border-right: 1px solid #fff;
	height: 40px;
	width: 20%;
}

.tr_write {
	background: #f9f9f9;
	width: 80%;
}

.tr_write:hover {
	background: #F3F5BB
}

.td_write1 {
	height: 50px;
}

.td_write2 {
	height: 400px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>
<body>
	<br>
	<br>
	<br>
	<c:forEach items="${result }" var="list">
		<input type="hidden" value="${ list.noticenum}" name="noticenum">
		<table class="table_write">
			<tr class="tr_write">
				<th class="th_write">제목</th>
				<td class="td_write1">${list.title }</td>
			</tr>
			<tr class="tr_write">
				<th class="th_write">이름</th>
				<td class="td_write1">${list.name }</td>
			</tr>
			<tr class="tr_write">
				<th class="th_write">직급</th>
				<td class="td_write1">${list.position }</td>
			</tr>
			<tr class="tr_write">
				<th class="th_write">내용</th>
				<td class="td_write2"><pre><font face="Jeju Gothic">${list.contant }</font></pre></td>
			</tr>
		</table>
<br>
		<input style="display: block; float: right; margin-right: 410px;"
			width="40" type="image" src="/controller/resources/images/list.png"
			alt="button"
			onclick="document.location.href='${pageContext.request.contextPath}/pos/ps_notice_list?'" />
	</c:forEach>
	<br>
	<br>
	<br>
	
	<!-- <ul id="replies">
	</ul> -->
	
	<div align="center">
	<table id="replies" style="">
		
	</table>
	</div>
	<br>
	<div align="center">
		<div>
			<textarea rows="4" cols="40" name="replytext" id="newReplyText">
			
			</textarea>
			<!-- <input type="text" name="replytext" id="newReplyText"> -->
		</div>
		<button type="button" id="replyAddBtn" >ADD REPLY</button>
	</div>
	
	<div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id='closeBtn'>Close</button>
		</div>
	</div>
	
<script>
getAllList();
var loginID = "${LoingUser}";

function getAllList(){
	var bno = ${num};
	//var id =${id};
	$.getJSON("ps_notice_repl_list/" + bno, function(data){
		console.log(data.length);
		var str = "";
		
		$(data).each(function(){
			str += "<tr>"
			+ "<td>" + this.replyer + "</td>"
			+ "<td>" + this.replyText + "</td>"
			+ "<td>" + this.regdate_char + "</td>";
			if(this.replyer != loginID){
				
			}
			else{
				str += "<td data-rno='"+this.rno+"' class='replyLi'><button>delete</button><td></tr>";
			}
		});
		
		$("#replies").html(str);
	});	
}

$("#replyAddBtn").on("click", function() {
	
	var bno = ${num};
	var replyer = "${LoingUser}";
	var replyText = $("#newReplyText").val();

	console.log(bno);
	console.log(replyer);
	console.log(replyText);
	
	$.ajax({
		type : 'post',
		url : 'ps_notice_repl_write',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			bno : bno,
			replyer : replyer,
			replyText : replyText
		}),
		success : function(result) {

			if (result == 'SUCCESS') {

				//alert("등록 되었습니다.");
				getAllList();

			}
		}
	});
});

$("#replies").on("click", ".replyLi button", function() {

	var reply = $(this).parent();
	console.log(reply);
	var rno = reply.attr("data-rno");
	console.log(rno);
	//var replytext = reply.text();

	//$(".modal-title").html(rno);
	//$("#replytext").val(replytext);
	//$("#modDiv").show("slow");
	$.ajax({
		type : 'post',
		url : 'ps_notice_repl_delete',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			rno : rno
		}),
		success : function(result) {
			console.log("result: " + result);
			if (result == 'SUCCESS') {
				alert("삭제 되었습니다.");
				//$("#modDiv").hide("slow");
				getAllList();
			}
		}
	});
});

$("#replyDelBtn").on("click", function() {

	var rno = $(".modal-title").html();
	var replytext = $("#replytext").val();

	$.ajax({
		type : 'delete',
		url : 'ps_notice_repl_delete' + rno,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : 'text',
		success : function(result) {
			console.log("result: " + result);
			if (result == 'SUCCESS') {
				alert("삭제 되었습니다.");
				$("#modDiv").hide("slow");
				getAllList();
			}
		}
	});
});

$("#replyModBtn").on("click",function(){
	  
	  var rno = $(".modal-title").html();
	  var replytext = $("#replytext").val();
	  
	  $.ajax({
			type:'put',
			url:'ps_notice_repl_update'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({replytext:replytext}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					 $("#modDiv").hide("slow");
					//getAllList();
					 getPageList(replyPage);
				}
			}
	  });
});		

</script>	
</body>
</html>