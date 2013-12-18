#!/bin/bash                                                                  
#file: mkcscope  
#function: make cscope database and ctags database  
   
ignore="( -name .git -o -name test -o -name tests ) -prune -o"  
type="( -name *.java -o -name *.cpp -o -name *.[ch] -o -name *.xml -o -name  
*.aidl )"  
# sed separated by spaces, tabs, or new-lines
replace='s/\(["'\''\]\)/\\\1/g;s/^/"/;s/$/"/'
ANDROID_SRC=/opt/android/android-2.3.7_r1
android=$ANDROID_SRC  
path="$android/frameworks \  
    $android/packages \  
    $android/external \  
    $android/system \  
    $android/bionic \  
    $android/hardware \  
    $android/dalvik \  
    $android/prebuilt/linux-x86 \  
    $android/bootable"  
cscopedb=$ANDROID_SRC/
prepare()  
{  
    if [ ! -d $ANDROID_SRC ]; then  
        echo "no ANDROID_SRC set"  
        echo "please set ANDROID_SRC at your .bashrc file"  
        exit 1  
    else  
        echo "ANDROID_SRC:$ANDROID_SRC"  
        if [ -d $cscopedb ]; then  
            echo "$cscopedb exist already"  
            if [ -e $cscopedb/cscope.files ]; then  
                echo "file $cscopedb/cscope.files exist"  
#               rm $cscopedb/cscope.files  
            fi  
        else  
            mkdir $cscopedb  
            echo "make directory $cscopedb"  
        fi  
    fi  
    all_source | sed $replace | sort > $cscopedb/cscope.files  
    lines=$(wc -l $cscopedb/cscope.files | awk '{ printf $1 }')  
    echo "find $lines files totaly"  
}  
all_source()  
{  
    for src in $path  
    do  
    find -L $src $ignore $type -print  
    done  
}  
  
docscope()  
{  
    echo "Now begin build cscope cross-index file"  
    start=`date +%s`  
    cscope -b -k -q -i $cscopedb/cscope.files -f $cscopedb/cscope.out  
    end=`date +%s`  
    let "elapse=$end-$start"  
    if [ $? -eq 0 ]; then  
        echo "make cscope database file with total time ($elapse) seconds"  
        size=$(du $cscopedb/cscope.out -h | awk '{ printf $1 }')  
        echo "($cscopedb/cscope.out):$size"  
    fi  
}  
dotags()  
{  
    echo "Now begin build tags file"  
    start=`date +%s`  
    ctags --fields=+afiKlmnsSzt -L $cscopedb/cscope.files -f $cscopedb/tags  
    end=`date +%s`  
    let "elapse=$end-$start"  
    if [ $? -eq 0 ]; then  
        echo "make ctags database file with total time ($elapse) seconds"  
        size=$(du $cscopedb/tags -h | awk '{ printf $1 }')  
        echo "($cscopedb/tags):$size"  
    fi  
}  
  
usage()   
{  
    echo "Usages:"  
    echo "$0    cscope  : make cscope database only"  
    echo "      tags    : make ctags database only"  
    echo "      all : make two databases"  
}  
  
  
case $1 in  
    "cscope")  
    prepare  
    docscope  
    ;;  
  
    "tags")  
    prepare  
    dotags  
    ;;    
  
    "all")  
    prepare  
    docscope  
    dotags  
    ;;  
    "")  
    usage  
    ;;  
esac  
