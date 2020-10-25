---------------------------------DROP table---------------------------------------------
DROP TABLE SCRAP;
DROP TABLE Apply;
DROP TABLE Review;
delete from BOARD;
delete from MEMBER;

---------------------------------MEMBER table---------------------------------------------
CREATE TABLE MEMBER(
	ID VARCHAR2(100) PRIMARY KEY,
	PASSWORD VARCHAR2(100) NOT NULL,
	ADDRESS VARCHAR2(100),
	NAME VARCHAR2(100),
	TEL VARCHAR2(100),
	BIRTH DATE,
	SEX VARCHAR2(50) DEFAULT '남자',
	REGDATE DATE NOT NULL,
	STAR NUMBER DEFAULT 0,
	profile_path varchar2(4000) default 'NULL'
)


---------------------------------BOARD table---------------------------------------------
drop sequence board_seq
create sequence board_seq nocache

CREATE TABLE BOARD(
	BBS_NO VARCHAR2(100) PRIMARY KEY,
	TITLE VARCHAR2(100) NOT NULL,
	CONTEXT CLOB NOT NULL,
	HITS NUMBER DEFAULT 0,
	POSTEDDATE DATE NOT NULL,
	CATEGORY VARCHAR2(100) NOT NULL,
	STARTWORKTIME date not null,
	ENDWORKTIME date not null,
	Writer varchar2(100) not null,
	constraint board_fk foreign key(Writer) references MEMBER(ID) on delete cascade
	)
	
---------------------------------Apply table---------------------------------------------
CREATE TABLE Apply(
	BBS_NO VARCHAR2(100),
	constraint apply_bbs_no_fk foreign key(bbs_no) references board(bbs_no) on delete cascade,
	id VARCHAR2(100),
	constraint apply_id_fk foreign key(id) references member(id) on delete cascade,
	constraint pk_apply primary key(BBS_NO,id),
	HiredResult varchar2(50) default 'NO'
)


---------------------------------Review table---------------------------------------------
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

---------------------------------Scrap table---------------------------------------------
CREATE TABLE Scrap(
	BBS_NO VARCHAR2(100),
	constraint Scrap_bbs_no_fk foreign key(bbs_no) references board(bbs_no) on delete cascade,
	Scraper VARCHAR2(100),
	constraint Scrap_id_fk foreign key(Scraper) references member(id) on delete cascade,
	constraint pk_Scrap primary key(BBS_NO,Scraper)
)


----------------------------test sql---------------------------------
select * from member
insert into member values('a','1','분당','아이유','010','1992-09-03','여성',sysdate,'0','아이유.jpg');
insert into member values('b','1','수서','정준상','010','1955-04-03','남성',sysdate,'0','정준상.jpg');
insert into member values('c','1','수원','양성식','010','1392-05-07','남성',sysdate,'0','양성식.jpg');
insert into member values('d','1','수서','신성호','010','1492-09-05','남성',sysdate,'0','신성호.jpg');
insert into member values('e','1','용인','이수민','010','1932-03-02','남성',sysdate,'0','이수민.jpg');
insert into member values('f','1','분당','강상훈','010','1932-03-02','남성',sysdate,'0','강상훈.jpg');

select * from board
insert into board values(board_seq.nextval,'단기간 아이돌봄 가능자 모집중','단기간 아이돌봄 가능자 모집합니다',0,sysdate,'아이돌봄',sysdate,'2020-10-29','a');
insert into board values(board_seq.nextval,'장기간 노인케어 가능자 모집중','단기간 노인케어 가능자 모집합니다',0,sysdate,'노인케어','2020-10-20','2020-10-22','b');
insert into board values(board_seq.nextval,'누구나 지원 가능, 아이돌봄 가능자 모집중','단기간 아이돌봄 가능자 모집합니다',0,sysdate,'아이돌봄','2020-10-19','2020-10-23','c');
insert into board values(board_seq.nextval,'이번주 노인케어 가능하신분',' 노인케어 가능자 모집합니다',0,sysdate,'노인케어',sysdate,'2020-10-29','d');
insert into board values(board_seq.nextval,'이번주 강아지 산책 시켜주실분','강아지 산책시켜줘',0,sysdate,'반려동물',sysdate,'2020-10-29','e');
insert into board values(board_seq.nextval,'한달동안 감자캐실분 구함','고양이 집사되실분',0,sysdate,'반려동물',sysdate,'2020-11-29','f');
insert into board values(board_seq.nextval,'열정남 구함','열정만 있으면됩니다',0,sysdate,'아이돌봄',sysdate,'2020-10-22','a');
insert into board values(board_seq.nextval,'수퍼맨 구함','단기간 노인케어 가능자 모집합니다',0,sysdate,'노인케어','2020-10-20','2020-10-30','b');
insert into board values(board_seq.nextval,'수퍼걸 구함, 노인케어 가능자 모집중',0,sysdate,'노인케어','2020-10-19','2020-10-29','c');
insert into board values(board_seq.nextval,'이번주 고양이 산책 시켜주실분',' 고양이 산책 가능자 모집합니다',0,sysdate,'반려동물',sysdate,'2020-10-30','d');
insert into board values(board_seq.nextval,'한달동안 돼지 사료 줄사람 구함','돼지고기 좋아하는 사람',0,sysdate,'반려동물',sysdate,'2020-11-29','f');

insert into board values(board_seq.nextval,'급구] 아이돌봄 가능자 모집중','단기간 아이돌봄 가능자 모집합니다',0,sysdate,'아이돌봄',sysdate,'2020-10-23','a');
insert into board values(board_seq.nextval,'급구] 노인케어 가능자 모집중','단기간 노인케어 가능자 모집합니다',0,sysdate,'노인케어','2020-10-20','2020-10-22','b');
insert into board values(board_seq.nextval,'초급구] 누구나 지원 가능, 아이돌봄 가능자 모집중','단기간 아이돌봄 가능자 모집합니다',0,sysdate,'아이돌봄','2020-10-19','2020-10-24','c');
insert into board values(board_seq.nextval,'급구]이번주 노인케어 가능하신분',' 노인케어 가능자 모집합니다',0,sysdate,'노인케어',sysdate,'2020-10-23','d');
insert into board values(board_seq.nextval,'급구]이번주 강아지 산책 시켜주실분','강아지 산책시켜줘',0,sysdate,'반려동물',sysdate,'2020-10-23','e');
insert into board values(board_seq.nextval,'급구]한달동안 감자캐실분 구함','고양이 집사되실분',0,sysdate,'반려동물',sysdate,'2020-11-29','f');
insert into board values(board_seq.nextval,'급구]열정남 구함','열정만 있으면됩니다',0,sysdate,'아이돌봄',sysdate,'2020-10-28','a');
insert into board values(board_seq.nextval,'초급구]수퍼맨 구함','단기간 노인케어 가능자 모집합니다',0,sysdate,'노인케어','2020-10-20','2020-10-21','b');
insert into board values(board_seq.nextval,'초급구]수퍼걸 구함, 노인케어 가능자 모집중',0,sysdate,'노인케어','2020-10-19','2020-10-20','c');
insert into board values(board_seq.nextval,'초급구]이번주 고양이 산책 시켜주실분',' 고양이 산책 가능자 모집합니다',0,sysdate,'반려동물',sysdate,'2020-11-03','d');
insert into board values(board_seq.nextval,'초급구]한달동안 돼지 사료 줄사람 구함','돼지고기 좋아하는 사람',0,sysdate,'반려동물',sysdate,'2020-12-29','f');


insert into board values('20','20번째글','아이돌봄 알바급구',0,sysdate,'아이돌봄',TO_DATE('2011-03-03','YYYY-MM-DD'), TO_DATE('2011-04-13','YYYY-MM-DD'),'a');
insert into board values('21','21번째글','반려동물 알바 급구',0,sysdate,'반려동물',TO_DATE('2012-03-03','YYYY-MM-DD'), TO_DATE('2012-05-13','YYYY-MM-DD'),'b');
insert into board values('22','22번째글','오늘 노인케어 가능하신분?',0,sysdate,'노인케어',TO_DATE('2013-03-03','YYYY-MM-DD'), TO_DATE('2013-06-13','YYYY-MM-DD'),'c');
insert into board values('23','23번째글','아이돌봄@@@ 급구급구',0,sysdate,'아이돌봄',TO_DATE('2014-03-03','YYYY-MM-DD'), TO_DATE('2014-07-13','YYYY-MM-DD'),'d');
insert into board values('24','24번째글','반려동물 알바 급구',0,sysdate,'반려동물',TO_DATE('2015-03-03','YYYY-MM-DD'), TO_DATE('2015-08-13','YYYY-MM-DD'),'e');
insert into board values('25','25번째글','오늘 노인케어 가능하신분?',0,sysdate,'노인케어',TO_DATE('2016-03-03','YYYY-MM-DD'), TO_DATE('2016-09-13','YYYY-MM-DD'),'f');
insert into board values('26','26번째글','아이돌봄 알바급구',0,sysdate,'아이돌봄',TO_DATE('2017-03-03','YYYY-MM-DD'), TO_DATE('2017-10-13','YYYY-MM-DD'),'a');
insert into board values('27','27번째글','반려동물 알바 급구',0,sysdate,'반려동물',TO_DATE('2018-03-03','YYYY-MM-DD'), TO_DATE('2018-11-13','YYYY-MM-DD'),'b');
insert into board values('28','28번째글','노인케어 가능하신분?',0,sysdate,'노인케어',TO_DATE('2019-03-03','YYYY-MM-DD'), TO_DATE('2019-12-13','YYYY-MM-DD'),'c');
insert into board values('29','29번째글','아이돌봄@@@ 급구급구',0,sysdate,'아이돌봄',TO_DATE('2020-03-03','YYYY-MM-DD'), TO_DATE('2020-12-13','YYYY-MM-DD'),'d');


INSERT INTO Scrap values('20', 'b');
INSERT INTO Scrap values('21', 'a');
INSERT INTO Scrap values('21', 'b');
INSERT INTO Scrap values('22', 'b');
INSERT INTO Scrap values('23', 'b');
INSERT INTO Scrap values('24', 'b');
INSERT INTO Scrap values('25', 'b');
INSERT INTO Scrap values('22', 'c');
INSERT INTO Scrap values('23', 'd');
INSERT INTO Scrap values('24', 'e');
INSERT INTO Scrap values('25', 'e');
INSERT INTO Scrap values('26', 'e');
INSERT INTO Scrap values('27', 'e');
INSERT INTO Scrap values('28', 'e');
INSERT INTO Scrap values('29', 'e');


select * from apply
select * from board order by endworktime 
delete from apply


insert into apply values ('20','b','YES');
insert into apply values ('21','c','YES');
insert into apply values ('22','d','YES');
insert into apply values ('23','e','YES');
insert into apply values ('24','f','YES');
insert into apply values ('25','a','YES');
insert into apply values ('26','b','YES');
insert into apply values ('26','c','YES');
insert into apply values ('27','d','YES');
insert into apply values ('27','e','YES');
insert into apply values ('28','f','YES');
insert into apply values ('28','a','YES');
insert into apply values ('29','b','YES');
insert into apply values ('29','c','YES');



insert into apply values ('20','c','NO');
insert into apply values ('20','d','NO');
insert into apply values ('20','e','NO');
insert into apply values ('20','f','NO');



insert into apply values ('21','a','NO');
insert into apply values ('21','d','NO');
insert into apply values ('21','e','NO');
insert into apply values ('21','f','NO');


insert into apply values ('22','a','NO');
insert into apply values ('22','b','NO');
insert into apply values ('22','e','NO');
insert into apply values ('22','f','NO');

 INSERT INTO REVIEW VALUES('20',4,'YES','강상훈아저씨 아재개그 재미없어요 ㅠ',TO_DATE('2018-03-03','YYYY-MM-DD'),'a','b');
 INSERT INTO REVIEW VALUES('20',5,'YES','강상훈아저씨 운동 재미없어요 ㅠ',TO_DATE('2018-03-03','YYYY-MM-DD'),'b','a');
 INSERT INTO REVIEW VALUES('21',4,'YES','정준상아저씨 또 햄버거먹어요',TO_DATE('2019-03-21','YYYY-MM-DD'),'b','c');
 INSERT INTO REVIEW VALUES('21',5,'YES','정준상아저씨 지각 왜해요?',TO_DATE('2019-03-21','YYYY-MM-DD'),'c','b');
 INSERT INTO REVIEW VALUES('22',5,'YES','수민이아저씨 일하다가 빼빼로먹어여',TO_DATE('2017-02-03','YYYY-MM-DD'),'c','d');
 INSERT INTO REVIEW VALUES('22',5,'YES','양성식 또 숨쉰다',TO_DATE('2017-02-03','YYYY-MM-DD'),'d','c');



insert into board values('30','20번째글','아이돌봄 알바급구',0,sysdate,'아이돌봄',TO_DATE('2011-03-03','YYYY-MM-DD'), TO_DATE('2011-04-13','YYYY-MM-DD'),'a');
insert into board values('31','21번째글','반려동물 알바 급구',0,sysdate,'반려동물',TO_DATE('2012-03-03','YYYY-MM-DD'), TO_DATE('2012-05-13','YYYY-MM-DD'),'b');
insert into board values('32','22번째글','오늘 노인케어 가능하신분?',0,sysdate,'노인케어',TO_DATE('2013-03-03','YYYY-MM-DD'), TO_DATE('2013-06-13','YYYY-MM-DD'),'c');
insert into board values('33','23번째글','아이돌봄@@@ 급구급구',0,sysdate,'아이돌봄',TO_DATE('2014-03-03','YYYY-MM-DD'), TO_DATE('2014-07-13','YYYY-MM-DD'),'d');
insert into board values('34','24번째글','반려동물 알바 급구',0,sysdate,'반려동물',TO_DATE('2015-03-03','YYYY-MM-DD'), TO_DATE('2015-08-13','YYYY-MM-DD'),'e');
insert into board values('35','25번째글','오늘 노인케어 가능하신분?',0,sysdate,'노인케어',TO_DATE('2016-03-03','YYYY-MM-DD'), TO_DATE('2016-09-13','YYYY-MM-DD'),'f');
insert into board values('36','26번째글','아이돌봄 알바급구',0,sysdate,'아이돌봄',TO_DATE('2017-03-03','YYYY-MM-DD'), TO_DATE('2017-10-13','YYYY-MM-DD'),'a');
insert into board values('37','27번째글','반려동물 알바 급구',0,sysdate,'반려동물',TO_DATE('2018-03-03','YYYY-MM-DD'), TO_DATE('2018-11-13','YYYY-MM-DD'),'b');
insert into board values('38','28번째글','노인케어 가능하신분?',0,sysdate,'노인케어',TO_DATE('2019-03-03','YYYY-MM-DD'), TO_DATE('2019-12-13','YYYY-MM-DD'),'c');
insert into board values('39','29번째글','아이돌봄@@@ 급구급구',0,sysdate,'아이돌봄',TO_DATE('2020-03-03','YYYY-MM-DD'), TO_DATE('2020-12-13','YYYY-MM-DD'),'d');

insert into apply values ('30','b','NO');
insert into apply values ('31','c','NO');
insert into apply values ('32','d','NO');
insert into apply values ('33','e','NO');
insert into apply values ('34','f','NO');
insert into apply values ('35','a','NO');
insert into apply values ('36','b','NO');
insert into apply values ('36','c','NO');
insert into apply values ('37','d','NO');
insert into apply values ('38','e','NO');
insert into apply values ('39','f','NO');




insert into apply values ('30','c','NO');
insert into apply values ('30','d','NO');
insert into apply values ('30','e','NO');
insert into apply values ('30','f','NO');



insert into apply values ('31','a','NO');
insert into apply values ('31','d','NO');
insert into apply values ('31','e','NO');
insert into apply values ('31','f','NO');


insert into apply values ('32','a','NO');
insert into apply values ('32','b','NO');
insert into apply values ('32','e','NO');
insert into apply values ('32','f','NO');
update review set stars=3 where bbs_no='30' and getreviewer='a'
select * from review
insert into apply values ('33','a','NO');
insert into apply values ('33','b','NO');
insert into apply values ('33','c','NO');
insert into apply values ('33','f','NO');

insert into apply values ('34','a','NO');
insert into apply values ('34','b','NO');
insert into apply values ('34','c','NO');
insert into apply values ('34','d','NO');

insert into apply values ('35','b','NO');
insert into apply values ('35','c','NO');
insert into apply values ('35','d','NO');
insert into apply values ('35','e','NO');







SELECT count(*) 
FROM (SELECT bbs_no, hits, to_char(POSTEDDATE,'YYYY.MM.DD') as POSTEDDATE,
writer, category, title, context FROM board WHERE title LIKE '%번%') B, MEMBER M
WHERE B.WRITER = M.ID 




