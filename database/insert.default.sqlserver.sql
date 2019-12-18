/*
 * 사용자 등록(로그인 계정 기본 코드 설정 후 등록)
 */
USE DOTWARE
GO


INSERT USERS (user_name) VALUES (N'시스템'); -- system
INSERT USERS (user_name) VALUES (N'관리자'); -- admin

/*
UPDATE USERS SET user_name = N'시스템' WHERE user_id = 1;
UPDATE USERS SET user_name = N'관리자' WHERE user_id = 2;
*/

SELECT * FROM USERS;

INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order ) 
VALUES (N'코드관리', 1, 1, N'ROOT', 1);

-- 시스템코드
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'시스템코드', 1, 1, N'SYS', 1, 0);
--1

-- 사용자코드
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'사용자코드', 1, 1, N'USR', 2, 0);
--2

SELECT * FROM CODE_GROUPS;

SELECT * FROM CODES;

DECLARE @id INT, @id2 INT;

-- 시스템코드 > 사용여부
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'사용여부', 1, 1, N'usable', 1, 1);
SET @id = @@IDENTITY;
  -- 사용여부 > 사용
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, is_default ) 
  VALUES ( @id, N'예', 1, 1, N'1', 1, 1);
  -- 사용여부 > 삭제
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'아니요', 1, 1, N'0', 2);

-- 시스템코드 > 기본여부
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'기본여부', 1, 1, N'is_default', 2, 1);
SET @id = @@IDENTITY;
  -- 기본여부 > 예
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'예', 1, 1, N'1', 1);
  -- 기본여부 > 아니요
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, is_default ) 
  VALUES ( @id, N'아니요', 1, 1, N'0', 2, 1);


-- 시스템코드 > 활성여부
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'활성여부', 1, 1, N'active', 3, 1);
SET @id = @@IDENTITY;
  -- 활성여부 > 예
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, is_default ) 
  VALUES ( @id, N'예', 1, 1, N'1', 1, 1);
  -- 활성여부 > 아니요
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'아니요', 1, 1, N'0', 2);

-- 시스템코드 > 표시여부
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'표시여부', 1, 1, N'visible', 4, 1);
SET @id = @@IDENTITY;
  -- 표시여부 > 예
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, is_default ) 
  VALUES ( @id, N'예', 1, 1, N'1', 1, 1);
  -- 표시여부 > 아니요
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'아니요', 1, 1, N'0', 2);

-- 시스템코드 > 필수여부
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'필수여부', 1, 1, N'required', 5, 1);
SET @id = @@IDENTITY;
  -- 필수여부 > 예
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'예', 1, 1, N'1', 1);
  -- 필수여부 > 아니요
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, is_default ) 
  VALUES ( @id, N'아니요', 1, 1, N'0', 2, 1);

-- 시스템코드 > 코드종류
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'코드종류', 1, 1, N'code_type', 6, 1);
SET @id = @@IDENTITY;
  -- 코드종류 > 참조형
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, is_default ) 
  VALUES ( @id, N'참조형', 1, 1, N'1', 1, 1);
  -- 코드종류 > 분류형
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'분류형', 1, 1, N'2', 2);

-- 시스템코드 > 표시순서기준
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'표시순서기준', 1, 1, N'order_field', 7, 1);
SET @id = @@IDENTITY;
  -- 표시순서기준 > 등록기준
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, is_default ) 
  VALUES ( @id, N'등록기준', 1, 1, N'id', 1, 1);
  -- 표시순서기준 > 등록일
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'등록일', 1, 1, N'date', 2);
  -- 표시순서기준 > 이름
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'이름', 1, 1, N'name', 3);
  -- 표시순서기준 > 표시순서
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'표시순서', 1, 1, N'display_order', 4);


-- 시스템코드 > 암호화종류
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'암호화종류', 1, 1, N'encryption', 8, 1);
SET @id = @@IDENTITY;
  -- 암호화종류 > SHA256
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'SHA256', 1, 1, N'SHA256', 1);
  -- 암호화종류 > SHA512
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'SHA512', 1, 1, N'SHA512', 2, 0);
  -- 암호화종류 > SEED
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'SEED', 1, 1, N'SEED', 3);
  -- 암호화종류 > SEED256
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'SEED256', 1, 1, N'SEED256', 3, 0);

-- 시스템코드 > 사용자그룹
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'사용자그룹', 1, 1, N'user_group', 9, 1);
SET @id = @@IDENTITY;
  -- 사용자그룹 > 시스템관리자
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'시스템관리자', 1, 1, N'SYSTEM', 1);
  -- 사용자그룹 > 운영자
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'운영자', 1, 1, N'OPERATOR', 2);
  -- 사용자그룹 > 회원
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, is_default ) 
  VALUES ( @id, N'회원', 1, 1, N'MEMBER', 3, 1);

-- 시스템코드 > 로그인방식
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'로그인방식', 1, 1, N'user_group', 10, 1);
SET @id = @@IDENTITY;
  -- 로그인방식 > 사이트로그인
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, is_default ) 
  VALUES ( @id, N'사이트로그인', 1, 1, N'HOME', 1, 1);
  -- 로그인방식 > 페이스북
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'페이스북', 1, 1, N'FACEBOOK', 2, 0);
  -- 로그인방식 > 구글
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'구글', 1, 1, N'GOOGLE', 3, 0);
  -- 로그인방식 > 카카오
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'카카오', 1, 1, N'KAKAO', 4, 0);
  -- 로그인방식 > 네이버
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'네이버', 1, 1, N'NAVER', 5, 0);

-- 시스템코드 > 은행
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id, code_order_field ) 
VALUES (N'은행', 1, 1, N'bank', 11, 1, 'name');
SET @id = @@IDENTITY;
  -- 은행 > 한국은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'한국은행', 1, 1, N'001', 1, 0);
  -- 은행 > 산업은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'산업은행', 1, 1, N'002', 2);
  -- 은행 > 기업은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'기업은행', 1, 1, N'003', 3);
  -- 은행 > 국민은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'국민은행', 1, 1, N'004', 4);
  -- 은행 > 수협은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'수협은행', 1, 1, N'007', 5);
  -- 은행 > 수출입은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'수출입은행', 1, 1, N'008', 6, 0);
  -- 은행 > 농협은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'농협은행', 1, 1, N'011', 7);
  -- 은행 > 단위농협(축협)
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'단위농협(축협)', 1, 1, N'012', 8);
  -- 은행 > 우리은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'우리은행', 1, 1, N'020', 9);
  -- 은행 > SC제일은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'SC제일은행', 1, 1, N'023', 10);
  -- 은행 > 한국씨티은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'한국씨티은행', 1, 1, N'027', 11);
  -- 은행 > 대구은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'대구은행', 1, 1, N'031', 12);
  -- 은행 > 부산은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'부산은행', 1, 1, N'032', 13);
  -- 은행 > 광주은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'광주은행', 1, 1, N'034', 14);
  -- 은행 > 제주은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'제주은행', 1, 1, N'035', 15);
  -- 은행 > 전북은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'전북은행', 1, 1, N'037', 16);
  -- 은행 > 경남은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'경남은행', 1, 1, N'039', 17);
  -- 은행 > 새마을금고
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'새마을금고', 1, 1, N'045', 18);
  -- 은행 > 신협
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'신협', 1, 1, N'048', 19);
  -- 은행 > 저축은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'저축은행', 1, 1, N'050', 20);
  -- 은행 > 모건스탠리은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'모건스탠리은행', 1, 1, N'052', 21, 0);
  -- 은행 > HSBC은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'HSBC은행', 1, 1, N'054', 22, 0);
  -- 은행 > 도이치은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'도이치은행', 1, 1, N'055', 23, 0);
  -- 은행 > 제이피모간체이스은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'제이피모간체이스은행', 1, 1, N'057', 24, 0);
  -- 은행 > 미즈호은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'미즈호은행', 1, 1, N'058', 25, 0);
  -- 은행 > 엠유에프지은행(MFUG)
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'엠유에프지은행', 1, 1, N'059', 26, 0);
  -- 은행 > BOA은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'BOA은행', 1, 1, N'060', 27, 0);
  -- 은행 > 비엔피파리바은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'비엔피파리바은행', 1, 1, N'061', 28, 0);
  -- 은행 > 중국공상은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'중국공상은행', 1, 1, N'062', 29, 0);
  -- 은행 > 중국은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'중국은행', 1, 1, N'063', 30, 0);
  -- 은행 > 산림조합중앙회
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'산림조합중앙회', 1, 1, N'064', 31, 0);
  -- 은행 > 대화은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'대화은행', 1, 1, N'065', 32, 0);
  -- 은행 > 교통은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'교통은행', 1, 1, N'066', 33, 0);
  -- 은행 > 중국건설은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'중국건설은행', 1, 1, N'067', 34, 0);
  -- 은행 > 우체국
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'우체국', 1, 1, N'071', 35);
  -- 은행 > 신용보증기금
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'신용보증기금', 1, 1, N'076', 36);
  -- 은행 > 기술보증기금
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'기술보증기금', 1, 1, N'077', 37);
  -- 은행 > KEB하나은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'KEB하나은행', 1, 1, N'081', 38);
  -- 은행 > 신한은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'신한은행', 1, 1, N'088', 39);
  -- 은행 > 케이뱅크
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'케이뱅크', 1, 1, N'089', 40);
  -- 은행 > 카카오뱅크
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'카카오뱅크', 1, 1, N'090', 41);
  -- 은행 > 대신저축은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'대신저축은행', 1, 1, N'102', 42);
  -- 은행 > 에스비아이저축은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'에스비아이저축은행', 1, 1, N'103', 43);
  -- 은행 > 에이치케이저축은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'에이치케이저축은행', 1, 1, N'104', 44);
  -- 은행 > 웰컴저축은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'웰컴저축은행', 1, 1, N'105', 45);
  -- 은행 > 신한저축은행
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order ) 
  VALUES ( @id, N'신한저축은행', 1, 1, N'106', 46);

-- 시스템코드 > 결제PG
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'결제PG', 1, 1, N'pay_pg', 12, 1);
SET @id = @@IDENTITY;
  -- 결제PG > KCP
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'KCP', 1, 1, N'KCP', 1, 0);
  -- 결제PG > KG이니시스
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'KG이니시스', 1, 1, N'INICIS', 2, 0);
  -- 결제PG > LGU+
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'LGU+', 1, 1, N'LG', 3, 0);
  -- 결제PG > 모빌리언스
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'모빌리언스', 1, 1, N'MOBILIANS', 4, 0);
  -- 결제PG > NICE
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'NICE', 1, 1, N'NICE', 5, 0);
  -- 결제PG > 다날
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'다날', 1, 1, N'DANAL', 6, 0);
  -- 결제PG > 다우페이
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'다우페이', 1, 1, N'DAOU', 7, 0);
  -- 결제PG > KSNET
  INSERT CODES ( group_id, code_name, created_by, modified_by, code_value, display_order, visible ) 
  VALUES ( @id, N'KSNET', 1, 1, N'KSNET', 8, 0);


-- 사용자정의코드 > 공통코드
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'공통코드', 1, 1, N'USR001', 1, 2);
SET @id = @@IDENTITY;
-- 사용자정의코드 > 사용자관리
INSERT CODE_GROUPS ( group_name, created_by, modified_by, group_value, display_order, parent_id ) 
VALUES (N'사용자관리', 1, 1, N'USR002', 2, 2);
SET @id = @@IDENTITY;

