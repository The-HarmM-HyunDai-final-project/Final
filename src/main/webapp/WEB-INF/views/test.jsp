<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<script
	src="https://player.live-video.net/1.6.1/amazon-ivs-player.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/test.css">
</head>

<body>
 <div id="app">
    <div class="inner">

      <!-- Player wrapper, forcing 16:9 aspect ratio -->
      <div class="player-wrapper">
        <div class="aspect-spacer"></div>
        <div class="pos-absolute full-width full-height top-0">
          <video controls id="video-player" class="el-player" controls autoplay  preload="auto">
          	<!-- playsinline -->
          </video>
        </div>
      </div>

      <!-- Quiz UI -->
      <div class="quiz-wrap">
        <div id="waiting"><span class="waiting-text float">Waiting for the next question</span></div>
        <div id="quiz" class="card drop">
          <div id="card-inner">
            <h2 id="question"></h2>
            <div id="answers"></div>
          </div>
        </div>
      </div>

    </div>
  </div>

  <script src="${pageContext.request.contextPath}/resources/js/test.js" defer=""></script>
</body>
</html>