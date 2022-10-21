i=2
j=$(wc -l <Shell_Userlist.csv)  
j=$((j+2))
#echo $j
while [ $i != $j ]      
do
    #sed -n $i'p' Shell_Userlist.csv
    sed -n $i'p' Shell_Userlist.csv > temp.txt        
    if grep -q 'Admin' temp.txt 
	then 
        nom=$(cut -d ',' -f 2 temp.txt)
        #nom=echo "$nom" | awk '{print tolower($0)}'    
        mdp=$(cut -d ',' -f 4 temp.txt)

	userdel -r $nom
        #echo -ne "1\n1\n" | sudo adduser $nom
        #usermod -aG sudo $nom
    else
        nom=$(cut -d ',' -f 2 temp.txt)     
        #nom=echo "$nom" | awk '{print tolower($0)}'
        mdp=$(cut -d ',' -f 4 temp.txt)       

	userdel -r $nom
        #echo -ne "1\n1\n" | sudo adduser $nom 
    fi
    i=$((i+1))
done
rm temp.txt
