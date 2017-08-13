#!/bin/bash
maven_pom() {

gid=$1		# groupId
aid=$2		# artifactId
ver=$3		# version
name=$4		# Mane

fl="pom.xml"
pomfile=${aid}/$fl
mkdir -p -- "$aid"

cat > "$pomfile" << EOF1
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>$gid</groupId>
  <artifactId>$aid</artifactId>
  <version>$ver</version>
  <name>$name</name>
  <url>http://maven.apache.org</url>

  <parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>1.3.1.RELEASE</version>
		<relativePath /> <!-- lookup parent from repository -->
	</parent>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <java.version>1.8</java.version>
  </properties>

  <dependencies>

    		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-thymeleaf</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-security</artifactId>
		</dependency>
		<dependency>
			<groupId>org.webjars</groupId>
			<artifactId>bootstrap</artifactId>
			<version>3.3.4</version>
		</dependency>
		<dependency>
			<groupId>org.webjars</groupId>
			<artifactId>Bootstrap-3-Typeahead</artifactId>
			<version>3.1.1</version>
		</dependency>
		<dependency>
			<groupId>org.webjars</groupId>
			<artifactId>bootstrap-tagsinput</artifactId>
			<version>0.6.1</version>
		</dependency>
		<dependency>
			<groupId>com.itextpdf</groupId>
			<artifactId>itextpdf</artifactId>
			<version>5.5.8</version>
		</dependency>
		<dependency>
			<groupId>org.webjars</groupId>
			<artifactId>jquery</artifactId>
			<version>2.1.4</version>
		</dependency>
		<dependency>
			<groupId>org.webjars</groupId>
			<artifactId>jquery-mobile</artifactId>
			<version>1.4.5</version>
		</dependency>
		<dependency>
			<groupId>commons-fileupload</groupId>
			<artifactId>commons-fileupload</artifactId>
			<version>1.3.2</version>
		</dependency>
		<dependency>
			<groupId>commons-io</groupId>
			<artifactId>commons-io</artifactId>
			<version>2.5</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-mail</artifactId>
		</dependency>
		<dependency>
			<groupId>net.sf.uadetector</groupId>
			<artifactId>uadetector-core</artifactId>
			<version>0.9.22</version>
		</dependency>
		<dependency>
			<groupId>net.sf.uadetector</groupId>
			<artifactId>uadetector-resources</artifactId>
			<version>2014.10</version>
		</dependency>
		<dependency>
			<groupId>net.sf.uadetector</groupId>
			<artifactId>uadetector-json</artifactId>
			<version>0.1.22</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-websocket</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-messaging</artifactId>
		</dependency>
		<dependency>
			<groupId>com.squareup.retrofit2</groupId>
			<artifactId>retrofit</artifactId>
			<version>2.1.0</version>
		</dependency>
		<dependency>
			<groupId>com.squareup.retrofit2</groupId>
			<artifactId>converter-gson</artifactId>
			<version>2.1.0</version>
		</dependency>
		<dependency>
			<groupId>com.squareup.retrofit2</groupId>
			<artifactId>adapter-rxjava</artifactId>
			<version>2.1.0</version>
		</dependency>
		<dependency>
			<groupId>com.squareup.okhttp3</groupId>
			<artifactId>logging-interceptor</artifactId>
			<version>3.4.1</version>
		</dependency>
		<dependency>
			<groupId>com.squareup.okhttp3</groupId>
			<artifactId>okhttp</artifactId>
			<version>3.7.0</version>
		</dependency>
		<dependency>
			<groupId>com.squareup.okhttp3</groupId>
			<artifactId>okhttp-urlconnection</artifactId>
			<version>3.4.1</version>
		</dependency>

		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-core</artifactId>
		</dependency>
		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-databind</artifactId>
		</dependency>
  </dependencies>
  <build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
				<configuration>
        			<addResources>true</addResources>
        			<executable>true</executable>
      			</configuration>
      			<executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                </executions>
			</plugin>
		</plugins>
	</build>

</project>


EOF1

}

