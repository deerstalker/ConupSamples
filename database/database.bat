echo ŽŽœšÊýŸÝ¿â
mysql -u root -pnjueducn <"createdatabase.sql"
echo ŽŽœšÊýŸÝ¿â±í
mysql HYDROLOGY -uroot -pnjueducn<"createtable.sql"
echo Ïòcity±íÖÐ²åÈë³ÇÊÐÊýŸÝ
mysql HYDROLOGY -uroot -pnjueducn<"insertcity.sql"
echo Ïòrainfall±íÖÐ²åÈëÓêÁ¿ÊýŸÝ
mysql HYDROLOGY -uroot -pnjueducn<"insertrainfall.sql"
echo Ïòstationinfo±íÖÐ²åÈëºÓµÀÕŸºÍË®¿âÕŸÐÅÏ¢
mysql HYDROLOGY -uroot -pnjueducn<"insertstationinfo.sql"
echo Ïòstationrainfall±íÖÐ²åÈëÓêÁ¿ÊýŸÝ
mysql HYDROLOGY -uroot -pnjueducn<"insertstationrainfall.sql"
echo Ïòpondage±íÖÐ²åÈëË®Î»ÊýŸÝ
mysql HYDROLOGY -uroot -pnjueducn<"insertpondage.sql"
echo 向cityweather表中插入数据
mysql HYDROLOGY -uroot -pnjueducn<"insertcityweather.sql"
echo 向stationweather表中插入数据
mysql HYDROLOGY -uroot -pnjueducn<"insertstationweather.sql"
pause

