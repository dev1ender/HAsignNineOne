file = load '/home/acadgild/Assignments/HAsignNineOne/petrol_dataset' USING PigStorage(',') AS (DistID:chararray,DistName:chararray,BuyRate:chararray,SellRate:chararray,VolumeIN:int,VolumeOUT:int,Year:int);
DistNameGroup = Group file BY DistName;
result = FOREACH DistNameGroup GENERATE group,SUM(file.VolumeOUT);
dump result;
