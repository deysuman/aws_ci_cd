#!/bin/sh
if ! grep -q "533735265043.dkr.ecr.us-east-2.amazonaws.com" ~/.docker/config.json ; then
    eval $(aws ecr get-login --no-include-email --region us-east-2)
fi


datediff() {
    d1=$(date -d "@$1" +%s)
    d2=$(date -d "@$2" +%s)
    calculate=$(( (d1 - d2) / 60 ))
}

declare -a arr=("my_app" "my_app2")
for i in "${arr[@]}"
do
    y=$(eval echo $(aws ecr describe-images --repository-name $i --query 'sort_by(imageDetails,& imagePushedAt)[-1].imagePushedAt' --output text))
    datediff $(date +%s) $y
    if [[ $calculate -lt 2 ]]; then
        AWS_PROFILE=default docker pull "533735265043.dkr.ecr.us-east-2.amazonaws.com/$i"
    fi

done

eval $(/usr/local/bin/docker-compose -f /home/ec2-user/docker-compose.yml down)
eval $(/usr/local/bin/docker-compose -f /home/ec2-user/docker-compose.yml up -d)