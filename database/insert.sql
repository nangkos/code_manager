INSERT USERS (user_name) VALUES ('시스템');  #system

INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by) VALUES ('솔루션 코드', 1, LAST_INSERT_ID(), LAST_INSERT_ID());

SELECT @userid := user_id FROM `USERS` LIMIT 0, 1;
SELECT @groupid := code_group_id FROM  `CODE_GROUPS` LIMIT 0, 1;
SELECT @userid, @groupid;


INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id) 
VALUES ('기본 코드', 1, @userid, @userid, @groupid);
INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id) 
VALUES ('사용자 관련 코드', 2, @userid, @userid, @groupid);


SET @groupid = 2;
INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id)
VALUES ('사용여부', 1, @userid, @userid, @groupid);
INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id)
VALUES ('기본선택여부', 2, @userid, @userid, @groupid);
INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id)
VALUES ('코드유형', 3, @userid, @userid, @groupid);
INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id)
VALUES ('코드값타입', 4, @userid, @userid, @groupid);
INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id)
VALUES ('코드순서기준', 5, @userid, @userid, @groupid);

UPDATE `CODE_GROUPS` SET code_value_type = 2 WHERE code_group_id = 8;

SET @groupid = 3;
INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id)
VALUES ('활동 여부', 1, @userid, @userid, @groupid);
INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id)
VALUES ('계정인증유형', 2, @userid, @userid, @groupid);
INSERT CODE_GROUPS (code_group_name, display_order, created_by, modified_by, parent_id)
VALUES ('사용자그룹', 3, @userid, @userid, @groupid);


SELECT * FROM `CODE_GROUPS`;
/**
 * 코드 값 세팅
**/
SET @groupid = 4;  #사용여부
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '사용', 1, 1, 1, @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '사용안함', 2, 0, 0, @userid, @userid);

SET @groupid = 5;  #기본선택여부
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '예', 1, 0, 1, @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '아니요', 2, 0, 0, @userid, @userid);

SET @groupid = 6;  #코드유형
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '자료형', 1, 1, 1, @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '분류형', 2, 0, 2, @userid, @userid);

SET @groupid = 7;  #코드값타입
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '숫자', 1, 1, 1, @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '문자', 2, 0, 2, @userid, @userid);

SET @groupid = 8;  #코드순서기준
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_string, created_by, modified_by)
VALUES (@groupid, '표시순서', 1, 1, 'display_order', @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_string, created_by, modified_by)
VALUES (@groupid, '이름', 2, 0, 'code_name', @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_string, created_by, modified_by)
VALUES (@groupid, '등록일', 3, 0, 'created_at', @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_string, created_by, modified_by)
VALUES (@groupid, '아이디', 4, 0, 'code_id', @userid, @userid);

SET @groupid = 9;  #활동 여부
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '활동', 1, 1, 1, @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '휴면', 2, 0, 0, @userid, @userid);

SET @groupid = 10;  #계정인증유형
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_string, created_by, modified_by)
VALUES (@groupid, '자체', 1, 1, 'dotware', @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_string, created_by, modified_by)
VALUES (@groupid, '카카오', 2, 0, 'kakao', @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_string, created_by, modified_by)
VALUES (@groupid, '페이스북', 3, 0, 'facebook', @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_string, created_by, modified_by)
VALUES (@groupid, '구글', 4, 0, 'google', @userid, @userid);

SET @groupid = 11;  #사용자그룹
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '일반사용자', 1, 1, 1, @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '관리자', 2, 0, 9, @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '수퍼관리자', 3, 0, 99, @userid, @userid);
INSERT `CODES` (code_group_id, code_name, display_order, is_default, code_value_int, created_by, modified_by)
VALUES (@groupid, '탈퇴자', 4, 0, 0, @userid, @userid);


SELECT * FROM `CODES`;