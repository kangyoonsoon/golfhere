/* 이용후기게시판 */
CREATE TABLE board (
	board_num NUMBER(38) NOT NULL, /* 게시판번호 */
	board_title VARCHAR2(100) NOT NULL, /* 제목 */
	board_content VARCHAR2(2000) NOT NULL, /* 내용 */
	board_readcount NUMBER(38), /* 조회수 */
	board_ref NUMBER(38), /* 원문번호 */
	board_lev NUMBER(38), /* 답글깊이 */
	board_seq NUMBER(38), /* 답글순서 */
	board_date DATE, /* 날짜 */
	board_evaluation NUMBER(38), /* 만족도 */
	board_coursename VARCHAR2(50), /* 게시판골프장이름 */
	board_picture VARCHAR2(100), /* 골프장사진 */
	board_del number(1), /* 삭제여부 */
	num NUMBER, /* 회원번호 */
	course_num NUMBER /* 코스번호 */
);

--alter table board add board_state number(3) NOT NULL;
--alter table board modify (board_state default 1);

/***** board 테이블의 board_num 시퀀스 생성 *****/
create sequence board_num_seq 
increment by 1 start with 1 nocache;
ALTER TABLE board
	ADD
		CONSTRAINT BOARD_PK
		PRIMARY KEY (
			board_num
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
		FOREIGN KEY (
			num
		)
		REFERENCES member (
			num
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_course_TO_board
		FOREIGN KEY (
			course_num
		)
		REFERENCES course (
			course_num
		);

insert into board (board_num, board_title, board_content, board_readcount, board_ref,  
					board_lev, board_seq, board_date, board_evaluation, board_coursename,
					board_picture, board_del, num, course_num)
			values (board_num_seq.nextval, '제목1', '내용1', 1, board_num_seq.nextval, 
					0, 0, sysdate, 75, '유저입력골프장',
					'aaa.png', 0, 1, 1);




select * from tab;
select * from seq;
select * from board;
--drop sequence myboard_seq;
drop table board;
drop sequence board_num_seq;

