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
		


select * from tab;
select * from seq;
select * from course;

drop table course;
drop sequence course_num_seq;