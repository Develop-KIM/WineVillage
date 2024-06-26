<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>웹소켓 채팅</title></head>
<body>
    <script>
    function chatWinOpen() {
        var name = document.getElementById("chatName");
        //대화명이 입력되었는지 확인한다. 
        if (name.value == "") {
            alert("대화명을 입력 후 채팅창을 열어주세요.");
            name.focus();
            return;
        }
        //채팅창을 팝업으로 오픈한다. 이때 대화명을 파라미터로 전달한다.  
        window.open("chatWindow.do?chatName=" + name.value, "", 
        		"width=350,height=450");
        //다음 창을 띄울수 있도록 기존 입력값을 삭제한다. 
        id.value = "";
    }
    function chatWinOpen2() {
        var name = document.getElementById("chatName");
        if (name.value == "") {
            alert("대화명을 입력 후 채팅창을 열어주세요.");
            name.focus();
            return;
        }
        window.open("chatUI.do?chatName=" + name.value, "", 
        		"width=321,height=482,scrollbars=no");
        id.value = "";
    }
    </script>
    <h2>웹소켓 채팅 - 대화명 적용해서 채팅창 띄워주기</h2>
    대화명 : <input type="text" id="chatName" />
    <button onclick="chatWinOpen();">채팅참여(기본스킨)</button>
    <button onclick="chatWinOpen2();">채팅참여(카톡스킨)</button>
</body>
</html>



