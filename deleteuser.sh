#!/bin/bash
PREFIX=$1
START=0  ## start line number
END=$( awk -F':' '{ print $1}' /etc/passwd | grep ^"$PREFIX" -c )  ## find the result line count
i=$START
e=$END-1
while [[ $i -le $e ]]  ## for loop to delete user.
do
    user_delete=$( awk -F':' '{ print $1}' /etc/passwd | grep ^"$PREFIX" | head -n 1 )  ## Find the first user that the match prefix condition. e.g. ^cps1XXX, ^cps2XXX, etc.
    echo The user is "$user_delete".
    userdel -r $user_delete
    echo "$user_delete" be deleted.
    ((i = i + 1))
done
echo Delete user completed.
