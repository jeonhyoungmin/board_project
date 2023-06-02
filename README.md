# [Board-Project](http://3.36.100.52:8080/board/)
> 웹 기본 소양이 되는 게시판 프로젝트. By JAVA Spring
<br/>

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
- 
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
- Html/Css
- JavaScript
- JSP

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
  ![댓글 및 답글](https://github.com/jeonhyoungmin/board_project/assets/109570394/52bc7160-0747-4cd4-93a8-ae98e1225b29)
  
  **2. 댓글 및 답글 작성 화면**
  ![새 댓글 작성](https://github.com/jeonhyoungmin/board_project/assets/109570394/49619880-92d6-479a-82e3-a21f18ba9f1e)

  **3. 댓글 및 답글 수정 및 삭제 화면**
  ![댓글 수정 및 삭제](https://github.com/jeonhyoungmin/board_project/assets/109570394/d9a3df4c-b187-4bf7-aa0c-4887e3ff0a1d)

</details>

## 구조 및 설계
### 1. Class Diagram
### 2. DB 설계
### 3. API 설계

![class diagram](https://github.com/jeonhyoungmin/board_project/assets/109570394/b9997f9a-bb99-44fd-8378-ba10e536b17c)

https://www.notion.so/ff542a7a00934075b12979d6000b9ccc
