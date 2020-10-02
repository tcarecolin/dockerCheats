#! /bin/sh
docker ps -a --format "table {{.Names}}\t{{.Ports}}\t{{.Image}}\t{.Status}}";
exit 0;
