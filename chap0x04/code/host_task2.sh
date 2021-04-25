#!/usr/bin/env bash

# 统计访问来源主机TOP 100和分别对应出现的总次数
function host_top100 {
    printf "%40s\t%s\n" "hostname" "count"
    awk -F "\t" '
    NR>1 {host[$1]++;}
    END { for(i in host) {printf("%40s\t%d\n",i,host[i]);} }
    ' web_log.tsv | sort -g -k 2 -r | head -100
}

# 统计访问来源主机TOP 100 IP和分别对应出现的总次数
function host_ip_top100 {
    printf "%20s\t%s\n" "IP" "count"
    awk -F "\t" '
    NR>1 {if(match($1, /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/)) ip[$1]++;}
    END { for(i in ip) {printf("%20s\t%d\n",i,ip[i]);} }
    ' web_log.tsv | sort -g -k 2 -r | head -100
}

# 统计最频繁被访问的URL TOP 100
function url_top100 {
    printf "%55s\t%s\n" "URL" "count"
    awk -F "\t" '
    NR>1 {url[$5]++;}
    END { for(i in url) {printf("%55s\t%d\n",i,url[i]);} }
    ' web_log.tsv | sort -g -k 2 -r | head -100
}

# 统计不同响应状态码的出现次数和对应百分比
function response_calc {
    awk -F "\t" '
    BEGIN {printf("code\tcount\tpercentage\n");}
    NR>1 {code[$6]++;}
    END { for(i in code) {printf("%d\t%d\t%f%%\n",i,code[i],100.0*code[i]/(NR-1));} }
    ' web_log.tsv
}

# 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
function response_4xx_calc {
    printf "%55s\t%s\n" "code=403 URL" "count"
    awk -F "\t" '
    NR>1 { if($6=="403") code[$5]++;}
    END { for(i in code) {printf("%55s\t%d\n",i,code[i]);} }
    ' web_log.tsv | sort -g -k 2 -r | head -10

    printf "%55s\t%s\n" "code=404 URL" "count"
    awk -F "\t" '
    NR>1 { if($6=="404") code[$5]++;}
    END { for(i in code) {printf("%55s\t%d\n",i,code[i]);;} }
    ' web_log.tsv | sort -g -k 2 -r | head -10
}

# 给定URL输出TOP 100访问来源主机
function aimed_host_top100  {
    printf "%40s\t%s\n" "given_hostname" "count"
    awk -F "\t" '
    NR>1 {if("'"$1"'"==$5) {host[$1]++;} }
    END { for(i in host) {printf("%40s\t%d\n",i,host[i]);} }
    ' web_log.tsv | sort -g -k 2 -r | head -100
}

#help文档
HELP(){
    cat << EOF
Usage:
    bash ${0} [Options]
    Avaliable options:
    -h          帮助文档.
    -a          输出访问来源主机TOP 100和分别对应出现的总次数          
    -b          输出访问来源主机TOP 100 IP和分别对应出现的总次数
    -c          统计最频繁被访问的URL TOP 100         
    -d          统计不同响应状态码的出现次数和对应百分比
    -e          分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
    -f          给定URL输出TOP 100访问来源主机
EOF
    return
}


while [ "$1" != "" ];do
    case "$1" in
       "-a")
      count_host
      exit 0 ;;
       "-b")
      count_IP
      exit 0 ;;
       "-c")
      count_URL
      exit 0 ;;
       "-d")
      count_stateCode
      exit 0 ;; 
       "-e")
      count_stateCode4xx
      exit 0 ;;
       "-f")
      given_URL "$2"
      exit 0 ;;
       "-h")
      help
      exit 0 ;;
    esac
done