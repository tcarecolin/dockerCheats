#! /bin/bash
docker inspect -f '{{.Name}} {{"\t\t\t"}} {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq) > $(pwd)/tmp;
column -t -s $'\t' $(pwd)/tmp; rm $(pwd)/tmp;
exit 0;
