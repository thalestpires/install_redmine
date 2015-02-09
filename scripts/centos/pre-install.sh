yum update
yum install svn git telnet

yum install gcc-c++ patch readline readline-devel zlib zlib-devel libcurl-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison 

sed --in-place "s/SELINUX=enforcing/SELINUX=permissive/g" /etc/selinux/config
setenforce 0
