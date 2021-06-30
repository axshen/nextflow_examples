# Nextflow tutorials

Learning `nextflow` through examples. It appears to be a great tool for orchestrating data processing pipelines that can be run via `bash` commands on a variety of computing resources.

## Examples

* [channelToString](channelToString/): Takes files from a `Channel.fromPath()` command and generates a string with filenames separated by a space.
* [collect](collect/): Takes a channel of values and collects the content in different processes. 
* [emitFromParams](emitFromParams/): Test tat information passed as parameters at runtime can be viewed.
* [fromFile](fromFile/): Use a python file as part of the nextflow execution (DSL 1).
* [params](params/): 
* [paramsToPython](paramsToPython/): Pass parameters to python.
* [simplePython](simplePython/): Execute some python code as part of a nextflow process.
* [stringToList](stringToList/): Split a string of comma separated values into a list.
* [withDocker](withDocker/): Use a docker image for the execution environment.

## Other files

* [data](data/): folder with some sample data.