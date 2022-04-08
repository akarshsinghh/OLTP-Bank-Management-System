SET SERVEROUTPUT ON;
create or replace PROCEDURE dept (
    i_dname department.dept_name%type,
    i_dloc department.dept_location%type
) AS

cname number;
deptid number;
dname department.dept_name%type;
dloc number;
same_name exception;
too_long exception;
invalid_location exception;
same_name_but_location_updated exception;
other exception;

BEGIN

select count(*) as c into dname from department where UPPER(dept_name) = UPPER(i_dname);

if UPPER(i_dloc) NOT IN ('MA', 'TX', 'IL', 'CA', 'NY', 'NJ', 'NH', 'RH') then
raise invalid_location;
end if;

if dname > 0 then
if UPPER(i_dloc) IN ('MA', 'TX', 'IL', 'CA', 'NY', 'NJ', 'NH', 'RH') then
UPDATE department
SET dept_location = i_dloc
WHERE dept_name = i_dname;
raise same_name_but_location_updated;
else
raise invalid_location;
end if;
else
if length(ltrim(rtrim(i_dname,' '),' ')) > 20 then
raise too_long;
end if;
deptid := did.nextval();
INSERT INTO department (dept_id, dept_name, dept_location) VALUES (deptid,i_dname,i_dloc);
end if;

dbms_output.put_line ('NEW ROW SUCCESSFULLY INSERTED');


exception
when same_name then
dbms_output.put_line ('ERROR: You have entered' || i_dname || ' a department that already exsists');
when invalid_location then
dbms_output.put_line ('ERROR: You have entered' || i_dloc || ' a location that is not in the following accepted location -->  MA, TX, IL, CA, NY, NJ, NH, RH');
when too_long then
dbms_output.put_line ('ERROR: length of department name is more than 20');
when same_name_but_location_updated then
dbms_output.put_line ('ERROR: You have entered' || i_dname || ' a department that already exsists but LOCATION UPDATED TO ' || i_dloc);
when other then
dbms_output.put_line ('ERROR: OTHER');
when no_data_found then
dbms_output.put_line ('ERROR: NO DAGA FOUND');
 
end dept;


