# ViewPort - 안경 온라인 쇼핑몰

**미니 팀 프로젝트**

## 📌 프로젝트 소개
ViewPort는 3인 팀 사이드 프로젝트로, JSP, JavaScript, 전자정부 프레임워크(E-Government Framework)를 심도 있게 학습하기 위해 진행된 안경 관련 온라인 쇼핑몰입니다.
이 프로젝트는 전자정부 프레임워크의 공공 프로젝트 환경을 모방하여 개발하며 백엔드와 프론트엔드 전반의 구조를 이해하고 실제 기능 구현과 문제 해결 능력을 키우는 데 중점을 두었습니다.

## 주요 기능
- **검색 최적화**: 원하는 제품을 빠르게 찾을 수 있도록 효율적인 필터링과 검색 시스템을 개발했습니다.  
- **안전한 결제 환경**: 보안 강화를 위한 인증 및 결제 시스템을 설계했습니다.  
- **관리자 효율성**: 관리자가 쉽게 상품 및 주문 데이터를 관리할 수 있도록 관리 페이지를 구현했습니다.
- **회원 가입 및 로그인**  
  - Spring Security를 사용하여 사용자 인증 및 인가 로직을 구현했습니다.  
  - JWT 토큰 기반 인증 시스템으로 보안을 강화했습니다.  
- **제품 검색 및 필터링**  
  - MyBatis를 활용한 최적화된 쿼리 설계로 대량의 데이터를 빠르게 검색할 수 있도록 구현했습니다.  
- **장바구니 및 결제**  
  - 비동기 처리와 외부 결제 API 연동으로 사용자 경험을 개선했습니다.  
  - 결제 로직 중복 방지 및 오류 처리 로직을 추가했습니다.  
- **관리자 페이지**  
  - Spring Security의 Role 기반 접근 제어를 적용하여 관리자 전용 기능을 제공했습니다.  
- **마이페이지**  
  - RESTful API 설계로 유저 정보 수정 및 주문 내역 조회 기능을 구현했습니다.
    
## 👨‍💻 기여한 부분
- 전자정부 프레임워크 기반 백엔드 설계
  - Spring Framework와 MyBatis를 활용하여 RESTful API를 설계하고 데이터베이스 연동 로직을 구현했습니다.
- 검색 및 필터링 최적화
  - SQL 실행 계획 분석과 동적 쿼리 설계를 통해 검색 성능을 약 3배 향상했습니다.
- 회원 가입 및 로그인 구현
  - Spring Security 기반 JWT 인증 시스템으로 사용자 인증과 인가를 처리했습니다.
- 장바구니 및 결제 시스템 구축
  - 비동기 처리 및 외부 결제 API 연동으로 결제 로직의 중복을 방지하고, 사용자 경험을 개선했습니다.
- 관리자 페이지 개발
  - 관리자 전용 Role 기반 접근 제어를 설정하고, 상품 및 주문 관리 기능을 구현했습니다.
- 협업 및 문서화
  - Git을 활용한 코드 리뷰 및 협업을 통해 팀 프로젝트를 진행하며, 상세 문서화를 수행했습니다.

## 기술 스택

- Backend:

  - Spring Framework: 모듈화된 설계와 생산성 높은 개발 환경을 제공하며, 전자정부 프레임워크 기반 공공 프로젝트 개발 환경과 유사하여 학습 목적으로 선택했습니다.
  - MyBatis: SQL 작성의 자유도를 높이고, 기존 데이터베이스 설계와 쉽게 통합할 수 있어 효율적인 데이터베이스 연동을 구현했습니다.
- Frontend:

  - JSP (JavaServer Pages): 서버에서 동적으로 콘텐츠를 생성할 수 있는 전통적인 기술로, 전자정부 프레임워크와 자연스럽게 통합되며 학습 목적에 적합했습니다.
  - HTML, CSS, JavaScript: 브라우저에서의 UI 구현 및 사용자 경험 개선을 위해 선택했습니다.
  - JQuery: 간단한 DOM 조작과 AJAX 요청 처리를 위해 사용, JavaScript의 생산성을 높이기 위해 채택했습니다.
- Database:

  - Oracle DB: 기업 환경에서 자주 사용되는 안정적이고 강력한 데이터베이스 솔루션으로, 실무 적응력을 높이기 위해 선택했습니다.
- Build Tool:

  - Maven: 의존성 관리를 자동화하고 프로젝트 구조화를 간편하게 하기 위해 선택했습니다.


## 🚨 트러블슈팅
1. 검색 및 필터링 속도 저하 문제
  - 문제 배경
    - 데이터가 1,000건 이상일 때 검색 및 필터링 속도가 급격히 느려졌습니다.
  - 문제 원인
    - 비효율적인 쿼리 설계로 인해 조건별 검색 시 과도한 데이터 로드 발생.
    - 데이터베이스 테이블에 적절한 인덱스가 설정되지 않음.
  - 해결 방법
    - SQL 실행 계획 분석 후 WHERE 절 최적화 및 인덱스 추가.
    - MyBatis의 동적 쿼리 사용으로 조건별 최적화된 검색 수행.
  - 결과
    - 검색 속도를 약 3배 개선하여 사용자 경험을 향상시켰습니다

 2. 관리자 권한 제어 문제
  - 문제 배경
    - 인증된 사용자라면 관리자 페이지에 접근할 수 있는 보안 취약점이 발견되었습니다.
  - 문제 원인
    - Spring Security 설정에서 Role 기반 권한 제어가 누락된 상태.
  - 해결 방법
    - Spring Security의 Role 기반 필터링을 추가하여 관리자 전용 페이지에 접근 권한을 제한했습니다.

## 🌟 배운 점 및 성장
- 전자정부 프레임워크 활용: 전자정부 프레임워크를 사용하여 공공 프로젝트 개발 환경에 대한 이해를 높였습니다.
- 팀 협업 경험: 3인 팀으로 진행하며 Git을 활용한 협업과 코드 리뷰를 통해 팀워크와 소통 능력을 강화했습니다.
- 문제 해결 역량: 검색 최적화, 보안 설정 등 실무적인 문제를 해결하며 데이터베이스 설계와 백엔드 구조의 중요성을 체감했습니다.
- 전체 개발 프로세스 이해: JSP와 JavaScript를 활용한 UI 구성부터 백엔드 API 설계까지, 전반적인 개발 프로세스를 경험했습니다.

## 디자인
메인페이지
![screencapture-localhost-8080-viewport-mini-web-2024-07-20-23_43_28](https://github.com/user-attachments/assets/50fae759-2420-4530-8325-9284fca0e69a)


상품페이지
![screencapture-localhost-8080-viewport-mini-web-products-productsList-2024-07-20-23_47_40](https://github.com/user-attachments/assets/f0df9732-e915-4b84-92f2-627e32a8b1f0)

브렌치 페이지
![screencapture-localhost-8080-viewport-mini-web-findStores-2024-07-20-23_47_58](https://github.com/user-attachments/assets/eba2c6d4-a501-4fc3-88f8-9159aa064b46)

스타일페이지
![screencapture-localhost-8080-viewport-mini-web-styles-2024-07-20-23_48_15](https://github.com/user-attachments/assets/9f864a00-9484-42e7-8648-c3e53afa02c3)

마이페이지
![screencapture-localhost-8080-viewport-mini-web-mypage-orders-2024-07-20-23_49_46](https://github.com/user-attachments/assets/81bd8674-9aba-48d3-b088-304401341a3b)

장바구니 페이지
![screencapture-localhost-8080-viewport-mini-web-cart-2024-07-20-23_56_34 (1)](https://github.com/user-attachments/assets/77f60433-464a-48c9-943e-b7edbe434df0)

어드민 페이지
![image](https://github.com/user-attachments/assets/72156c49-dacc-4539-aa66-f22fa3a635cf)
