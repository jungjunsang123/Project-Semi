---------------------------------DROP table---------------------------------------------
DROP TABLE SCRAP;
DROP TABLE Apply;
DROP TABLE Review;
DROP TABLE BOARD;
DROP TABLE MEMBER;

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
	alter table BOARD add constraint board_fk foreign key(Writer) references MEMBER(ID) on delete cascade;
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



