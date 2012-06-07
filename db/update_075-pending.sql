-- IMPORTANT: THIS UPDATE IS NOT YET FINISHED, DONT USE!

-- Queries that are pending an update should be placed here. This allows them
-- to be verified as working together. Once complete, the -pending suffix will
-- be removed.

-- We used to have info on Aden Castle treasure chests, but apparently it was
-- always wrong. jp2 doesn't seem to have an entry for them at all (though I'm
-- really just guessing based on map/spawn ids).
-- The chosen id should be good unless you've used it for custom npcs already,
-- in which case you know enough to find another one to use.
-- insert into `npc` values ('46164', 'Treasure Chest of Aden Castle', '$5492', '', 'L1Monster', '6555', '23', '280', '40', '-10', '13', '12', '13', '10', '10', '50', '530', '-16', 'small', '2', '1', '0', '480', '1200', '0', '1600', '1600', '0', '0', '0', '0', '0', '0', 'tebe_m', '0', '-1', '-1', '0', '0', '0', '5000', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '-1', '0', '0', '0', '0', '0');

-- You know the drill... fix the ids if appropriate.
delete from `spawnlist` where (id = 63000 or id = 63001 or id = 63002) and npc_templateid = 46107;
-- insert into `spawnlist` values ('63000', 'Treasure Chest of Aden Castle', '25', '46164', '0', '32770', '32851', '0', '0', '32704', '32768', '32831', '32895', '0', '0', '0', '248', '0', '100', '0', '0', 1, 8, 2, 100);
-- insert into `spawnlist` values ('63001', 'Treasure Chest of Aden Castle', '10', '46164', '0', '32770', '32851', '0', '0', '32704', '32768', '32831', '32895', '0', '0', '0', '249', '0', '100', '0', '0', 1, 8, 2, 100);
-- insert into `spawnlist` values ('63002', 'Treasure Chest of Aden Castle', '20', '46164', '0', '32770', '32851', '0', '0', '32704', '32768', '32831', '32895', '0', '0', '0', '250', '0', '100', '0', '0', 1, 8, 2, 100);

-- Since etcitem also autoincrements, fill your appropriate id in here.
-- insert into `droplist` values (46164, 'Treasure Chest of Aden Castle', 'FILL-ME-IN', 'Ancient Gold Coin', 1, 1, 80000);

-- No idea why this had "Priest of Chaos" on it before. 
update mobskill set mobname = "Mammon" where mobid = 46026;

-- Fix those missing names in the droplist table.
update droplist,npc set droplist.mob_name=npc.name where droplist.mobid=npc.npcid and (mob_name='' or mob_name is null);

-- DK Skill adjustments, part 1. Based off info provided at
-- http://power.plaync.co.kr/lineage/%EC%9A%A9%EA%B8%B0%EC%82%AC+%EB%A6%AC%EB%89%B4%EC%96%BC 
update skills set hpConsume=20, buffDuration=32 where name="GuardBreak";
update skills set hpConsume=12, buffDuration=1800 where name="DragonSkin";
update skills set hpConsume=6 where name="BurningSlash";
update skills set buffDuration=300 where name="Bloodlust";
update skills set hpConsume=18 where name="ShockSkin";
update skills set hpConsume=16 where name="FoeSlayer";
update skills set hpConsume=12, buffDuration=16 where name="ResistFear";
update skills set hpConsume=35 where name="ThunderGrab";
update skills set hpConsume=16 where name="FreezingBreath";
update skills set hpConsume=20, buffDuration=32 where name="HorrorOfDeath";

update weapon set dmg_small=17, hitmodifier=5, dmgmodifier=3 where name = "Destructor's Chain Sword";
update weapon set dmg_small=21, hitmodifier=5, dmgmodifier=3 where name = "Collapsed One's Chain Sword";

-- Adding skill stacking.
alter table skills add `stack_limit` int(10) unsigned not null default 1;

update skills set hpConsume=12 where name="mortalbody";

-- Grade - used for enchanting accessories.
alter table armor add `grade` int(2) signed not null default -1;

-- Karma jewelry has been left off this list until we change it so that you can
-- only get it once.
update armor set grade=0 where item_id=20320 or item_id=120320 or item_id=20313 or item_id=20253 or item_id=20250 or item_id=20281 or item_id=20288 or item_id=20284 or item_id=20314 or item_id=20260 or item_id=20309 or item_id=120309 or item_id=20311 or item_id=120311 or item_id=20310 or item_id=120310 or item_id=20279 or item_id=20255 or item_id=20261 or item_id=20290 or item_id=21093 or item_id=21094;

update armor set grade=1 where item_id=120280 or item_id=20280 or item_id=20300 or item_id=120300 or item_id=20304 or item_id=120304 or item_id=20285 or item_id=120285 or item_id=20312 or item_id=120312 or item_id=20319 or item_id=120319 or item_id=20316 or item_id=120316 or item_id=20317 or item_id=120317 or item_id=20298 or item_id=20289 or item_id=120289 or item_id=20257 or item_id=20277 or item_id=20278 or item_id=20254 or item_id=120254 or item_id=20267 or item_id=120267 or item_id=20266 or item_id=120266 or item_id=20268 or item_id=120268 or item_id=20256 or item_id=120256 or item_id=20264 or item_id=120264 or item_id=20252 or item_id=20294 or item_id=220294 or item_id=20295 or item_id=220295 or item_id=20296 or item_id=220296 or item_id=20293 or item_id=220293 or item_id=21048 or item_id=21095 or item_id=20302 or item_id=120302;

update armor set grade=2 where item_id=20303 or item_id=20306 or item_id=120306 or item_id=20308 or item_id=120308 or item_id=20307 or item_id=120307 or item_id=20321 or item_id=120321 or item_id=20246 or item_id=120246 or item_id=20245 or item_id=120245 or item_id=20249 or item_id=120249 or item_id=20249 or item_id=120249 or item_id=20247 or item_id=120247 or item_id=20248 or item_id=120248 or item_id=20244 or item_id=120244 or item_id=20263 or item_id=20282 or item_id=20423 or item_id=20424 or item_id=20425 or item_id=21050 or item_id=21049 or item_id=21019;
