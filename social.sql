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
	,meetingname varchar2(50) /*?���? 개설?���? */
	);	
alter table userlist add constraint fk_userlist foreign key(meetingname) references meeting(meetingname);

create table chatroom(
	roomnum varchar2(20) primary key
	,roomname varchar2(50) 
	,location_lat varchar2(50) not null /*?��?�� */
	,location_lng varchar2(80) not null	/*경도 */
	,regidate date default sysdate /*?��?��?��*/ 	
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
/**insert �� **/
Insert into USERLIST (USER_ID,USER_NAME,ADDR1,ADDR2,INTEREST,USER_PWD,INTRODUCE,MEETINGNAME) values ('test','�����','����� ������','������ �ְ�����Ʈ','SocialDining::','1111','�ȳ��ϼ��� ',null);
Insert into USERLIST (USER_ID,USER_NAME,ADDR1,ADDR2,INTEREST,USER_PWD,INTRODUCE,MEETINGNAME) values ('aaaa','1111','����� ������','�Ｚ�� ����','busking::SocialDining::','1111','�����ð��̵�ƾƾ�~~','��û���Ӿ�');
Insert into USERLIST (USER_ID,USER_NAME,ADDR1,ADDR2,INTEREST,USER_PWD,INTRODUCE,MEETINGNAME) values ('test2','1111','����� ������','��ġ�� ��������Ʈ','sports::','1111','�ȳ��ϼ���','����Ŀ�Ǹ���');
Insert into USERLIST (USER_ID,USER_NAME,ADDR1,ADDR2,INTEREST,USER_PWD,INTRODUCE,MEETINGNAME) values ('idid','�踻��','����� ������','�������Ʈ 1�� 101ȣ ','busking::SocialDining::','0000','�ȳ��ϼ��� ���� �踻�ڶ�� �մϴ�.���� ���� ���� �����ϰ� �ͽ��ϴ�. ffff',null);
commit;
Insert into MEETING (MEETINGNAME,PURPOSE,INFO,DDAY,PEOPLENUM,STATUS,ADDR,CREATOR,ENDDATE) values ('���¼���~','������ ����','��������������',to_timestamp('18/08/23 02:01:00.000000000','RR/MM/DD HH24:MI:SSXFF'),4,1,'����Ư���� �߱� �������22�� 16���� �߱� �����1�� 29-1,��������������','test',to_timestamp('18/08/11 02:02:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MEETING (MEETINGNAME,PURPOSE,INFO,DDAY,PEOPLENUM,STATUS,ADDR,CREATOR,ENDDATE) values ('����Ŀ�Ǹ���','������ ����','����������',to_timestamp('18/08/11 02:56:00.000000000','RR/MM/DD HH24:MI:SSXFF'),5,0,'���� ������ ���ﵿ 675-3,ȣ�ڽ�','test2',to_timestamp('18/08/09 20:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into MEETING (MEETINGNAME,PURPOSE,INFO,DDAY,PEOPLENUM,STATUS,ADDR,CREATOR,ENDDATE) values ('��û���Ӿ�','��û����','��û���縦 �����ϰ� �ͽ��ϴ�....',to_timestamp('18/08/17 01:02:00.000000000','RR/MM/DD HH24:MI:SSXFF'),5,0,'����Ư���� �߱� ������� 110���� �߱� �����1�� 31,��û','aaaa',to_timestamp('18/08/16 01:04:00.000000000','RR/MM/DD HH24:MI:SSXFF'));
commit;
Insert into CHATROOM (ROOMNUM,ROOMNAME,LOCATION_LAT,LOCATION_LNG,REGIDATE) values ('3','����Ŀ�Ǹ���','37.50510036514625','127.04131444803086',to_date('18/08/04','RR/MM/DD'));
Insert into CHATROOM (ROOMNUM,ROOMNAME,LOCATION_LAT,LOCATION_LNG,REGIDATE) values ('21','��û���Ӿ�','37.566828699459066','126.97860698131022',to_date('18/08/06','RR/MM/DD'));
commit;



