#!/bin/bash
main_class() {
ans=$(zenity --forms --title="Create Classes" \
	--text="Class Details." \
	--separator=";" \
	--add-entry="Project Name " \
	--add-entry="Class Name " \  )
echo "$ans"
}

get_package() {
gid=$(sed -n '/<groupId>/p' pom.xml  | head -1| sed 's/ //g'| sed 's/<groupId>//g'| sed 's/<\/groupId>//g')
aid=$(sed -n '/<artifactId>/p' pom.xml  | head -1| sed 's/ //g'| sed 's/<artifactId>//g'| sed 's/<\/artifactId>//g')
echo $gid $aid
}
