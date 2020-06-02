#!/bin/bash

allowed_numbers_max=
current_folder=$(pwd) 

if [[ -n "$1" ]]; then
    echo "You have executed script with following param [folder]: $1"
    if [[ -d "$1" ]]
        then
            echo "[folder] $1 exists on your filesystem."
            current_folder=$1
    fi
fi

declare -a arrKubeconfigs
arrKubeconfigs=()

for file in $current_folder/*.kubeconfig
do
    arrKubeconfigs=(${arrKubeconfigs[*]} "$file")
done

list_size="${#arrKubeconfigs[@]}"

if (($list_size == 0)); then
    echo "Current directory does not contains any kubeconfig files."
elif [ "${arrKubeconfigs[0]}" == "$current_folder/*.kubeconfig" ]; then
    echo "Current directory does not contains any kubeconfig files."
else
    echo "There are $list_size kubeconfig files in current folder"
    for ((i = 0 ; i < $list_size ; i++)); do
        echo "Type $i for - ${arrKubeconfigs[$i]}"
    done

    read -p "Please type here file number :" file_number 

    re='^[0-9]+$'
    if ! [[ $file_number =~ $re ]] ; then
       echo "Please enter only numbers here" 
    elif (($file_number >= 0 && $file_number < list_size)); then
      selected_kubeconfig=${arrKubeconfigs[$file_number]}

        echo "Following kubeconfig: $selected_kubeconfig will be set as active one."

        prompt_token=$(echo $selected_kubeconfig | awk 'BEGIN{FS="[-]"}; {print $3"-"$4"-"$5}')
        # Setup prompt color and token to disply in shell
        PS1='\[\033[01;33m\]\u@\W\[\033[00m\]\[\033[01;34m\]($prompt_token)\[\033[00m\]:'
            
        # Export $KUBECONFIG
        export KUBECONFIG=$selected_kubeconfig

        [ $? -eq 0 ] && echo "Script has been finished." || echo "RC: $? (Failed)"

    else
        allowed_numbers_max=$(( $list_size - 1 ))
        echo "Please select file number from range 0 and $allowed_numbers_max."
    fi
fi
# reset array list
arrKubeconfigs=()


