FROM centos

MAINTAINER fallsea@wueasy.com

RUN yum install wget -y \
    && mkdir /elasticjob \
    && yum install java-1.8.0-openjdk* -y \
    && wget -O elasticjob.tar.gz "https://mirror.bit.edu.cn/apache/shardingsphere/elasticjob-ui-3.0.0-beta/apache-shardingsphere-elasticjob-3.0.0-beta-lite-ui-bin.tar.gz" \
    && tar -xvf elasticjob.tar.gz -C /elasticjob --strip-components 1
	
EXPOSE 8088

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-classpath",".:/elasticjob/conf:/elasticjob/lib/*","org.apache.shardingsphere.elasticjob.lite.ui.Bootstrap"]

