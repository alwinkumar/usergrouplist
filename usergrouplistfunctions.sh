#list of functions for the script usergrouplist



function listoutusersingroup(){

  GID_THIS="$1"
  TMP1="$(printf "group_this=(\"\${group_%s[@]}\")" "$GID_THIS")"
  declare -a $TMP1

  #total of items
  printf "%s\t" "${#group_this[@]}"

  if [ "$2" = "" ] || [ "$2" = "1" ] || [ "$2" = "3" ]; then
    #list of names in one line
    printf "%s, " "${group_this[@]}"
    #remove last comma
    printf "\b\b "
  fi
  printf "\n"
  if [ "$2" = "2" ] || [ "$2" = "3" ]; then
    #can be used to loop through each member to execute further commands
    #printf "\n"
    for i in "${!group_this[@]}"; do
      K=$(( $i + 1 ))
      printf "\t\t%s\t%s\n" "$K" "${group_this[$i]}"
    done
  fi
}
