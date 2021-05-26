select * from tab;
drop table member purge;
drop sequence member_num_seq;
select * from member;

CREATE TABLE member (
	num NUMBER(38) unique NOT NULL, /* 회원번호 */
	id VARCHAR2(40) NOT NULL, /* 아이디 */
	pwd VARCHAR2(50) NOT NULL, /* 패스워드 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	email VARCHAR2(50) NOT NULL, /* 이메일 */
	domain VARCHAR2(60) NOT NULL, /* 도메인 */
	phone1 VARCHAR2(20) NOT NULL, /* 핸드폰1 */
	phone2 VARCHAR2(20) NOT NULL, /* 핸드폰2 */
	phone3 VARCHAR2(20) NOT NULL, /* 핸드폰3 */
	zipcode VARCHAR2(30) NOT NULL, /* 우편번호 */
	address VARCHAR2(100) NOT NULL, /* 주소 */
	sex VARCHAR2(30) NOT NULL, /* 성별 */
	visit VARCHAR2(100) NOT NULL, /* 코스방문 */
	icon VARCHAR2(100), /* 아이콘 */
	state NUMBER(10), /* 가입상태 */
	delcont VARCHAR2(500), /* 탈퇴사유 */
	deldate DATE, /* 탈퇴날짜 */
	regdate DATE /* 가입날짜 */
);

/***** join_member 테이블의 join_code 시퀀스 생성 *****/
create sequence member_num_seq 
increment by 1 start with 1 nocache;



insert into member (num , id, pwd, name, email,
					domain, phone1, phone2, phone3, zipcode, 
					address, sex, visit, icon, state, 
					regdate)
			values (member_num_seq.nextval, 'sd1', '111111', '김하성', 'sd07', 
					'naver.com', '010', '1234', '1234', '13421',
					'서울 중구 동호로 222', '남', '1', 'a.jpg', '1',
					sysdate
					);

select * from member;