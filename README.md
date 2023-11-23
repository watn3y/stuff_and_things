
# stuff_and_things

A collection of stuff and things I come across:


### very good and special checksum command

recursively create checksum of all files in a directory while:

- excluding the checksum file itself from being hashed
- avoiding ./ in front of filenames
- sorting the list alphabetically


		find . -type f -not -name "checksum.sha256" -exec echo {} \; | cut -c 3- | sort | xargs -r -d '\n' sha256sum > checksum.sha256

[here's a script to do it recursivly](checksum_in_dirs.sh)
