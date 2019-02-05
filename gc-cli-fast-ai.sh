#!/usr/bin/env bash

option=$1
argument=$2
user="jupyther"

usage() {
  echo -n "$0 [OPTIONS] [ARGS]
    Exmaple:
        $0 start cpu
    Options:
        start   start the cloud instance
        stop    stop the cloud instance
        ssh     ssh into the cloud instance
        help    show usage
    ARGUMENTS:
        cpu     run the cpu instance
        gpu     run the gpu instance
"
}
start(){
    case $argument in
	"cpu")
		gcloud compute instances start --zone=$ZONE $INSTANCE_NAME_CPU
		;;
	"gpu")
        gcloud compute instances start --zone=$ZONE $INSTANCE_NAME_GPU 
        ;;
    *)
        usage
		;;
    esac
}

stop(){
    case $argument in
	"cpu")
		gcloud compute instances stop --zone=$ZONE $INSTANCE_NAME_CPU 
		;;
	"gpu")
        gcloud compute instances stop --zone=$ZONE $INSTANCE_NAME_GPU 
        ;;
    *)
        usage
		;;
    esac
}
ssh(){
    case $argument in
	"cpu")
		gcloud compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME_CPU -- -L 8080:localhost:8080
		;;
	"gpu")
        gcloud compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME_GPU -- -L 8080:localhost:8080
        ;;
    *)
        usage
		;;
    esac
}

case $option in
	"start")
		start
		;;
	"stop")
		stop
		;;
    "ssh")
		ssh
		;;
    "help" | "-h" | "--help")
		usage
		;;
	*)
		usage
		;;
esac

