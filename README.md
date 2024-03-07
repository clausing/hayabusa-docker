# Hayabusa-docker

Run hayabusa (https://github.com/Yamato-Security/hayabusa) in a docker container on evtx files already in 
a given directory that will be passed to the container via `-v`
Obviously, `-l` will not be useful in this situation

# Usage

This docker image will run `hayabusa` from the container, the evtx files will need to be in directories passed via `-v` and if you wish to output
results to a file the directory into which it is written must also be passed via `-v`.

`docker run -it --rm -v $(pwd):/data clausing/hayabusa`
