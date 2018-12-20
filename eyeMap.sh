#! /bin/bash
current=`pwd`
echo ""
echo ""
echo ""
echo ""
echo "################################################################################"
echo "#                                  e y e M a p                                 #"
echo "################################################################################"
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo -e "Do you want to read from a list? [y/n] \c"
read isList
nmapstart=`date +%j`
if [ $isList = "y" ]; then
	echo -e "file name: (or path) \c"
	read fileName
	nmap=`nmap -iL $fileName -p T:80,443,8000,8080,8888 -oA results --open`
else
	echo -e "enter the IP: \c"
	read UserIP
	nmap=`nmap $UserIP -p T:80,443,8000,8080,8888 -oA results --open`
fi
nmapstop=`date +%j`
nmaptime=`expr $nmapstart - $nmapstop`
echo "NMap scan completed in $nmaptime seconds \c"
echo -e "What do you want to name the screenshot directory? \c"
read ewDir
echo $nmap
cp results.xml /root/iMap/EyeWitness
eyestart=`date +%j`
Eye -x results.xml -d $ewDir --timeout 5 --headless
rm /root/iMap/EyeWitness/results.xml
rm /root/iMap/EyeWitness/parsed_xml.txt
mv $ewDir $current
cd $current
mv results.xml $current/$ewDir
mv results.gnmap $current/$ewDir
mv results.nmap $current/$ewDir
