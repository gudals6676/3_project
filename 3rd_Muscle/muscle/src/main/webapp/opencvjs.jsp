<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="/muscle" />
<!DOCTYPE html>
<html>
<head>
<% 
String data = request.getParameter("data");
%>
<meta charset="utf-8">
<title>Hello OpenCV.js</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script type="text/javascript">
function dic() {  
    var word = $("#word").val();
    $.ajax({
       url : "${cpath}/musclevideoAjax.do",
       type : "get",
       data : {"word" : word},
       dataType : "json",
       success : resultHtml,
       error : function(error) {
          alert("에러다잉?");
       }
    });
 }
</script>
<style type="text/css">
.con1 {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
  grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
  gap: 0px 0px;
  grid-auto-flow: row;
}

.con2 { grid-area: 1 / 1 / 10 / 10; }

.hand { grid-area: 1 / 1 / 5 / 10; }

.ear {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 0.16fr 0.33fr 2.51fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  grid-area: 5 / 1 / 10 / 10;
}

.ser { grid-area: 1 / 1 / 2 / 2; }

.vigigi {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 0.33fr 1.67fr;
  grid-template-rows: 1.14fr 0.86fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  grid-template-areas:
    ". serser serser serser bubuser ."
    ". serser serser serser bubuser .";
  grid-area: 2 / 1 / 3 / 2;
}

.serser { grid-area: serser; }

.bubuser { grid-area: bubuser; }

.gongbak { grid-area: 1 / 1 / 2 / 2; }

.vi {
  display: grid;
  grid-template-columns: 0.5fr 1.66fr 0.84fr;
  grid-template-rows: 1fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  grid-template-areas:
    ". vigigi .";
  grid-area: 3 / 1 / 4 / 2;
}

.vigigi { grid-area: vigigi; }

.start {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 0.3fr 2.2fr 0.3fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  grid-area: 1 / 1 / 5 / 4;
}

.gh1 { grid-area: 1 / 1 / 2 / 4; }

.webcam1 { grid-area: 2 / 1 / 3 / 4; }

.bu1 {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  grid-template-areas:
    "bubu1 bubu2";
  grid-area: 3 / 1 / 4 / 4;
}

.bubu1 { grid-area: bubu1; }

.bubu2 { grid-area: bubu2; }

.ghgh1 { grid-area: 1 / 2 / 2 / 3; }

.check {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 0.3fr 2.32fr 0.3fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  grid-area: 1 / 4 / 5 / 7;
}

.gh2 { grid-area: 1 / 1 / 2 / 4; }

.ghgh2 { grid-area: 1 / 2 / 2 / 3; }

.bu2 {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  grid-template-areas:
    "bubu3 bubu4";
  grid-area: 3 / 1 / 4 / 4;
}

.bubu4 { grid-area: bubu4; }

.bubu3 { grid-area: bubu3; }

.webcam2 { grid-area: 2 / 1 / 3 / 4; }

.flask {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 0.3fr 1.66fr 1fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  grid-template-areas:
    ". . ."
    "flaskgh flaskgh flaskgh"
    "voicei voicei voicei";
  grid-area: 1 / 7 / 5 / 10;
}

.flaskgh { grid-area: flaskgh; }

.voicei {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 1fr 1fr 1fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  grid-template-areas:
    ". voicegigi ."
    ". voicegigi ."
    ". voicegigi .";
  grid-area: voicei;
}

.voicegigi { grid-area: voicegigi; }

</style>



</head>
<body>
   <script src="/muscle/resources/js/voice.js"></script>
   <script src="/muscle/resources/js/camera.js"></script>

   <div class="con1">
  <div class="con2"></div>
  <div class="hand"></div>
  <div class="ear">
    <div class="ser"></div>
    <div class="vigigi">
      <div class="검색창창"><input type="text" name="word" id="word"
                  style="border-radius: 28px; height: 40px; width: 400px; background: #ffffff;"></div>
      <div class="bubuser"><a onclick="dic()" class="btn-outline-sm"> 검색</a></div>
    </div>
    <div class="gongbak"></div>
    <div class="vi">
      <div class="vigigi" id="list" style="margin-top: 100px;"></div>
    </div>
  </div>
  <div class="start">
    <div class="gh1"></div>
    <div class="webcam1"><video autoplay muted id="preview"></video></div>
    <div class="bu1">
      <div class="bubu1"><button class="record-button" onclick="a()" style="">녹화</button></div>
      <div class="bubu2"><button class="stop-button">중지</button></div>
    </div>
    <div class="ghgh1"><h2 style="text-align: center;">촬영</h2></div>
  </div>
  <div class="check">
    <div class="gh2"></div>
    <div class="ghgh2"><h2 style="text-align: center;">녹화확인</h2></div>
    <div class="bu2">
      <div class="bubu4"><button>
               <a class="download-button">보내기</a>
            </button></div>
      <div class="bubu3"><button class="play-button">확인</button></div>
    </div>
    <div class="webcam2"><video id="recording"></video></div>
  </div>
  <div class="flask">
    <div class="flaskgh"><textarea id="text" rows="5" cols="20"><%=data %></textarea></div>
    <div class="voicei">
      <div class="voicegigi"></div>
    </div>
  </div>
</div>







</body>
</html>