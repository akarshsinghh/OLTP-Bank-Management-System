-- RUN THIS SCRIPT TO CREATE YOUR USER AND ACCESS OUR PROJECT SCRIPT WITH ALL THE NIMPORTANT PRIVELAGES REQUIRED TO DO SO
-- SCRIPT SHOULD BE RUNNED IN ADMIN



SET SERVEROUTPUT ON;
DECLARE
a number;
e exception;
BEGIN
SELECT count(*) INTO a FROM all_users
WHERE USERNAME = 'PROF_NAVEEN';
if a = 1 then
EXECUTE IMMEDIATE 'DROP USER '||'prof_naveen'||' CASCADE';
else
raise e;
end if;
exception
when e then
dbms_output.put_line('USER DOES NOT EXSIST');
end;
/

--
create user prof_naveen identified by "NAVEEN@BostonCampus2022#";
grant connect,resource to prof_naveen;
alter user prof_naveen default tablespace data ;
alter user prof_naveen quota unlimited on data;
GRANT CREATE ANY VIEW TO prof_naveen;
GRANT CREATE ANY TABLE TO prof_naveen;
GRANT CREATE ANY TRIGGER TO prof_naveen;
GRANT CREATE ANY PROCEDURE TO prof_naveen;
GRANT CREATE USER TO prof_naveen;
GRANT CREATE SESSION TO prof_naveen;