for FILE in *; do
    if [ -d "$FILE" ]; then
        cd "$FILE"
        echo "creating job in $FILE"
        find . -type f -not -name "checksum.sha256" -exec echo {} \; | cut -c 3- | sort | xargs -r -d '\n' sha256sum > checksum.sha256 &
        cd ..
    fi
done

while :
do
        clear
        echo CURRENT JOBS
        jobs
        sleep 1
done
