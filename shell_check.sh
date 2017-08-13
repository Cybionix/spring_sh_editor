cln=$(sed -n '/public class/p' $1/pom.xml  | head -1| sed 's/ //g'| sed 's/class//g'| sed 's/{//g')



			################### Get Class Name from class file ################

cls=$(sed -n '/public class/p' Cybionix.java  | head -1| sed 's/ //g'| sed 's/publicclass//g'|sed 's/{//g')


sed -n '/@Column(unique=true)/{=;p}' User.java| sed '{N;s/\n/ /}'


sed -n '/@Column(unique=true)/{=;p}' User.java| sed '{N;s/\n/\t/}'
