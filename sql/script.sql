create table HPPersonGeneric
(
    sysid      bigserial primary key,
    personId   varchar(4) not null ,
    familyName varchar(30) not null ,
    givenName  varchar(30) not null
);

create type degree as enum ('mother', 'father', 'son', 'daughter', 'cousin', 'other');

create table HPPersonDependant
(
    sysid               bigint not null ,
    familyName          varchar(30) not null ,
    givenName           varchar(30) not null ,
    contactRelationship degree,
    birthday            date,
    foreign key (sysid) references HPPersonGeneric (sysid) on delete cascade
);

insert into hppersongeneric (sysid, personId, familyname, givenname)
values (default, 'test', 'Aidinov', 'Sergei')
     , (default, 'dev', 'Ivan', 'Petrov')
     , (default, 'prod', 'Boris', 'Sidorov');

insert into hppersondependant (sysid, familyname, givenname, contactrelationship, birthday)
values (1, 'Aidinov', 'Victor', 'father', '1945-Jul-31'),
       (1, 'Aidinova', 'Margarita', 'mother', '1940-Nov-21'),
       (2, 'Ivanova', 'Victoria', 'daughter', '2003-Aug-22');

select hppersongeneric.sysid,
       hppersongeneric.familyname,
       hppersongeneric.givenname,
       coalesce(hppersondependant.familyname, 'NONE')                 as relative_familyname,
       coalesce(hppersondependant.givenname, 'NONE')                  as relative_givenname,
       coalesce(hppersondependant.contactrelationship:: text, 'NONE') as relation_degree,
       coalesce(hppersondependant.birthday:: text, 'NONE')            as birthday
from hppersongeneric
         left join hppersondependant on hppersondependant.sysid = hppersongeneric.sysid
where hppersongeneric.personId = 'test';

--delete from hppersondependant where sysid = 2;
