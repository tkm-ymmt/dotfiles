#!/bin/sh

VBoxManage controlvm "hant-docker" natpf1 "apache,tcp,127.0.0.1,8079,,80"
VBoxManage controlvm "hant-docker" natpf1 "back,tcp,127.0.0.1,8080,,8080"
VBoxManage controlvm "hant-docker" natpf1 "front,tcp,127.0.0.1,8081,,8081"
VBoxManage controlvm "hant-docker" natpf1 "websocket,tcp,127.0.0.1,8082,,8082"
VBoxManage controlvm "hant-docker" natpf1 "mysql,tcp,127.0.0.1,3307,,3306"

