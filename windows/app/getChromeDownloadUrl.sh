#!/bin/bash
#########################################################################
# File Name: getChromeDownloadUrl.sh
# Author: LookBack
# Email: admin#dwhd.org
# Version: 1.3
# Created Time: 2015年9月21日 21:07:46
#########################################################################

listFile="/home/wwwroot/mirrors.dwhd.org/Chrome/Chrome_Downlod_list.txt"
sessionId='{3597644B-2952-4F92-AE55-D315F45F80A5}'
requestId='{CD7523AD-A40D-49F4-AEEF-8C114B804658}'
installSource='ondemandcheckforupdate'
appId=({4DC8B4CA-1BDA-483E-B5FA-D3C12E15B62D} {4EA16AC7-FD5A-47C3-875B-DBF4A2008C20})
archVersion=(x86 x64)
apVersion=(-multi-chrome x64-stable-multi-chrome 1.1-beta  x64-beta-multi-chrome 2.0-dev x64-dev-multi-chrome canary x64-canary)
baseInfo=($sessionId $installSource $requestId)

if ! which axel >/dev/null 2>&1; then echo "Plz Install axel";fi

getVersion() {
    curl -s -d "<?xml version='1.0' encoding='UTF-8'?><request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' \
        ismachine='1' sessionid='$1' installsource='$2' requestid='$3' dedup='cr'><os platform='win' \
        version='6.1' sp='' arch='$4'/><app appid='$5' version='0' nextversion='' ap='$6' lang='' brand='GGLS' client=''>\
        <updatecheck/><ping active='1'/></app></request>" https://tools.google.com/service/update2 | \
        sed 's/>/>\n/g;s/hash/\n< hash/g;s/name/\n< name/g' | awk -F'[ |"|=]+' '{
            if($2~/codebase/){
                a[i++]=$3
            }
            else if($2~/version/ && $3!=1.0){
                print$2"="$3;next
            }
            else if($2~/hash/){
                print $2"="$3
            }
            else if ($2~/name/ && $3!~/^st/){
                c=$3;print $2"="c
            }
        }END{
            for(i=0;i<=10;i++)
            if (a[i]~/[:graph:]/)print "codebase_'"$a"'"i"="a[i]c
        }'
}

:>$listFile
for i in `seq 1 ${#apVersion[@]}`;do
    [ "$(($i % 2))" = "1" ] && arch=${archVersion[0]} || arch=${archVersion[1]}
    [ "$i" = "1" -o "$i" = "2" ] && a=Stable
    [ "$i" = "3" -o "$i" = "4" ] && a=Beta
    [ "$i" = "5" -o "$i" = "6" ] && a=Dev
    [ "$i" = "7" -o "$i" = "8" ] && a=Canary
    [ "$i" = "7" ] && apVersion[6]='' && appId[0]=${appId[1]}
    echo "#=========[$a $arch]=========#" >> $listFile
    getVersion ${baseInfo[*]} $arch ${appId[0]} ${apVersion[(($i -1 ))]} >> $listFile
    source $listFile
    [ ! -f "$(dirname $listFile)/${a}_$name" ] && eval wget \$codebase_${a}0 -O $(dirname $listFile)/${a}_$name
    #eval axel -q -n 20 \$codebase_${a}0 -o $(dirname $listFile)/${a}_$name 2>/dev/nll
    unset arch a
done

for i in Stable Beta Dev Canary; do
    [ ! -d "$(dirname $listFile)/History_$i" ] && mkdir -p $(dirname $listFile)/History_$i
    LastVersion=`find $(dirname $listFile) -maxdepth 1 -type f -name '*64*' -name "${i}*" | awk '{a=NR}END{if (NR==a)print}'`
    [ -n "$LastVersion" ] && find $(dirname $listFile) -maxdepth 1 -type f -name '*64*' -name "${i}*" ! -name "$(basename $LastVersion)" | \
        xargs -i mv {} $(dirname $listFile)/History_$i
done

for i in Stable Beta Dev Canary; do
    [ ! -d "$(dirname $listFile)/History_$i" ] && mkdir -p $(dirname $listFile)/History_$i
    LastVersion=`find $(dirname $listFile) -maxdepth 1 -type f -name "${i}*" ! -name '*64*' | awk '{a=NR}END{if (NR==a)print}'`
    [ -n "$LastVersion" ] && find $(dirname $listFile) -maxdepth 1 -type f -name "${i}*" ! -name '*64*' ! -name "$(basename $LastVersion)" | \
        xargs -i mv {} $(dirname $listFile)/History_$i
done
