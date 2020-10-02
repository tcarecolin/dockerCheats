#! /bin/bash
docker inspect -f '{{.Name}}{{"\t"}}{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}{{"\t"}}{{range $p, $conf := .Config.ExposedPorts}}{{$p}}{{end}}{{"\t"}}{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}' $(docker ps -aq) > $(pwd)/tmp;
column -t -s $'\t' $(pwd)/tmp; rm $(pwd)/tmp;
exit 0;
