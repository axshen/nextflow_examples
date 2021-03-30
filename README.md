# Nextflow tutorials

Learning `nextflow` through examples. It appears to be a great tool for orchestrating data processing pipelines that can be run via `bash` commands. 

### simplePython

A pipeline that runs some small Python code. Takes some integer argument and performs a calculation on it. Output to `stdout`.

### fromFile

Runs a Python script that takes a file as the first argument. It will read the file and do some calculations. 

<!-- Will it do these calculations in parallel? -->

### withDocker

Call a docker image to do some processing. Allows users to provide an argument. In this example we just copy the Python script from before into an image that is run as a container.