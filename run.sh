# sudo  systemctl start docker;

# cat mysql.yaml;                  

# sudo docker volume create $vol ;

# sed -i 's/$old-text/$new-text/g' mysql.yaml;

# sudo docker-compose -f mysql.yaml up -d;


echo "Do you wish to create volumes name, password mysql?(Yes/No(default volumes: test-vol, password: 123456))"

PS3="Select the operation: "

select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            read -p "Enter the volumes name: " n1
            read -p "Enter the password mysql: " n2
            # echo "$n1 - $n2"
            sudo  systemctl start docker
            sudo docker volume create $n1
            mkdir output/$n1
            cp .env mysql.yaml output/$n1
            sed -i 's/test-vol/'$n1'/g' output/$n1/mysql.yaml
            sed -i 's/123456/'$n2'/g' output/$n1/.env
            # cat output/$n1/mysql.yaml
            sudo docker-compose -f mysql.yaml up -d
            break
            ;;
        No ) 
            sudo  systemctl start docker
            sudo docker volume create test-vol
            sudo docker-compose -f mysql.yaml up -d
            exit
            ;;
    esac
done