DROP TABLE Apply;
DROP TABLE Review;
DROP TABLE BOARD;
DROP TABLE MEMBER;
DROP SEQUENCE BOARD_SEQ;
DROP SEQUENCE REVIEW_SEQ;

//기존에 MEMBER테이블 있으면 삭제하고 새로 생성하기

--MEMBER SECTION--
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

SELECT * FROM MEMBER
DROP TABLE MEMBER 
COMMIT

//기존에 BOARD 테이블 있으면 삭제하고 새로 생성하기
--BOARD SECTION--

SELECT * FROM BOARD
DROP TABLE BOARD 
create sequence board_seq nocache
drop sequence board_seq
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

--REVIEW SECTION--
CREATE TABLE Review(
   BBS_NO VARCHAR2(100) PRIMARY KEY,
   constraint bbs_no_fk foreign key(bbs_no) references board(bbs_no) on delete cascade,
   stars NUMBER not null,
   isReview varchar2(20) default 'NO',
   reviewContext CLOB not null,
   rightForReview varchar2(50) default 'YES',
   POSTEDDATE date not null,
   Writer varchar2(100) not null, 
   constraint review_board_fk foreign key(Writer) references MEMBER(ID) on delete cascade
   )
   SELECT M.ID, R.REVIEWCONTEXT, R.STARS, R.POSTEDDATE, B.BBS_NO 
   FROM MEMBER M, REVIEW R, BOARD B WHERE R.WRITER = M.ID and R.WRITER = B.WRITER AND M.ID = 'b';
   
   
   
   SELECT*FROM REVIEW
    SELECT * FROM BOARD WHERE WRITER='b';
    SELECT * FROM REVIEW WHERE WRITER='b';
    SELECT * FROM MEMBER WHERE ID='b';
   
    SELECT M.ID, R.REVIEWCONTEXT, R.STARS, R.POSTEDDATE, R.BBS_NO
   	FROM MEMBER M, REVIEW R WHERE R.WRITER = M.ID AND R.BBS_NO = 2 AND M.ID = 'b';
   
   
select * from Review
DROP TABLE Review;
create sequence Review_seq nocache;
drop sequence review_seq;

alter table Review add POSTEDDATE date not null;
alter table Review add POSTEDDATE  Writer varchar2(100) not null, 
   constraint board_fk foreign key(Writer) references MEMBER(ID) on delete cascade

--APPLY SECTION--
// Apply 테이블 생성
CREATE TABLE Apply(
	BBS_NO VARCHAR2(100),
	constraint apply_bbs_no_fk foreign key(bbs_no) references board(bbs_no) on delete cascade,
	id VARCHAR2(100),
	constraint apply_id_fk foreign key(id) references member(id) on delete cascade,
	constraint pk_apply primary key(BBS_NO,id),
	HiredResult varchar2(50) default 'NO'
)
SELECT *FROM APPLY;
DROP TABLE Apply;

-- DB test는 아래에서----------------------------------------------------
-- MEMBER DB added--
INSERT INTO MEMBER VALUES('a','1','수원','양성식','010',to_date('18-05-1992','dd-mm-yyyy'),'남자',sysdate,5);
INSERT INTO MEMBER VALUES('b','1','수서','신성호','010',to_date('15-04-1991','dd-mm-yyyy'),'여자',sysdate,4);
INSERT INTO MEMBER VALUES('c','1','용인','김수민','010',to_date('10-03-1990','dd-mm-yyyy'),'여자',sysdate,3);
INSERT INTO MEMBER VALUES('d','1','야탑','강상훈','010',to_date('09-02-1989','dd-mm-yyyy'),'남자',sysdate,2);
INSERT INTO MEMBER VALUES('e','1','수서','정준상','010',to_date('20-01-1988','dd-mm-yyyy'),'선택하지 않음',sysdate,1);

--BOARD table DB test--
insert into board values(board_seq.NEXTVAL, '제목1', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목2', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목3', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목4', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목5', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목6', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목7', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목8', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목9', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목10', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목11', '내용1', 1, SYSDATE, '카테고리', sysdate, 'a' );
insert into board values(board_seq.NEXTVAL, '제목2', '내용z', 1, SYSDATE, '카테고리', sysdate, 'b' );
insert into board values(board_seq.NEXTVAL, '제목3', '내용x', 1, SYSDATE, '카테고리', sysdate, 'c' );
insert into board values(board_seq.NEXTVAL, '제목4', '내용c', 1, SYSDATE, '카테고리', sysdate, 'd' );
insert into board values(board_seq.NEXTVAL, '제목5', '내용v', 1, SYSDATE, '카테고리', sysdate, 'e' );
insert into board values(board_seq.NEXTVAL, '제목12', '내용z', 1, SYSDATE, '카테고리', sysdate, 'b' );
insert into board values(board_seq.NEXTVAL, '제목13', '내용x', 1, SYSDATE, '카테고리', sysdate, 'c' );
insert into board values(board_seq.NEXTVAL, '제목14', '내용c', 1, SYSDATE, '카테고리', sysdate, 'd' );
insert into board values(board_seq.NEXTVAL, '제목15', '내용v', 1, SYSDATE, '카테고리', sysdate, 'e' );
insert into board values(board_seq.NEXTVAL, '제목16', '내용z', 1, SYSDATE, '카테고리', sysdate, 'b' );
insert into board values(board_seq.NEXTVAL, '제목17', '내용x', 1, SYSDATE, '카테고리', sysdate, 'c' );
insert into board values(board_seq.NEXTVAL, '제목18', '내용c', 1, SYSDATE, '카테고리', sysdate, 'd' );
insert into board values(board_seq.NEXTVAL, '제목19', '내용v', 1, SYSDATE, '카테고리', sysdate, 'e' );
insert into board values(board_seq.NEXTVAL, '제목20', '내용z', 1, SYSDATE, '카테고리', sysdate, 'b' );
insert into board values(board_seq.NEXTVAL, '제목21', '내용x', 1, SYSDATE, '카테고리', sysdate, 'c' );
insert into board values(board_seq.NEXTVAL, '제목22', '내용c', 1, SYSDATE, '카테고리', sysdate, 'd' );
insert into board values(board_seq.NEXTVAL, '제목23', '내용v', 1, SYSDATE, '카테고리', sysdate, 'e' );
insert into board values(board_seq.NEXTVAL, '제목24', '내용z', 1, SYSDATE, '카테고리', sysdate, 'b' );
insert into board values(board_seq.NEXTVAL, '제목25', '내용x', 1, SYSDATE, '카테고리', sysdate, 'c' );
insert into board values(board_seq.NEXTVAL, '제목26', '내용c', 1, SYSDATE, '카테고리', sysdate, 'd' );
insert into board values(board_seq.NEXTVAL, '제목27', '내용v', 1, SYSDATE, '카테고리', sysdate, 'e' );
insert into board values(board_seq.NEXTVAL, '제목28', '내용z', 1, SYSDATE, '카테고리', sysdate, 'b' );
insert into board values(board_seq.NEXTVAL, '제목29', '내용x', 1, SYSDATE, '카테고리', sysdate, 'c' );
insert into board values(board_seq.NEXTVAL, '제목30', '내용c', 1, SYSDATE, '카테고리', sysdate, 'd' );
insert into board values(board_seq.NEXTVAL, '제목31', '내용v', 1, SYSDATE, '카테고리', sysdate, 'e' );
insert into board values(board_seq.NEXTVAL, '제목32', '내용z', 1, SYSDATE, '카테고리', sysdate, 'b' );
insert into board values(board_seq.NEXTVAL, '제목33', '내용x', 1, SYSDATE, '카테고리', sysdate, 'c' );
insert into board values(board_seq.NEXTVAL, '제목34', '내용c', 1, SYSDATE, '카테고리', sysdate, 'd' );
insert into board values(board_seq.NEXTVAL, '제목35', '내용v', 1, SYSDATE, '카테고리', sysdate, 'e' );
--REVIEW TABLE DB TEST--
INSERT INTO Review VALUES(1, 5, 'NO', '우하하하 좋아요','YES', sysdate, 'a');
INSERT INTO Review VALUES(2, 4, 'NO', '우하하하 좋아요','YES', sysdate, 'b');
INSERT INTO Review VALUES(3, 3, 'NO', '우하하하 좋아요','YES', sysdate, 'c');
INSERT INTO Review VALUES(4, 2, 'NO', '우하하하 좋아요','YES', sysdate, 'd');
INSERT INTO Review VALUES(5, 1, 'NO', '우하하하 좋아요','YES', sysdate, 'e'); 
INSERT INTO Review VALUES(6, 5, 'NO', '우하하하 좋아요2','YES', sysdate, 'a');
INSERT INTO Review VALUES(7, 4, 'NO', '우하하하 좋아요2','YES', sysdate, 'b');
INSERT INTO Review VALUES(8, 3, 'NO', '우하하하 좋아요2','YES', sysdate, 'c');
INSERT INTO Review VALUES(9, 2, 'NO', '우하하하 좋아요2','YES', sysdate, 'd');
INSERT INTO Review VALUES(10, 1, 'NO', '우하하하 좋아요2','YES', sysdate, 'e');
INSERT INTO Review VALUES(11, 5, 'NO', '우하하하 좋아요3','YES', sysdate, 'a');
INSERT INTO Review VALUES(12, 4, 'NO', '우하하하 좋아요3','YES', sysdate, 'b');
INSERT INTO Review VALUES(13, 3, 'NO', '우하하하 좋아요3','YES', sysdate, 'c');
INSERT INTO Review VALUES(14, 2, 'NO', '우하하하 좋아요3','YES', sysdate, 'd');
INSERT INTO Review VALUES(15, 1, 'NO', '우하하하 좋아요3','YES', sysdate, 'e');
INSERT INTO Review VALUES(16, 5, 'NO', '우하하하 좋아요4','YES', sysdate, 'a');
INSERT INTO Review VALUES(17, 4, 'NO', '우하하하 좋아요4','YES', sysdate, 'b');
INSERT INTO Review VALUES(18, 3, 'NO', '우하하하 좋아요4','YES', sysdate, 'c');
INSERT INTO Review VALUES(19, 2, 'NO', '우하하하 좋아요4','YES', sysdate, 'd');
INSERT INTO Review VALUES(20, 1, 'NO', '우하하하 좋아요4','YES', sysdate, 'e');
INSERT INTO Review VALUES(21, 5, 'NO', '우하하하 좋아요5','YES', sysdate, 'a');
INSERT INTO Review VALUES(22, 4, 'NO', '우하하하 좋아요5','YES', sysdate, 'b');
INSERT INTO Review VALUES(23, 3, 'NO', '우하하하 좋아요5','YES', sysdate, 'c');
INSERT INTO Review VALUES(24, 2, 'NO', '우하하하 좋아요5','YES', sysdate, 'd');
INSERT INTO Review VALUES(25, 1, 'NO', '우하하하 좋아요5','YES', sysdate, 'e');

SELECT *FROM REVIEW;

select TITLE, Writer, to_char(POSTEDDATE,'yyyy.mm.dd'), HITS from  board 

select row_number() over(order by no desc)

select count(*) from board

insert into board values(board_seq.NEXTVAL, '제목2', '내용1', 0, SYSDATE, '카테고리', '10시', 'test' )

select b.* , M.id from board b, member m where b.writer = m.id

select * from board

update BOARD set HITS=HITS+1 where BBS_NO='24'
/*ReviewDAO_ reviewAdd Query문 Test*/
UPDATE REVIEW SET reviewContext= ? WHERE BBS_NO = ? 
