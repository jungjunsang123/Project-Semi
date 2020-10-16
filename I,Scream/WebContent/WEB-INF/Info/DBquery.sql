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
	
------2차 erd 적용--------------------
alter table [테이블명] add [컬럼명] [타입] [옵션]; 
//회원DB에 평균별점 컬럼 추가
alter table MEMBER add avgstars NUMBER default 0; 
//board 테이블에 컬럼 수정은 데이터 삭제 후에 가능하기에 테이블 전체 삭제 후 재생성
DROP TABLE BOARD 
CREATE TABLE BOARD(
	BBS_NO VARCHAR2(100) PRIMARY KEY,
	TITLE VARCHAR2(100) NOT NULL,
	CONTEXT CLOB NOT NULL,
	HITS NUMBER DEFAULT 0,
	POSTEDDATE DATE NOT NULL,
	CATEGORY VARCHAR2(100) NOT NULL,
	WORKTIME date,
	Writer varchar2(100) not null, 
	constraint board_fk foreign key(Writer) references MEMBER(ID) on delete cascade
	)

// review 테이블 생성
drop table review
CREATE TABLE Review(
   BBS_NO VARCHAR2(100),
   constraint review_no_fk foreign key(bbs_no) references board(bbs_no) on delete cascade,
   stars NUMBER not null,
   isReview varchar2(20) default 'NO',
   reviewContext CLOB not null,
   rightForReview varchar2(50) default 'YES',
   POSTEDDATE date not null,
   giveReviewer varchar2(100) default 'NULL', 
   constraint giveReviewer_fk foreign key(giveReviewer) references MEMBER(ID) on delete cascade,
   getReviewer varchar2(100) default 'NULL', 
   constraint getReviewer_fk foreign key(getReviewer) references MEMBER(ID) on delete cascade,
   constraint pk_review primary key(BBS_NO,giveReviewer,getReviewer)
   )

	
// Apply 테이블 생성
CREATE TABLE Apply(
	BBS_NO VARCHAR2(100),
	constraint apply_bbs_no_fk foreign key(bbs_no) references board(bbs_no) on delete cascade,
	id VARCHAR2(100),
	constraint apply_id_fk foreign key(id) references member(id) on delete cascade,
	constraint pk_apply primary key(BBS_NO,id),
	HiredResult varchar2(50) default 'NO'
)


-- DB test는 아래에서
select * from board
select b.bbs_no,b.title,b.context,b.hits,b.POSTEDDATE,b.category,
b.WORKTIME-SYSDATE as workTime,
b.writer from board b, (select * from apply where id='a' and hiredResult='NO') a where b.writer=a.id;
select m.id,m.name,m.avgstars,b.title
from member m, apply a, (select * from board where bbs_no='15') b
where m.id=a.id and a.bbs_no='15'


insert into member values('test2', '1234', '서울', '홍길동','01012345678', sysdate, 'male', sysdate,0)

INSERT INTO MEMBER VALUES('a','1','수원','양성식','010',to_date('18-05-1992','dd-mm-yyyy'),null,sysdate);



insert into board values(board_seq.NEXTVAL, '제목1', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' )
select TITLE, Writer, to_char(POSTEDDATE,'yyyy.mm.dd'), HITS from  board 

select 

select row_number() over(order by no desc)

select count(*) from board

insert into board values(board_seq.NEXTVAL, '제목2', '내용1', 0, SYSDATE, '카테고리', '10시', 'test' )

select b.* , M.id from board b, member m where b.writer = m.id

select * from board

update BOARD set HITS=HITS+1 where BBS_NO='24'


