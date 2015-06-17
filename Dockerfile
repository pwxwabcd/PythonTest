# VERSION 0.0.1
# 默认ubuntu server长期支持版本，当前是12.04
FROM ubuntu:14.04
# 签名啦
MAINTAINER wangxiaowei "4954512@qq.com"

# 更新源，安装ssh server
# RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# 设置root ssh远程登录密码为123456
RUN echo "root:123456" | chpasswd 

# 添加orache java7源，一次性安装vim，wget，curl，java7，tomcat7等必备软件
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN apt-get install -y vim 
RUN apt-get install -y wget 
RUN apt-get install -y curl 
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install -y oracle-java7-installer
RUN apt-get install -y tomcat7

# 设置JAVA_HOME环境变量
RUN update-alternatives --display java
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle">> /etc/environment
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle">> /etc/default/tomcat7

# 容器需要开放SSH 22端口
EXPOSE 22

# 容器需要开放Tomcat 8080端口
EXPOSE 8080

# 设置Tomcat7初始化运行，SSH终端服务器作为后台运行
ENTRYPOINT service tomcat7 start && /usr/sbin/sshd -D