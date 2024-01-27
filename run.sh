echo "Do you wish to create volumes name, password mysql?(Yes/No)"
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
            exit
            ;;
    esac
done