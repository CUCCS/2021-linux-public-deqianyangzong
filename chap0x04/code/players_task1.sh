#!/usr/bin/env bash

# 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比
function count_agePercentage {
    awk -F "\t" '
        BEGIN {a=0; b=0; c=0;}
        $6!="Age" {
            if($6>=0&&$6<20) {a++;}
            else if($6<=30) {b++;}
            else {c++;}
        }
        END {
            sum=a+b+c;
            printf("Age\tCount\tPercentage\n");
            printf("<20\t%d\t%f%%\n",a,a*100.0/sum);
            printf("[20,30]\t%d\t%f%%\n",b,b*100.0/sum);
            printf(">30\t%d\t%f%%\n",c,c*100.0/sum);
        }' worldcupplayerinfo.tsv
}

# 统计不同场上位置的球员数量、百分比
function count_numPercentage {
    awk -F "\t" '
        BEGIN {sum=0}
        $5!="Position" {
            pos[$5]++;
            sum++;
        }
        END {
            printf("    Position\tCount\tPercentage\n");
            for(i in pos) {
                printf("%13s\t%d\t%f%%\n",i,pos[i],pos[i]*100.0/sum);
            }
        }' worldcupplayerinfo.tsv
}

# 名字最长的球员是谁？名字最短的球员是谁？
function  name_longest_shortest {
    awk -F "\t" '
        BEGIN {max=-1; min=999;}
        $9!="Player" {
            len=length($9);
            names[$9]=len;
            max=len>max?len:max;
            min=len<min?len:min;
        }
        END {
            for(i in names) {
                if(names[i]==max) {
                    printf("The longest name is %s.\n", i);
                } else  if(names[i]==min) {
                    printf("The shortest name is %s.\n", i);
                }
            }
        }' worldcupplayerinfo.tsv
}

# 年龄最大的球员是谁？年龄最小的球员是谁？
# 考虑并列
function age_oldest_youngest {
    awk -F "\t" '
        BEGIN {max=-1; min=999;}
        $6!="Age"  {
            age=$6;
            names[$9]=age;
            max=age>max?age:max;
            min=age<min?age:min;
        }
        END {
            printf("The oldest age is %d, his name is\t.", max);
            for(i in names) {
                if(names[i]==max) { printf("%s\n", i); }
            }
            printf("The youngest age is %d, his name is\t.", min);
            for(i in names) {
                if(names[i]==min) { printf("%s\n", i); }
            }
        }' worldcupplayerinfo.tsv
}

#help文档s
Help(){
    cat << EOF
Usage:
    bash ${0} [Options]
Avaliable options:
    -h          帮助文档.
    -a          统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比.
    -b          统计不同场上位置的球员数量、百分比.
    -c          名字最长的球员是谁？名字最短的球员是谁？.
    -d          年龄最大的球员是谁？年龄最小的球员是谁.
EOF
}


while [ "$1" != "" ];do
    case "$1" in
        "-a")
            count_agePercentage
            exit 0 ;;
        "-b")
            count_numPercentage
            exit 0 ;;
        "-c")
            name_longest_shortest
            exit 0 ;;
        "-d")
            age_oldest_youngest
            exit 0 ;;
        "-h")
            help
            exit 0 ;;
    esac
done