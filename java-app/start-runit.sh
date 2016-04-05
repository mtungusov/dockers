#!/bin/sh

env > /etc/envvars

/sbin/runsvdir -P /etc/service
