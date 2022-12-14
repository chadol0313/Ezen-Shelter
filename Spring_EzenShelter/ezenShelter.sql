

/* Drop Tables */

DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE heart CASCADE CONSTRAINTS;
DROP TABLE help CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE pet CASCADE CONSTRAINTS;
DROP TABLE shelter CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_adopt_ad_num;
DROP SEQUENCE SEQ_board_b_num;
DROP SEQUENCE SEQ_cart_c_num;
DROP SEQUENCE SEQ_heart_num;
DROP SEQUENCE SEQ_help_h_num;
DROP SEQUENCE SEQ_order_detail_od_num;
DROP SEQUENCE SEQ_order_o_num;
DROP SEQUENCE SEQ_pet_p_num;
DROP SEQUENCE SEQ_product_pd_num;
DROP SEQUENCE SEQ_qna_qa_num;
DROP SEQUENCE SEQ_reply_r_num;
DROP SEQUENCE SEQ_shelter_s_num;




/* Create Sequences */

CREATE SEQUENCE SEQ_adopt_ad_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_board_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_cart_c_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_heart_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_help_h_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_order_detail_od_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_order_o_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_pet_p_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_product_pd_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qna_qa_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reply_r_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_shelter_s_num INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE admin
(
	id varchar2(20) NOT NULL,
	pwd varchar2(50) NOT NULL,
	phone varchar2(15) NOT NULL,
	name varchar2(10) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE board
(
	b_num number(5) NOT NULL,
	id varchar2(20) NOT NULL,
	title varchar2(90) NOT NULL,
	b_content varchar2(500) NOT NULL,
	b_indate date DEFAULT sysdate,
	b_image varchar2(50),
	-- ์กฐํ์
	b_count number(4),
	PRIMARY KEY (b_num)
);

ALTER TABLE board MODIFY b_count number(4) DEFAULT 0;

ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	on delete cascade;
;

CREATE TABLE reply
(
	r_num number(5) NOT NULL,
	-- ์์ฑ์ผ
	r_indate date DEFAULT sysdate NOT NULL,
	-- ๋๊ธ ๋ด์ฉ
	r_content varchar2(200) NOT NULL,
	id varchar2(20) NOT NULL,
	b_num number(5) NOT NULL,
	PRIMARY KEY (r_num)
);
ALTER TABLE reply
	ADD FOREIGN KEY (b_num)
	REFERENCES board (b_num)
	on delete cascade;
;
ALTER TABLE reply
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	on delete cascade;
;


CREATE TABLE heart
(
	num number(3) NOT NULL,
	id varchar2(20) NOT NULL,
	p_num number(5) NOT NULL,
	-- ๊ด์ฌ์๋์?์ธ์ง 
	-- y
	-- 
	-- ์์ํ? ์์?์ธ์ง
	-- n
	tmp char(1),
	-- ์์ํ๊ธฐ ์ํด ๋ณดํธ์๋ก ๋ณด๋ด์ง๋ ๋ง
	-- 
	reason varchar2(500),
	-- ์์ ์?์ฒญ์ ์?ํํ ์๋ด ๋?์ง 
	consulting timestamp,
	PRIMARY KEY (num)
);


CREATE TABLE help
(
	h_num number(5) NOT NULL,
	address1 char(1) NOT NULL,
	h_name varchar2(20) NOT NULL,
	h_content varchar2(500) NOT NULL,
	h_phone varchar2(15) NOT NULL,
	writedate timestamp DEFAULT sysdate,
	-- n / y
	-- ์กฐ์น ์? / ์กฐ์น ์๋ฃ
	result char(1) DEFAULT 'n',
	PRIMARY KEY (h_num)
);


CREATE TABLE member
(
	id varchar2(20) NOT NULL,
	pwd varchar2(50) NOT NULL,
	name varchar2(30) NOT NULL,
	phone varchar2(20) NOT NULL,
	email varchar2(30),
	post_code varchar2(15) NOT NULL,
	address1 varchar2(100) NOT NULL,
	address2 varchar2(100),
	address3 varchar2(50),
	PRIMARY KEY (id)
);

insert into member(id,pwd,name,phone,email,post_code,address1,address2,address3)
values('hong','1234','ํ๊ธธ๋','010-0101-0101','hong@naver.com','231','์์ธ์','์?์ด๋ก','์ด์??๋น๋ฉ');
insert into member(id,pwd,name,phone,email,post_code,address1,address2,address3)
values('one','1234','์์ด','010-1111-1111','one@naver.com','111','๊ฒฝ๊ธฐ๋','์ผ์ฐ','์ผ์ฐ๋');
insert into member(id,pwd,name,phone,email,post_code,address1,address2,address3)
values('two','1234','๋์ด','010-2222-2222','two@naver.com','222','์์ธ','์ํ๊ตฌ','์ํ๋น๋ฉ');

delete from board;
insert into board values(seq_board_seq.nextVal, 'one', '๋ฌธ์๋๋?ค์','์ค๋ ์์๋ฐ์๋๋ฐ ์์ด๊ฐ ๋๋ฌด ์พํ?ํ๊ณ? ๊ตณ๊ตณ', sysdate, 'help.png', 0);


select*from member;
select*from board;
select*from reply

insert into reply values(SEQ_reply_r_num.nextVal,sysdate,'๋ฐ๊ฐ์ต๋๋ค ์์ฃผ์ํตํด์','hong',6);
insert into reply values(SEQ_reply_r_num.nextVal,sysdate,'๊ณ?์์ด๊ฐ ๋๋ฌด ์์๋ค์','one',7);


insert into shelter values(111, '0', '์๋๊ถ', '1๋ฒ๋ณดํธ์', '1๋ฒ๋ฒํธ','์ด๋ฏธ์ง');
insert into SHELTER values(SEQ_shelter_s_num.nextVal,0,'์ค๋๊ตฌ ์ฉ๋ง์ฐ๋ก 139','์์ธ ์?๊ธฐ๋๋ฌผ ์์์ผํฐ','02-6958-6224','seoul.jpg');
insert into SHELTER values(SEQ_shelter_s_num.nextVal,1,'์์ฃผ์ ํธ์?๋ฉด ์น?๋ด๋ก','์์ฃผ ์?๊ธฐ๋๋ฌผ ๋ณดํธ๊ด๋ฆฌ์ผํฐ','033-731-1119','wonju.jpg');
insert into SHELTER values(SEQ_shelter_s_num.nextVal, 2, '์ฒญ์๊ตฐ ๊ฐ๋ด๋ฉด ํ์ฑ๋ฆฌ', '์ฒญ์ฃผ ๋ฐ๋?ค๋๋ฌผ ๋ณดํธ์ผํฐ', '043-201-2298', 'chugju.jpg');
insert into SHELTER values(SEQ_shelter_s_num.nextVal, 3, '๋ผ์ฐ์ ๊ณ๋ฐฑ๋ก 665', '๋๋ฌผ๋ณดํธ์ผํฐ ๋ํจ', '041-746-8475', 'nonsan.jpg');
insert into SHELTER values(SEQ_shelter_s_num.nextVal, 4, '๋ฌ์ฑ๊ตฐ ๋ค์ฌ์ ์์ฌ๋ก', '์์ด์กฐ์', '010-3884-8891', 'aijoa.jpg');
insert into shelter values( SEQ_shelter_s_num.nextVal,7 ,'๋ฌด์๊ตฐ ์ผํฅ์ ์๋งค๊ธธ', '๋ชฉํฌ์์?๊ธฐ๋๋ฌผ๋ณดํธ์', '061-659-4429 ','s1.jpg');
insert into shelter values( SEQ_shelter_s_num.nextVal,6 ,'์ต์ฐ์ ํจ์ด์', '๊ฝ๊ฝ์ด๋ค', '063-679-1247 ','s2.jpg');
insert into shelter values( SEQ_shelter_s_num.nextVal, 5,'์ฐฝ์์ ์์ฐฝ๊ตฌ ์ฐฝ์ด๋๋ก ','์ฐฝ์ ์?๊ธฐ๋๋ฌผ ๋ณดํธ์ผํฐ' , '055-225-5701 ','s3.jpg');


insert into pet values(SEQ_pet_p_num.nextVal, 111, '1', '์ฝ๋ฆฌ์์ํค์ด', '์ฝ์', 'F', 1, 'n', '8','n','contents'  );
insert into pet values(SEQ_pet_p_num.nextVal, 111, '1', '๋ฑ๊ฐ', '๋ฑ๋ฑ', 'F', 1, 'f', '20','n','contents'  );
insert into pet values(SEQ_pet_p_num.nextVal, 111, '1', '์ฝ๋ฆฌ์์ํค์ด', '์์ฝ', 'M', 1, 'n', '9','n','contents'  );

update heart set tmp = 'n' where num = 3;
update pet set ntr='n' where ntr='N'

update pet set age = '8๊ฐ์';
update shelter set s_image = 'nonsan.jpg' where s_num=12;
update shelter set s_image = 'aijoa.jpg' where s_num=13;
update shelter set s_image = 's1.jpg' where s_num=14;
update shelter set s_image = 's2.jpg' where s_num=15;
update shelter set s_image = 's3.jpg' where s_num=16;
update shelter set s_image = 'wonju.jpg' where s_num=18;

select* from ADMIN;

insert into admin values('admin','123','์?ํ๋ฒํธ','์ด๋ฆ');
 

update pet set state = 'a' where p_num = 21;

insert into board values( SEQ_board_b_num.nextVal, 'one', '๋ฌธ์๋๋?ค์','์ค๋ ์์๋ฐ์๋๋ฐ ์์ด๊ฐ ๋๋ฌด ์พํ?ํ๊ณ? ๊ตณ๊ตณ', sysdate, 'b1.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', 'ํ๊ธฐ์์ค์ค!','์ค๋ ์ด์น๊ตฌ๊ฐ ์?์ ๊ฐ์กฑ์ด ๋์์ต๋๋ค~!', sysdate, 'bc1.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', 'ํ๊ธฐ์์ค์ค!','์์ผ๋ก ์?๊ฐ ์ฑ์์ง๊ณ? ํค์ธ๊ฒ์~', sysdate, 'b2.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', 'ํ๊ธฐ๋จ๊น๋๋ค์์!','์์ด๊ฐ ์ํ๊ฑฐ๊ฐ์๋ฐ ์ข์๋ณ์ ์ถ์ฒ๋ฐ์์', sysdate, 'bc2.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '๋๋ฌด์ด์๋๋์ด ์๋!','์ํ์ด ์ด๋ง๋ง๋งํด์ฌ  ๊ฐ์ ์ถ์ฒ๋ฐ์์', sysdate, 'b3.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', 'ํ๊ธฐ๋จ๊น๋๋ค์์!','๋ฅ๋ฅใด์์์ใ๋ฅ๋ฅ๋์์์ใ', sysdate, 'bc3.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '๋ฉใ์์์์!','๋ฅ๋ฅใด์์์ใ๋ฅ๋ฅ๋์์์ใ', sysdate, 'b4.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '์ค๋ ๋ถํฐ ๋ด๊ฐ ์ง์ฌ !','๋ฐ๋ค์ด ๋ชจ์ค๊ฒ์์ค์ค', sysdate, 'bc4.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', 'ํ๋ฃจ์ข์ผ ์?๋ง์์ !','์?ํฌ์ง์ด ํธํด์ ์?๋ง์๊ฒ์ฃ???', sysdate, 'b5.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '๋ฅ๋ฅ ์?ค๋ฆฌ ํ๊ธฐ !',' ์?ํฌ์ง ๋์๊ณณ์ ๋ค์ฌ๋ผ๊ฐ๋ค์', sysdate, 'bc5.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '์?ํฌ์ง ๋จน๋ณด์์ !',' ๊ณณ๊ฐ ๋คํธ๋ฆฌ๊ฒ?์ด์', sysdate, 'b6.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '์ธค๋ฐ๋?๋ฅผ ์๊ฐํฉ๋๋ค !',' ์ค๊ณ?์ถ์๋๋ง์ค๊ณ? ๋จผ์?๊ฐ๋ฉด ์์ค๋ค์ ใ?ใ?', sysdate, 'bc6.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '๊ฐ์กฑ๋ค์ด ๋๋ฌด์ข๋ค๊ณ? ํ๋ค์',' ๊ฐ์์ง ์ซ์ดํ๋ ์๋น?๋ ๋น?์ก๋ค์', sysdate, 'b7.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '๋ฅ์๊ตฌ๊ฐ ๋์ใ์ !',' ๊ธฐ์กด์ ์ง๋ด๋ ๋ฅ๋ฅ์ด๋ค๊ณผ ์์ง๋ด์ใ?', sysdate, 'bc7.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '๋๋์ง์?๋์?๋',' ๊ณ?์์ดํ๊ณ?๋ ์์ง๋ด', sysdate, 'b8.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '์ด์๋๋ฅผ ์๊ฐํด์ !',' ์ค๊ณ?๋์ ๋ ํธ์?๋ฆฌํ๋๋ผ ใ์๊ฒ ใฃ๋ด์ ๊ธฐ๋ถ์ข๋ค์', sysdate, 'bc8.jpg', 0);




/* pet ์ถ๊ฐ */
๊ฐ์์ง
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','๋ง๋ผ๋ฎคํธ','๋ง๋ผ','F','2๊ฐ์','Y','5.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','๋งํฐ์ฆ','๋งํฐ','F','3๊ฐ์','Y','6.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','์ง๋','๋ฉ์ด','F','4๊ฐ์','Y','12.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','๋น์','์์','F','5๊ฐ์','Y','13.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','ํฌ๋ฉ๋ผ๋์','ํฌ๋ฉ','F','13๊ฐ์','Y','14.jpg','a','content1.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,15,'2','์๋ฒ?๋ฆฌ์ํ์คํค','๋ฆฌ์','F','12๊ฐ์','Y','15.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,16,'2','ํ?์ดํธ๋ค','ํธํธ','F','12๊ฐ์','Y','16.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,16,'2','๊ณจ๋?๋ฆฌํธ๋ฆฌ๋ฒ','์ธ์?๋ฏธ','F','22๊ฐ์','Y','29.jpg','a','content3.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,14,'2','์ฌ๋ชจ์๋','์ฐ์?','F','22๊ฐ์','Y','30.jpg','a','content5.png');


๊ณ?์์ด
insert into pet values(SEQ_pet_p_num.nextVal,14,'1','์ฝ๋ฆฌ์์ํค์ด','์ผ์์ด','F','12๊ฐ์','Y','8.jpg','a','content7.png');
insert into pet values(SEQ_pet_p_num.nextVal,14,'1','์ฝ๋ฆฌ์์ํค์ด','๊ณ?๋ฑ์ด','F','6๊ฐ์','Y','9.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'1','๋ฏน์ค','๋ค๋ก','F','7๊ฐ์','Y','19.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'1','๋ฌ์์๋ธ๋ฃจ','๋ธ๋ฃจ','F','7๊ฐ์','Y','11.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'1','์๋ฉ๋ฆฌ์นธ์ํค์ด','์๋ฉ','F','9๊ฐ์','Y','10.jpg','a','content6.png');
insert into pet values(SEQ_pet_p_num.nextVal,15,'1','๋ฏน์ค','์น์ฆ','F','10๊ฐ์','Y','17.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,15,'1','๋ฑ๊ฐ','๋ฑ๋ฑ','F','10๊ฐ์','Y','20.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,16,'1','์ด','์ค๋ฏธ','F','20๊ฐ์','Y','28.jpg','a','content3.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,17,'1','๋?๋','๋๋์ด','F','18๊ฐ์','Y','31.jpg','a','content6.png');



๊ทธ์ธ
insert into pet values(SEQ_pet_p_num.nextVal,11,'0','ํ์คํฐ','ํ์ฐ','F','11๊ฐ์','Y','21.jpg','a','content7.png');
insert into pet values(SEQ_pet_p_num.nextVal,11,'0','ํ?๋ผ','ํ?์','F','17๊ฐ์','Y','22.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,12,'0','์ต๋ฌด์','๋ฌด๋ฌด','F','5๊ฐ์','Y','23.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,12,'0','์ด๊ตฌ์๋','์ด๊ตฌ','F','6๊ฐ์','Y','24.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'0','๋ผ์ฟค','์ฟค๋','F','9๊ฐ์','Y','25.jpg','a','content6.png');
insert into pet values(SEQ_pet_p_num.nextVal,13,'0','๊ณ?์ด๋์น','๋์น','F','2๊ฐ์','Y','32.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,13,'0','๋ฏธ์ด์บฃ','๋ฏธ์บฃ','F','9๊ฐ์','Y','26.jpg','a','content8.png');