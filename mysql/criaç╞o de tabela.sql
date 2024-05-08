CREATE TABLE matches (
    id_matches INT AUTO_INCREMENT PRIMARY KEY,
gameid int,
platformid varchar(50),
queueid int,
seasonid int,
duration int,
creation int,
version varchar(20)
);

create table participants (
 id_participants int auto_increment primary key,
matchid int,
player int,
championid int,
ss1 int,
ss2 int,
role varchar(20),
position varchar(20)
);

create table teamban (
 id_teamban int auto_increment primary key,
matchid int,
teamid int,
championid int,
banturn int
);

create table teamstats (
id_teamstats int auto_increment primary key,
matchid int,
teamid int,
firstblood int,
firsttower int,
firstinhib int,
firstbaron int,
firstdragon int,
firstharry int,
towerkills int,
inhibkills int,
baronkills int,
dragonkills int,
harrykills int
);
create table champs (
id_champs int auto_increment primary key,
Champions int,
HP int,
HP_ADD int,
MP int,
AD int,
AR int,
MR int,
MS int,
Ranged int
);
ALTER TABLE participants 
ADD CONSTRAINT fk_participants_matchid 
FOREIGN KEY (matchid) 
REFERENCES matches(id_matches),
ADD CONSTRAINT fk_participants_championid 
FOREIGN KEY (championid) 
REFERENCES champs(id_champs);
  
ALTER TABLE teamstats 
ADD CONSTRAINT fk_teamstats_matchid 
FOREIGN KEY (matchid) 
REFERENCES matches(id_matches);  

ALTER TABLE teamban 
ADD CONSTRAINT fk_teamban_matchid 
FOREIGN KEY (matchid) 
REFERENCES matches(id_matches), 
ADD CONSTRAINT fk_teamban_championid 
FOREIGN KEY (championid) 
REFERENCES champs(id_champs);
 
 ALTER TABLE champs modify Champions varchar(20);
 select * from champs;
 alter table participants change COLUMN role roles varchar(20); 