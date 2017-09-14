#!/bin/bash

pattern='<option name="x" value="'
new_value="${pattern}0\" />"
search_file='.idea/workspace_tmp.xml'

if [ ! -f "$search_file" ]; then
    echo "File '${search_file}' does not exist."
    exit 1
fi

search=$(grep "$pattern" $search_file | sed 's/^ *//g')
echo "              Found: $search"
echo "Will be replaced to: $new_value"

old=$(echo $search    | sed 's/\//\\\//g')
new=$(echo $new_value | sed 's/\//\\\//g')

# echo 'Old:' $old
# echo 'New:' $new

sed 's/'"$old"'/'"$new"'/g' -i $search_file

echo ""
echo "Check the new code:"
echo ""

grep --color=auto -a1 "$new_value" $search_file


