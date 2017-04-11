#! /bin/bash
#: Title       :
#: Date        :
#: Author      : "Abdus Samad Khan" <khan.samad47@gmail.com>
#: Version     : 1.0
#: Description : Directory markers
#: Options     : {+[a-zA-Z],[a-zA-Z]}

JUMPDIR_MARKERS_FILE=$HOME/.jumpdir_data

if [ ! -f $JUMPDIR_MARKERS_FILE ]; then
    touch $JUMPDIR_MARKERS_FILE;
fi

declare -a JUMPDIR_MARKERS;

jd() {
    # Loading markers
    while read line
    do
        JUMPDIR_N=$(echo $line | awk '{print $1}')
        JUMPDIR_P=$(echo $line | awk '{print $2}')
        JUMPDIR_MARKERS[$JUMPDIR_N]=$JUMPDIR_P;
    done < $JUMPDIR_MARKERS_FILE

    if (( $# == 0 ))
    then
        printf "Markers:\n"
        for i in "${!JUMPDIR_MARKERS[@]}"; do
            key=$(printf %x "$i")
            printf "\x$key\t%s\n" "${JUMPDIR_MARKERS[$i]}"
        done;
        return 0;
    fi 
    if (( $# > 1 )) || [[ ! $1 =~ ^[+]?[a-z]$ ]]
    then
        echo "Usage: $FUNCNAME [+[a-z]] [[a-z]]";
        echo ""
        echo "Examples:"
        printf "%s %s\t%s\n" "$FUNCNAME" "+b" 
        "Stores PWD in marker b"
        printf "%s %s\t%s\n" "$FUNCNAME" " b" 
        "cd to marker b"
        printf "%s %s\t%s\n" "$FUNCNAME" " "  
        "list all markers currently set"
        return 1;
    fi 
    if [[ $1 =~ ^[+] ]]
    then
        mark=${1:1:1};
        val=$(printf '%d' "'$mark");
        JUMPDIR_MARKERS[$val]=${PWD};
        > $JUMPDIR_MARKERS_FILE
        for i in "${!JUMPDIR_MARKERS[@]}"; do
            echo "$i ${JUMPDIR_MARKERS[$i]}" >> $JUMPDIR_MARKERS_FILE 
        done;
        return 0;
    fi
    mark=${1:0:1};
    val=$(printf '%d' "'$mark");
    if [[ ${JUMPDIR_MARKERS[$val]+dummy} ]]
    then
        cd ${JUMPDIR_MARKERS[$val]}
        return 0;
    else
        echo "marker '$mark' not set"
        return 1;
    fi
}

