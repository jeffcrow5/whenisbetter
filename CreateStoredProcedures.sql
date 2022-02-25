create or replace procedure updateSettings(
   usersid int,
   newfirstname varchar,
   newlastname varchar, 
   newemailaddress varchar
)
language plpgsql    
as $$
begin
    -- Update User Settings 
    update "User" 
    set firstname = newfirstname, lastname = newlastname, emailaddress = newemailaddress 
    where userid = usersid;

    commit;
end;$$
