docker-bower
============

Develop [Bower](http://bower.io) projects without installing bower.  This 
repository is used to create a Dockerfile that can be used with Continuous 
Integration tooling to support legacy applications that still use Bower to 
manage their JavaScript dependencies. 

About Bower
-----------

[Bower](http://bower.io) is a dependency management tool that was once a popular 
way to install JavaScript dependencies in web applications.  While Bower is no 
longer widely used for active projects, there are more than a few age-ed 
applications that still use Bower.


Run from Docker Hub
-------------------

A pre-built image is available on [Docker Hub](https://hub.docker.com/r/jobtarget/ci-bower). 
It can be run as follows:

1. Make sure you have your [Bower](http://bower.io)-based project in a directory like `/path/to/my-project`, and it contains the file `/path/to/my-project/bower.json`
2. Run a docker container from that image, and map `/path/to/my-project` into that container (_replace `/path/to/my-project` with the path to your project_).

   ```bash
   docker run -v "/path/to/my-project:/home/bower/workspace" jobtarget/ci-bower
   ```

This container will run `bower install` in non-interactive mode and exit.  
That's it.

Build from Source
-----------------

1. Make sure [Docker](https://www.docker.com) is installed.

2. Check out _docker-bower_ from [GitHub](https://github.com/jobtarget/docker-bower)

   ```bash
   git clone https://github.com/jobtarget/docker-bower.git
   ```
3. Build the docker image

   ```bash
   cd docker-bower
   docker build -t="jobtarget/ci-bower" .
   ```
