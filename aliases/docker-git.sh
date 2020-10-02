#! /bin/bash
docker ps --format "{{.Names}}" > $(pwd)/tmp1;
echo "NAME|COMMIT|BRANCH" > $(pwd)/tmp2;
while IFS= read -r line
do
	name=$line;
	git_commit=$(docker inspect $name | grep git_commit);
	git_branch=$(docker inspect $name | grep git_branch);
	if [ -z "$git_commit" ];
	then
		git="";
	else
		git=$(echo $git_commit | sed 's/ //g');
                git="${git:12}";
                git="${git::-2}";
	fi
	if [ -z "$git_branch" ];
	then
		brn="";
	else
		brn=$(echo $git_branch | sed 's/ //g');
                brn="${brn:12}";
                brn="${brn::-1}";
	fi
	echo "$name|$git|$brn" >> $(pwd)/tmp2;
	unset brn git;
done < $(pwd)/tmp1;
column -t -s $'|' $(pwd)/tmp2; 
rm $(pwd)/tmp1 $(pwd)/tmp2;
exit 0;
