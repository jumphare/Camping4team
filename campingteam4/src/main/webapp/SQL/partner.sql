select * from tab;
select * from partner;
select * from seq;

select partner_seq from dual;
delete from partner;

drop sequence partner_seq;

create sequence partner_seq
	increment by 1
	start with 1
	maxvalue 9999
	minvalue 1;


alter sequence partner_seq increament by -1; 
alter table partner modify camp_area varchar(30);
insert into partner values(partner_seq.nextval,'오토캠핑','차박가실분',
	0,sysdate,'2022/05/08','2022/05/09','서울','차박',4,1,'pikachu',0);