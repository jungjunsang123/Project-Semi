SELECT * FROM MEMBER
//기존에 MEMBER 테이블 있으면 삭제하고 새로 생성하기
DROP TABLE MEMBER 

CREATE TABLE MEMBER(
	ID VARCHAR2(100) PRIMARY KEY,
	PASSWORD VARCHAR2(100) NOT NULL,
	ADDRESS VARCHAR2(100),
	NAME VARCHAR2(100),
	TEL VARCHAR2(100),
	BIRTH DATE,
	SEX VARCHAR2(50) DEFAULT 'MALE',
	REGDATE DATE NOT NULL
)



drop sequence board_seq
create sequence board_seq nocache
SELECT*FROM MEMBER;
COMMIT
SELECT * FROM BOARD
DROP TABLE BOARD 
//기존에 BOARD 테이블 있으면 삭제하고 새로 생성하기

CREATE TABLE BOARD(
	BBS_NO VARCHAR2(100) PRIMARY KEY,
	TITLE VARCHAR2(100) NOT NULL,
	CONTEXT CLOB NOT NULL,
	HITS NUMBER DEFAULT 0,
	POSTEDDATE DATE NOT NULL,
	CATEGORY VARCHAR2(100) NOT NULL,
	WORKTIME VARCHAR2(100),
	Writer varchar2(100) not null, 
	constraint board_fk foreign key(Writer) references MEMBER(ID) on delete cascade
	)

-- DB test는 아래에서
insert into member values('java', '1234', '서울', '홍길동','01012345678', sysdate, 'male', sysdate)

INSERT INTO MEMBER VALUES('a','1','수원','양성식','010',to_date('18-05-1992','dd-mm-yyyy'),null,sysdate);

insert into board values(board_seq.NEXTVAL, '제목1', '내용1', 1, SYSDATE, '카테고리', '10시', 'a' )
select TITLE, Writer, to_char(POSTEDDATE,'yyyy.mm.dd'), HITS from  board 

select row_number() over(order by no desc)

select count(*) from board

