# [Board-Project](http://www.surup.me/board/) - web[배포사이트 바로가기]
> 웹 기본 소양이 되는 게시판 프로젝트. By JAVA Spring
<br/>

깃테스트

![게시판 이미지](https://github.com/jeonhyoungmin/board_project/assets/109570394/3795a82d-c1bb-426f-afe6-4fae0864db6d)

## 목차
- [프로젝트 명세서](#프로젝트-명세서)
  - [프로젝트 개요](#1-개요)
  - [프로젝트 기능](#2-프로젝트-기능)
  - [사용 기술](#3-사용-기술)
    - [백엔드](#3-1-백엔드)
    - [프론트엔드](#3-2-프론트엔드)
  - [화면](#4-화면)

- [구조 및 설계](#구조-및-설계)
  - [클래스 다이어그램](#1-class-diagram)
  - [DB 설계](#2-db-설계)
    - [ERD-Diagram](#2-1-erd-diagram)
    - [설계](#2-2-설계)
  - [API 설계](#3-api-설계)

## 프로젝트 명세서
### 1. 개요
- 프로젝트 명: Board
- 개발 인원: 1명
- 개발 기간: 2023.05.02 - 2023.06.01 (30일)
- 개발 언어: JAVA 11

### 2. 프로젝트 기능
- **사용자 -** 회원가입 및 로그인, 회원정보 수정, 회원가입시 유효성 검사 및 중복 검사
- **게시판 -** 게시판 CRUD 기능, 조회수, 댓글 및 답글 수, 페이징 및 검색 처리
- **댓글 및 답글 -** 댓글 및 답글(대댓글) CRUD 기능

### 3. 사용 기술
#### 3-1. 백엔드

##### 프레임워크 / 라이브러리
- JAVA 11
- Spring (5.0.7)
- DB
  - MyBatis(3.5.13)
  - MyBatis-Spring(3.0.0)
  - MySQL-Connector/J(8.0.33) (JAVA JDBC)
  - Spring-JDBC(5.0.7 RELEASE)
  - AspectJ-Weaver(Transaction-Manager, 1.9.19)
- JUnit4
    - Spring TestContext Framework(JUnit for Spring, 5.0.7 RELEASE),
- JSON Library
    - Jackson-Databind(2.15.0)

##### DataBase
- MySQL(8.0)
  
##### Server
- Tomcat(9.0.73)

##### Build Tool
- Maven

##### Deployment Environment
- AWS-EC2

##### Configuration Management
- Git(2.37.0)
- Git-Hub

#### 3-2. 프론트엔드
- HTML5/CSS3
- JavaScript

### 4. 화면
<details>
<summary>유저</summary>
  
  </br>
  
  **1. 로그인 화면**
  ![로그인 페이지](https://github.com/jeonhyoungmin/board_project/assets/109570394/59cb875b-b5f6-413a-9f86-6687965f4759)
  
  **2. 회원가입 화면**
  ![회원가입1](https://github.com/jeonhyoungmin/board_project/assets/109570394/c95f7d30-8f5e-4964-9ddc-cef58c1671e3)
  ![회원가입2](https://github.com/jeonhyoungmin/board_project/assets/109570394/d3f622aa-eda5-4487-bb8f-9f279cb1e9ea)
  
  **3. 회원 정보 및 비밀번호 수정 화면**
  ![마이페이지](https://github.com/jeonhyoungmin/board_project/assets/109570394/e4334a56-e313-4b05-8c2b-fabd1ea419de)

</details>

<details>
<summary>게시판</summary>
  
  </br>
  
  **1. 게시판 메인 화면**
  ![게시판 메인](https://github.com/jeonhyoungmin/board_project/assets/109570394/5e6cc226-1651-4812-baf0-d8b04366144d)

  **2. 새 게시글 작성 화면**
  ![새 글 작성](https://github.com/jeonhyoungmin/board_project/assets/109570394/dea1b655-507d-40b5-9d9c-0827eef647fc)

  **3. 게시글 수정 및 삭제 화면**
  ![게시글 수정 및 삭제 화면](https://github.com/jeonhyoungmin/board_project/assets/109570394/8f2ed17b-ac03-48cf-893a-3e099c77358b)

</details>

<details>
<summary>댓글 및 답글</summary>
  
  </br>
  
  **1. 댓글 및 답글 화면**
  ![댓글 및 답글](https://github.com/jeonhyoungmin/board_project/assets/109570394/16668ed1-c59e-47b2-b623-9b4d4742657c)

  **2. 댓글 및 답글 작성 화면**
  ![새 댓글 작성](https://github.com/jeonhyoungmin/board_project/assets/109570394/49619880-92d6-479a-82e3-a21f18ba9f1e)

  **3. 댓글 및 답글 수정 및 삭제 화면**
  ![댓글 수정 및 삭제](https://github.com/jeonhyoungmin/board_project/assets/109570394/d9a3df4c-b187-4bf7-aa0c-4887e3ff0a1d)

</details>

## 구조 및 설계
### 1. Class Diagram
  ![class diagram](https://github.com/jeonhyoungmin/board_project/assets/109570394/b9997f9a-bb99-44fd-8378-ba10e536b17c)
  
</br>
  
### 2. DB 설계
#### 2-1. ERD-Diagram
![board_project_EER_설계_1](https://github.com/jeonhyoungmin/board_project/assets/109570394/cd5befd1-e6d8-4dd0-a936-752765fb584f)

</br>

#### 2-2. 설계
![DB_user_info](https://github.com/jeonhyoungmin/board_project/assets/109570394/1000b799-831a-452b-84df-13c339e45901)

![DB_board](https://github.com/jeonhyoungmin/board_project/assets/109570394/834e0889-bd33-4bed-baa1-2d53ca17169f)

![DB_comment](https://github.com/jeonhyoungmin/board_project/assets/109570394/1586835f-0d6f-4251-b35b-fc6d1ad1edfa)

</br>

### 3. API 설계
![API 회원 관련](https://github.com/jeonhyoungmin/board_project/assets/109570394/f8f36b15-b94b-4758-9f22-b9f83617bc0c)

![API 회원 정보 관련](https://github.com/jeonhyoungmin/board_project/assets/109570394/c1e680d8-fb77-4e0c-817b-1bc366ebf44c)

![API 게시판 관련](https://github.com/jeonhyoungmin/board_project/assets/109570394/81da13c7-069c-4580-8db8-f531126b72f5)

![API 댓글 관련](https://github.com/jeonhyoungmin/board_project/assets/109570394/c942a4c8-3278-456e-84e6-35391864d29e)
