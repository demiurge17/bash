#! bin/bash

echo "Wanna make a password you won't remember? Y/N"

read response

if [ "$response" = "y" ]; then
	echo "How long? "

	read passwordLength

	if ! [[ $passwordLength =~ ^[0-9]+$ ]]; then
		echo "Length only has numbers. Input a number in digits!! "
		exit 1
	fi

	password=()

	for i in $(seq 1 3); do
		password+=("$(openssl rand -base64 48 | cut -c1-$passwordLength)")
	done

	echo "Here are your passwords: "
	printf "%s\n" "${password[@]}"

	echo "Do you want to save it? y/n"
	read response1

	if [ "$response1" = "y" ]; then
		for i in "${password[@]}"; do
		 printf "%s\n" "$password" | ccrypt -e >> password.txt.cpt
		done
	fi
fi
