![asap](https://github.com/mirikwon427/ASAP/assets/149026894/33ca8b05-6f9a-4c02-b92e-d00848553eb2)

# 📌 ASAP 
> 무명작가들의 작품 홍보 및 수익 파이프라인 확대를 위한 경매 및 상품 판매 중개 웹사이트

## 📌 웹사이트 개발 의도
> 손쉽게 예술 작품을 감상하고,작품을 소장하기 위해 경매에 참여가능합니다. "예술품"과 "경매"라는 주제를 친근하게 접근하는 사이트를 만들고 싶었습니다. 더불어 인지도가 낮은 작가는 자신의 작품을 무료로 홍보할 수 있으며, 각 카테고리 별 1등 투표 작품은 경매에 출품되어 수익을 창출할 수 있습니다. 작품을 낙찰받지 못한 사용자를 위해 경매 작품을 기반으로 한 다양한 파생상품도 구매할 수 있습니다. 예술의 아름다움을 가깝게 느끼고 작가에게도 수익이 분배됩니다.

## 📆 개발 기간
- 2023.08.28 ~ 2023. 09. 30
- 1주차 : 주제 선정, ERD 모델링, 기초데이터 수집 및 DB 삽입
- 2, 3주차 : 프론트엔드 및 백엔드 개발
- 4주차 : 디버깅
- 5주차 : 포트폴리오 제작

## 💻 개발 환경
- **version** : Java8
- **IDE** : STS3
- **Framework** : Spring MVC
- **Database** : Oracle DB(11xe)
- **ORM** : Mybatis

## 💁 웹 프로세스 소개
- 일반 회원 : 사이트의 기본적인 기능 사용 가능
- 작가 : 작가 신청 후 관리자의 승인, 작품 업로드 가능
- 관리자 : 전반적인 사이트 관리

## 📖 주요 기능
- 회원가입, 로그인/로그아웃
- 투표 : 진행중인 투표 목록, 투표 결과 목록, 투표 작품 신청(작가)
- 경매 : 진행중인 경매, 경매 결과 목록
- 이벤트 경매 목록
- 상품 쇼핑 : 장바구니, 상세정보, 상품리뷰, 결제
- 포인트 충전
- 문의사항, 공지사항 게시판
- 마이페이지 : 회원정보 수정, 회원탈퇴, 작가 신청, 결제 내역, 투표 내역, 입찰 내역, 문의 내역, 투표 업로드 내역(작가), 경매 결과 내역(작가)

## 📖 주요 기능 (관리자 페이지)
- 회원 : 포인트 지급, 회원정보 수정
- 투표 : 투표자 내역
- 경매 : 경매 입찰/낙찰 내역, 경매 업로드
- 이벤트 경매 : 이벤트 경매 입찰내역, 이벤트 경매 업로드
- 상품 및 결제 관리 : 상품 등록, 수정, 삭제, 결제 내역
- 게시판 : 게시판 글 작성, 수정, 삭제

## 👫팀원 소개
- 윤예서 : 팀장, 경매(입찰 기능), 회원가입, 마이페이지(문의 내역) / 관리자 페이지 - 회원(회원정보 수정, 포인트 지급, 작가 신청 승인), 경매 관리(경매 업로드, 입찰/낙찰 내역)
- 이용효 : 부팀장, 투표(다중투표 기능), 회원정보 수정, 경매(댓글, 환불), 마이페이지(경매 입찰/낙찰 내역) / 관리자페이지 - 이벤트 경매 관리(이벤트 경매 업로드, 입찰/낙찰 내역), 투표 내역관리
- 박수현 : 사이트 HTML/CSS, 회원(로그인, 로그아웃, 회원탈퇴), 상품(리뷰), 마이페이지(결제내역, 주문상세, 리뷰작성) / 관리자페이지 - 문의게시판 관리(답변 대기/완료), 공지게시판 관리(작성, 수정, 삭제)
- 권미리 : 게시판(문의, 공지 게시판 글 작성, 수정, 삭제), 상품(장바구니, 카카오페이API 결제), 마이페이지(투표 내역, 포인트 충전 결제, 포인트 환불, 작가 신청비 결제) / 관리자페이지 - HTML/CSS, 상품(업로드, 수정, 삭제), 결제내역 관리


