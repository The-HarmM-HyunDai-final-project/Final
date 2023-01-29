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

    </div>
  </div>

  <script src="${pageContext.request.contextPath}/resources/js/test.js" defer=""></script>
</body>
</html>