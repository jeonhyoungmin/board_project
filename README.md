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
</details>

<details>
<summary>게시판</summary>
</details>

<details>
<summary>댓글 및 답글</summary>
</details>

## 구조 및 설계

![class diagram](https://github.com/jeonhyoungmin/board_project/assets/109570394/b9997f9a-bb99-44fd-8378-ba10e536b17c)

https://www.notion.so/ff542a7a00934075b12979d6000b9ccc
