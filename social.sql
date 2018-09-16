create table meeting( 
	meetingname varchar2(50) primary key
	,purpose varchar2(200)
	,info varchar2(1000)
	,dday TIMESTAMP not null 
	,peoplenum number default 2 not null 
	,status number default 0 
	,addr varchar2(1000) not null
	,creator varchar2(20)  not null
	,enddate TIMESTAMP not null 
	,constraint meeting_fk foreign key(creator) references userlist(user_id)
);

create table userlist(
	 user_id varchar2(20) primary key
	,user_name varchar2(30) not null
	,addr1 varchar2(50) not null
	,addr2 varchar2(80) not null
	,interest varchar2(100)
	,user_pwd varchar2(20) not null
	,introduce varchar2(1000)
	,meetingname varchar2(50) /*?궡媛? 媛쒖꽕?븳諛? */
	);	
alter table userlist add constraint fk_userlist foreign key(meetingname) references meeting(meetingname);

create table chatroom(
	roomnum varchar2(20) primary key
	,roomname varchar2(50) 
	,location_lat varchar2(50) not null /*?쐞?룄 */
	,location_lng varchar2(80) not null	/*寃쎈룄 */
	,regidate date default sysdate /*?깮?꽦?씪*/ 	
	,constraint fk_chatroom foreign key(roomname) references meeting(meetingname)
);

create table participate(
	user_id varchar2(20)
	,meetingname varchar2(50) 
	,joindate date default sysdate
	,participatenum varchar2(30) primary key
	,constraint particp_fk foreign key(user_id) references userlist(user_id)
	,constraint particp_fk2 foreign key(meetingname) references meeting(meetingname)
); 

create sequence participate_seq; 
create sequence chatroomnum_seq;
/**insert 문 **/
Insert into USERLIST (USER_ID,USER_NAME,ADDR1,ADDR2,INTEREST,USER_PWD,INTRODUCE,MEETINGNAME) values ('test','김수현','서울시 강남구','개포동 주공아파트','SocialDining::','1111','안녕하세요 ',null);
Insert into USERLIST (USER_ID,USER_NAME,ADDR1,ADDR2,INTEREST,USER_PWD,INTRODUCE,MEETINGNAME) values ('aaaa','1111','서울시 강남구','삼성동 빌라','busking::SocialDining::','1111','자유시간이드아아아~~','시청모임쓰');
Insert into USERLIST (USER_ID,USER_NAME,ADDR1,ADDR2,INTEREST,USER_PWD,INTRODUCE,MEETINGNAME) values ('test2','1111','서울시 강남구','대치동 은마아파트','sports::','1111','안녕하세요','스벅커피모임');
Insert into USERLIST (USER_ID,USER_NAME,ADDR1,ADDR2,INTEREST,USER_PWD,INTRODUCE,MEETINGNAME) values ('idid','김말자','서울시 강남구','도곡아파트 1동 101호 ','busking::SocialDining::','0000','안녕하세요 저는 김말자라고 합니다.좋은 모임 많이 참여하고 싶습니다. ffff',null);
commit;
Insert into MEETING (MEETINGNAME,PURPOSE,INFO,DDAY,PEOPLENUM,STATUS,ADDR,CREATOR,ENDDATE) values ('가는세월~','스포츠 모임','ㅁㄴㅇㅇㅇㄴㄹ',to_timestamp('18/08/23 02:01:00.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'서울특별시 중구 세종대로22길 16서울 중구 태평로1가 29-1,ㅇㄴㄷㅎㄴㅇㅎ','test',to_timestamp('18/08/11 02:02:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MEETING (MEETINGNAME,PURPOSE,INFO,DDAY,PEOPLENUM,STATUS,ADDR,CREATOR,ENDDATE) values ('스벅커피모임','스포츠 모임','ㅇㅇㅇㅇㅇ',to_timestamp('18/08/11 02:56:00.000000000','RR/MM/DD HH24:MI:SSXFF'),5,0,'서울 강남구 역삼동 675-3,호텔스','test2',to_timestamp('18/08/09 20:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MEETING (MEETINGNAME,PURPOSE,INFO,DDAY,PEOPLENUM,STATUS,ADDR,CREATOR,ENDDATE) values ('시청모임쓰','시청구경','시청역사를 구경하고 싶습니다....',to_timestamp('18/08/17 01:02:00.000000000','RR/MM/DD HH24:MI:SSXFF'),5,0,'서울특별시 중구 세종대로 110서울 중구 태평로1가 31,시청','aaaa',to_timestamp('18/08/16 01:04:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
commit;
Insert into CHATROOM (ROOMNUM,ROOMNAME,LOCATION_LAT,LOCATION_LNG,REGIDATE) values ('3','스벅커피모임','37.50510036514625','127.04131444803086',to_date('18/08/04','RR/MM/DD'));
Insert into CHATROOM (ROOMNUM,ROOMNAME,LOCATION_LAT,LOCATION_LNG,REGIDATE) values ('21','시청모임쓰','37.566828699459066','126.97860698131022',to_date('18/08/06','RR/MM/DD'));
commit;



