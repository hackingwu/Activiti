-- alter table ACT_ID_MEMBERSHIP
--     drop FOREIGN KEY ACT_FK_MEMB_GROUP;
--
-- alter table ACT_ID_MEMBERSHIP
--     drop FOREIGN KEY ACT_FK_MEMB_USER;
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_id_membership');
drop table if exists ACT_ID_INFO;
drop table if exists ACT_ID_MEMBERSHIP;
drop table if exists ACT_ID_GROUP;
drop table if exists ACT_ID_USER;
