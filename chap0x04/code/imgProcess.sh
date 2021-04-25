#!/usr/bin/env bash

# 对jpeg格式图片进行图片质量压缩
function img_qualityCompress {
    Q=$1 # 质量因子
    for i in *;do
        type=${i##*.} # 得到类型
        if [[ ${type} != "jpg" && ${type} != "jpeg" ]]; then continue; fi;
        convert "${i}" -quality "${Q}" "${i}"
        echo " ${i} is already compressed."
    done
}

# 对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
function img_distinguishCompress {
    D=$1
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        convert "${i}" -resize "${D}" "${i}"
        echo "${i} is already resized."
    done
}

# 对图片批量添加自定义文本水印
function img_watermark {
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        convert "${i}" -pointsize "$1"  -draw "text 0,20 '$2'" "${i}"
        echo "Watermark ${i} is already added on $2."
    done
}

# 统一添加文件名前缀
function file_addPrefix {
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        mv "${i}" "$1""${i}"
        echo "${i} is prefixed as $1${i} ."
    done
}

# 统一添加文件名后缀
function file_addPostfix {
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        newname=${i%.*}$1"."${type}
        mv "${i}" "${newname}"
        echo "${i} is postfixed as ${newname}."
    done
}

# 将png/svg图片统一转换为jpg格式图片
function img_transToJpg {
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        newfile=${i%.*}".jpg"
        convert "${i}" "${newfile}"
   	echo " ${i} is already transformed to  ${newfile} ."
    done
}

#help文档
HELP(){
    cat << EOF
Usage:
    bash ${0} [Options]
    Avaliable options:
    -h          帮助文档.
    -a          对jpeg格式图片进行图片质量因子为Q的压缩          
    -b          对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩成D分辨率
    -c          对图片批量添加自定义文本水印        
    -d          统一添加文件名前缀，不影响原始文件扩展名
    -e          统一添加文件名后缀，不影响原始文件扩展名
    -f          将png/svg图片统一转换为jpg格式图片
EOF
    return
}

#使用0命令行参数方式使用不同功能
while [ "$1" != "" ];do
case "$1" in
    "-q")
        img_qualityCompress "$2"
        exit 0 ;;
    "-d")
        img_distinguishCompress "$2"
        exit 0 ;;
    "-w")
        img_watermark "$2" "$3"
        exit 0 ;;
    "-p")
        file_addPrefix "$2"
        exit 0 ;;
    "-s")
        file_addPostfix "$2"
        exit 0 ;;
    "-t")
        img_transToJpg
        exit 0 ;;
    "-h")
        help
        exit 0 ;;
esac
done