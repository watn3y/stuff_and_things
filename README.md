
# stuff_and_things

A collection of stuff and things I come across:


## very good and special checksum command

recursively create checksum of all files in a directory while:

- excluding the checksum file itself from being hashed
- avoiding ./ in front of filenames
- sorting the list alphabetically


      find . -type f -not -name "checksum.sha256" -exec echo {} \; | cut -c 3- | sort | xargs -r -d '\n' sha256sum > checksum.sha256

[here's a script to do it recursivly](checksum_in_dirs.sh)


## unnecessarily compressed 7z archive

    7zzs a -mx=9 -myx=9 -ms=on -slp -mmt=on archive.7z src/

**a** - add to archive mode

**-mx=9** - sets compression level to max

**-myx=9** - sets file analysis level to max

**-ms=on** - sets archive to solid block mode (you need to decompress the whole archive to access a single file)

**-slp** - set large memory pages mode. improves compression for archives over 100mb


#### about memory usage
**-mmt=on** - enable multithreading, alternatively replace "on" with the number of threads you want

**(optional)** 

**-sdel** - delete source files after archiving

**-mmemuse=60p** - set memory limit to 60%

**-mmemuse=5g** - set memory limit to 5 GiB


I recommend setting **-mmt=on** and **-mmemuse** to whatever you want. 7z will use as many cores as possible with the memory limit you set. The default memory limit is 80%.

Keep in mind that using more than one thread for compression is less efficient but usually not worth the tradeoff in speed.
