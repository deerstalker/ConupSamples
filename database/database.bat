echo �������ݿ�
mysql -u root -pnjueducn <"createdatabase.sql"
echo �������ݿ��
mysql HYDROLOGY -uroot -pnjueducn<"createtable.sql"
echo ��city���в����������
mysql HYDROLOGY -uroot -pnjueducn<"insertcity.sql"
echo ��rainfall���в�����������
mysql HYDROLOGY -uroot -pnjueducn<"insertrainfall.sql"
echo ��stationinfo���в���ӵ�վ��ˮ��վ��Ϣ
mysql HYDROLOGY -uroot -pnjueducn<"insertstationinfo.sql"
echo ��stationrainfall���в�����������
mysql HYDROLOGY -uroot -pnjueducn<"insertstationrainfall.sql"
echo ��pondage���в���ˮλ����
mysql HYDROLOGY -uroot -pnjueducn<"insertpondage.sql"
pause

