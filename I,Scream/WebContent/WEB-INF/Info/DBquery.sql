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

---------------------------------3차 db 구조변경작업---------------------------------------------
--board 테이블에 컬럼을 추가해야하는데 db에 내용이 있으면 컬럼추가가 안됨, 그래서 테이블에 있는 내용삭제
delete from board 
alter table board drop column worktime
alter table board drop column writer

alter table BOARD add STARTWORKTIME date not null; 
alter table BOARD add ENDWORKTIME date not null; 
alter table BOARD add Writer varchar2(100) not null;
alter table BOARD add constraint board_fk foreign key(Writer) references MEMBER(ID) on delete cascade

alter table member rename column avgstars to star
alter table member modify star varchar2(100)
//star값 보기 


drop table review
-- review 테이블 생성
CREATE TABLE Review(
   BBS_NO VARCHAR2(100),
   constraint review_no_fk foreign key(bbs_no) references board(bbs_no) on delete cascade,
   stars NUMBER default 0,
   isReview varchar2(20) default 'NO',
   reviewContext CLOB default 'NULL',
   POSTEDDATE date,
   giveReviewer varchar2(100) default 'NULL', 
   constraint giveReviewer_fk foreign key(giveReviewer) references MEMBER(ID) on delete cascade,
   getReviewer varchar2(100) default 'NULL', 
   constraint getReviewer_fk foreign key(getReviewer) references MEMBER(ID) on delete cascade,
   constraint pk_review primary key(BBS_NO,giveReviewer,getReviewer)
  )

drop table apply
-- Apply 테이블 생성
CREATE TABLE Apply(
	BBS_NO VARCHAR2(100),
	constraint apply_bbs_no_fk foreign key(bbs_no) references board(bbs_no) on delete cascade,
	id VARCHAR2(100),
	constraint apply_id_fk foreign key(id) references member(id) on delete cascade,
	constraint pk_apply primary key(BBS_NO,id),
	HiredResult varchar2(50) default 'NO'
)

--profile 업로드를 위한 member테이블 컬럼 수정
alter table member add profile_path varchar2(4000) default 'NULL'


----------------------- DB test는 아래에서
select (TO_CHAR(endworktime, 'YYYYMMDD')) - (to_char(sysdate,'yyyymmdd')) from board where bbs_no='20'
update apply set hiredResult = CASE when id='test2' then 'YES' ELSE 'Fail' end where bbs_no='18'

update apply set hiredResult='YES','NO') where bbs_no='18'
select a.*,b.title from apply a, board b where b.bbs_no=a.bbs_no 
INSERT INTO MEMBER VALUES('b','1','수원','양성식','010',to_date('18-05-1992','dd-mm-yyyy'),'남자',sysdate,0,'null');
INSERT INTO review VALUES('19','4','YES','dfd','YES',sysdate,'a','b');
INSERT INTO review VALUES('18','4','YES','dfd','YES',sysdate,'a','b');
update member set avgstars=5 where id='b'
insert into apply values('18','waooljagy','NO')
INSERT INTO MEMBER(profile_path) values('g') where id='b'
select title,context,hits,to_char(posteddate,'yyyy-mm-dd hh24:mm'),category,to_char(startWorkTime,'yyyy-mm-dd'),to_char(endWorkTime,'yyyy-mm-dd'),writer from board where BBS_NO='18'
select * from member
select b.bbs_no,b.title,b.context,b.hits,b.POSTEDDATE,b.category,
b.WORKTIME-SYSDATE as workTime,
b.writer from board b, (select * from apply where id='a' and hiredResult='NO') a where b.writer=a.id;
select m.id,m.name,m.avgstars,b.title
from member m, apply a, (select * from board where bbs_no='15') b
where m.id=a.id and a.bbs_no='15'
select m.id,m.name,m.avgstars from member m, apply a where m.id=a.id and a.bbs_no='19'

insert into member values('test2', '1234', '서울', '홍길동','01012345678', sysdate, 'male', sysdate,0)
select * from member
select * from review
INSERT INTO MEMBER VALUES('a','1','수원','양성식','010',to_date('18-05-1992','dd-mm-yyyy'),null,sysdate,0);


insert into board values(board_seq.NEXTVAL, '제목1', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' )
select TITLE, Writer, to_char(POSTEDDATE,'yyyy.mm.dd'), HITS from  board 

select 

select row_number() over(order by no desc)

select count(*) from board
select b.bbs_no,b.title,b.context,b.hits,b.POSTEDDATE,b.category, b.endWORKTIME-SYSDATE,b.writer from board b, (select * from apply where id='test2' and hiredResult='NO') a where b.bbs_no=a.bbs_no
select b.bbs_no,b.title,b.context,b.hits,b..POSTEDDATE,b.category, b.endWORKTIME-SYSDATE,b.writer from board b, (select * from apply where id=? and hiredResult='NO') a where b.bbs_no=a.bbs_no
insert into board values(board_seq.NEXTVAL, '제목2', '내용1', 0, SYSDATE, '카테고리', '10시', 'test' )

select b.* , M.id from board b, member m where b.writer = m.id

select * from board

select m.id,m.name,m.avgstars from member m, apply a where a.bbs_no='19'


update BOARD set HITS=HITS+1 where BBS_NO='24'
select * from apply
select b.context,b.hits,b.posteddate,m.id
from board b,member m
where b.Writer=m.id 
order by b.bbs_no asc;