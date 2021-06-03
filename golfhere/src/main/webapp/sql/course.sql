/* 골프장 */
CREATE TABLE course (
	course_num NUMBER NOT NULL, /* 코스번호 */
	course_name VARCHAR2(50) NOT NULL, /* 골프장이름 */
	course_area NUMBER, /* 지역 */
	course_tel1 VARCHAR2(20), /* 전화번호1 */
	course_tel2 VARCHAR2(20), /* 전화번호2 */
	course_tel3 VARCHAR2(20), /* 전화번호3 */
	course_website VARCHAR2(50), /* 홈페이지 */
	course_membership NUMBER, /* 멤버쉽 */
	course_size NUMBER, /* 홀규모 */
	course_week_price NUMBER, /* 주중가격 */
	course_weekend_price NUMBER, /* 주말가격 */
	course_penalty NUMBER, /* 위약금 */
	course_map VARCHAR2(30) /* 지도 */
);

/***** course 테이블의 course_num 시퀀스 생성 *****/
create sequence course_num_seq 
increment by 1 start with 1 nocache;

CREATE UNIQUE INDEX PK_course
	ON course (
		course_num ASC
	);

ALTER TABLE course
	ADD
		CONSTRAINT PK_course
		PRIMARY KEY (
			course_num
		);
		
insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '공주골프장', 1, '010', '1234', 
					'5678', 'www.naver.com', 0, 27, 14, 
					16, 0, 'map');

insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '이글스골프장', 1, '010', '3333', 
					'4532', 'www.daum.com', 0, 27, 14, 
					16, 0, 'map');

insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '강릉골프장', 2, '010', '9685', 
					'9584', 'www.naver.com', 0, 27, 15, 
					17, 0, 'map');
---------------------
		
alter table course modify (course_map varchar2(200));
update course set course_map='37.87364492097698, 127.27358282798686';					
					
-------------------------------------------------------------------------------------------

insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '백제cc', 2, '031', '000', 
					'0000', 'https://www.baekjecc.com/index.asp', 0, 27, 15, 
					18, 0, '36.34865292132381, 126.78913117906708');

insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '양평TPC', 1, '031', '772', 
					'8925', 'http://www.tpcgolf.co.kr/', 0, 27, 18, 
					25, 0, '37.4189032629402, 127.65012532141645');

insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '금강cc', 1, '031', '884', 
					'0707', 'https://www.kccgolf.co.kr/', 1, 27, 18, 
					24, 0, '37.243402675686134, 127.60189692697033');

insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '김포SEASIDE컨트리클럽', 1, '031', '987', 
					'9992', 'http://www.gimpocc.co.kr/', 1, 18, 22, 
					27, 0, '37.706248208445814, 126.53389225581569');

insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '블루원상주골프리조트', 3, '054', '530', 
					'8899', 'https://sj.blueone.com/', 0, 18, 15, 
					20, 0, '36.3340580810608, 127.94586466927991');

insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '오션비치cc', 3, '054', '730', 
					'9000', 'https://www.oceanbeachcc.com/Course/beach.asp', 0, 27, 18, 
					21, 0, '36.3340580810608, 127.94586466927991');

insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '동전주써미트 CC', 3, '063', '430', 
					'5000', 'http://www.summitcc.co.kr/', 0, 27, 15, 
					20, 0, '35.84100840158009, 127.32556698276194');
					
insert into course (course_num, course_name, course_area, course_tel1, course_tel2,  
					course_tel3, course_website, course_membership, course_size, course_week_price, 
					course_weekend_price, course_penalty, course_map)
			values (course_num_seq.nextval, '아덴힐리조트앤골프클럽', 4, '', '1588', 
					'7208', 'http://www.ardenhill.co.kr/', 0, 18, 15, 
					19, 0, '33.34571387148639, 126.364300267896');
					
commit;					
select * from tab;
select * from seq;
select * from course;

delete from course where course_num =37;

drop table course;
drop sequence course_num_seq;