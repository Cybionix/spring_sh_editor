#!/bin/bash
main_class() {
# ans=$(zenity --forms --title="Create Project" \
#	--text="Enter informations." \
#	--separator=";" \
#	--add-entry="Package" \
#	--add-entry="Class" \
#	--add-entry="Project Name");

#	array=( 0.0.1-SNAPSHOT 0.0.1-GAMMA 0.0.1-BETA )

ans=$(zenity --forms --title="Create Project" \
	--text="Enter informations." \
	--separator=";" \
	--add-entry="Group ID" \
	--add-entry="Articact ID " \
	--add-entry="Version " \
	--add-entry="Project Name" );

echo "$ans"
}

create_project_structure() {

gid=$1		# groupId
aid=$2		# artifactId
ver=$3		# version
name=$4		# Mane
P=$gid.$aid

W=$(pwd)
FD="/src/main/java/"
MDL="models"
REPO="repository"
SIN="service_interface"
SIM="service_implements"
CTRL="controller"

mkdir -p -- "$W/$aid/$FD/${P//.//}/$MDL"
mkdir -p -- "$W/$aid/$FD/${P//.//}/$REPO"
mkdir -p -- "$W/$aid/$FD/${P//.//}/$SIN"
mkdir -p -- "$W/$aid/$FD/${P//.//}/$SIM"
mkdir -p -- "$W/$aid/$FD/${P//.//}/$CTRL"

}


application_class() {

gid=$1		# groupId
aid=$2		# artifactId
ver=$3		# version
name=$4		# Mane
P=$gid.$aid

W=$(pwd)
FD="/src/main/java/"
app="Application.java"
appclass=$W/$aid/$FD/${P//.//}/${app}

cat > "$appclass" << EOF1
package $P;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class Application {
    public static void main(String[] args) throws Exception {
        SpringApplication.run(Application.class, args);
    }
}
EOF1
}

resource_settings() {

gid=$1		# groupId
aid=$2		# artifactId
ver=$3		# version
name=$4		# Mane
P=$gid.$aid

W=$(pwd)
FD="/src/main/resources/"
mkdir -p -- "$W/$aid/$FD/static/"
mkdir -p -- "$W/$aid/$FD/templates/"
ans=$(zenity --forms --title="Database Configuration" \
	--text="Database Details." \
	--separator=";" \
	--add-entry="DB Name" \
	--add-entry="Username " \
	--add-password="Password "  )
dbss=(${ans//;/ })
fn="$W/$aid/$FD/application.properties"
echo  $fn ${dbss[0]} ${dbss[1]} ${dbss[2]}
properties_files $fn ${dbss[0]} ${dbss[1]} ${dbss[2]}
}

properties_files() {
fn=$1
dbname=$2
UN=$3
PW=$4

cat > "$fn" << EOF1
spring.datasource.url= jdbc:mysql://localhost:3306/${dbname}
spring.datasource.username=${UN}
spring.datasource.password=${PW}
spring.jpa.hibernate.ddl-auto=update
EOF1
}


