# The Harm

<div align="center">
  <img src="https://user-images.githubusercontent.com/68410186/224285603-5a24ed74-3d27-467f-a06f-1c1ed2d9be18.png" width="300" height="300">
</div>

# Introduce

> 한국소프트웨어산업협회 MSA기반 full stack 개발자 양성과정 5기 최종프로젝트(4차 프로젝트)<br/>개발기간 : 2023.01.05~2023.02.03

### Team
> **박여명(팀장)**<br/>**정승하**<br/>**박서은**<br/>**신미림**<br/>

# Description

소비의 트렌드를 주도해 나아가는 MZ세대를 위한 플랫폼으로<br/>
커져가는 리셀 시장과 한정판 아이템을 좋아하는 MZ를 위한 리셀,<br/>
더욱 새로운 소비 경험을 제공하기위한 경매 라이브 커머스,<br/>
자신의 개성을 마음껏 표출할 수 있는 SNS기능 등  MZ를 위한 소통, 거래 플랫폼 입니다.

## 기능

|  **로그인/회원가입**|  **리셀**           |   **커뮤니티**       |**리뷰**                  |**경매쇼 라이브**        |**관리자 페이지**      |
|----------------|-----------------|------------------|---------------------|--------------------|-------------------------|
|`회원가입`        |`구매`            |`파일,게시글,`<br>`상품태그`<br>`업로드`|`긍, 부정여부 판단`|`라이브 스트리밍`|`회원, 상품관리`|
|`로그인`          |`판매`            |`팔로우, 팔로잉,`<br>` dm, 댓글`  |   `키워드 추출 및`<br>`관련 키워드`<br>`필터링`|`이미지 업로드`|`구매, 판매내역 `<br>`TOP5 구매, 판매제품`  |
|`소셜로그인`       |`체결거래내역`    |`브랜드별 채팅`|`별점`| `채팅, 경매` |  `경매 라이브커머스`<br>`방 개설` |
|`로그인 후 이전 `<br>` 페이지 돌아가기` |`리스트 필터링`<br>`및 검색`|  `실시간 알림` |  `키워드 추출`  |  `채팅 질문여부`<br>`판단`  |        |
|          |                    |           |    다대다채팅   |    `라이브 목록`<br>`낙찰 체결 내역`     |        |

## 주요기능
- 리뷰 - 리뷰 긍,부정 분석
- 브랜드별 다대다 채팅
- 커뮤니티 - (스타일)SNS 팔로우, 팔로잉
- 경매 라이브커머스 - 채팅 질문여부 분석 후 쇼 호스트에게 모아보기<br>
-> 실제 라이브 커머스 채팅 1500를 이용하여 질문여부판단 모델을 학습하고 flask를 활용해 질문판단API 제작

## 화면
| 메인 페이지  |  리셀-상품리스트   | 리셀-상품상세페이지   |  
| :-------------------------------------------: | :------------: | :------------: |
|  <img width="329" src="https://user-images.githubusercontent.com/68410186/224297931-f12a3350-18d6-40ec-bcd1-95c6340e66e4.png"/> |  <img width="329" src="https://user-images.githubusercontent.com/68410186/224298094-2867074b-f3dc-4782-b9f4-3fecb5b327eb.png"/>|  <img width="329" src="https://user-images.githubusercontent.com/68410186/224298257-7db67943-86c4-4dde-9e0d-2db0f6030176.png"/>|  
| 리셀-구매   |  리셀-판매   |    |  
| <img width="329" src="https://user-images.githubusercontent.com/68410186/224298549-b8b9d6f0-dfdc-45a9-b872-e82abfd3aa4a.png"/>   |  <img width="329" src="https://user-images.githubusercontent.com/68410186/224298613-d8ffa706-e33e-40f7-87da-a1ce326cb504.png"/>     ||
| 커뮤니티-스타일등록   |  커뮤니티-스타일목록   |  커뮤니티-스타일 상세페이지  |  
| <img width="329" src="https://user-images.githubusercontent.com/68410186/224299144-3de935f8-13c3-474d-90a0-06d4491f9029.png"/>   | <img width="329" src="https://user-images.githubusercontent.com/68410186/224299454-7d1e0f20-123a-4869-aa10-cd873d346acb.png"/>| <img width="329" src="https://user-images.githubusercontent.com/68410186/224299299-ed05035c-609b-4cb7-b2de-bacd75c8cbf7.png"/>|
| 경매-라이브 커머스 방   |  경매-입찰,낙찰   |  관리자  |  
| <img width="329" src="https://user-images.githubusercontent.com/68410186/224300478-2293c9cb-cbc7-4dd5-9129-a8a1d3a9ddec.png"/>   | <img width="329" src="https://user-images.githubusercontent.com/68410186/224300946-7489212e-99be-48e0-a1ce-6c24bb19635b.png"/>| <img width="329" src="https://user-images.githubusercontent.com/68410186/224301230-7950c387-ba13-4dd1-827a-dc8c47b0589c.png"/>|




### Requirements
For building and running the application you need:
- Spring Tool Suite 3 (version : 3.9.11.RELEASE)
- java 11
- Anaconda 3

## Stack
<div>
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
<img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white"> 
<br>
<br>
<img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> 
<img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white">
<img src="https://img.shields.io/badge/flask-000000?style=for-the-badge&logo=flask&logoColor=white">
<img src="https://img.shields.io/badge/amazonaws-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white"> 
<br>
<br>
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
<img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
<br>
<br>
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
<br>
<br>
<img src="https://img.shields.io/badge/Jira-0052CC?style=for-the-badge&logo=Jira&logoColor=white">

</div>

## Architecture
| 질문 추출 후 모아보기  |  기능   |
| :------------: | :------------: |
|<img width="500" src="https://user-images.githubusercontent.com/68410186/224303702-74db9df2-62aa-4897-b810-1dd1da91d8a3.png"/>| <img width="500" src="https://user-images.githubusercontent.com/68410186/224304295-d4640f46-3252-47ce-b2b2-8c24f13c653e.png"/>|

