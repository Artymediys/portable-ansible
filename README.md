# Portable-Ansible
To build the image with **Ansible**, you need to have **Docker** installed.  
The base image is `alt:p10` **(AltLinux 10)**.

## Image Contents
List of packages installed from the `AltLinux 10` repository:
- `glibc`
- `openssh`
- `sshpass`
- `python3`
- `python3-module-pip`

List of packages installed using `pip3`:
- `ansible`
- `jmespath`
- `psycopg2-binary`

List of packages installed using `ansible-galaxy`:
- `community.general`
- `community.postgresql`

## Building the Image and Pushing to Registry
There are 3 files in the current repository:
- `Dockerfile` – code for subsequent image building
- `build_and_push.sh` – script for building and pushing the built image to the specified registry
- `entrypoint.sh` – code for checking the container launch option

At the beginning of the `build_and_push.sh` script, there is a section with variables that need to be set for the script to run correctly:
- `IMAGE_NAME`
- `REGISTRY_URL`
- `LOGIN`
- `PASSWORD`

You can also build the image without pushing to the registry using the command `docker build -t ansible-alt10 .`

## Running and Working with the Image
The image supports two modes of interaction:
- **interactive** – after launching, you can freely execute any commands in the container environment
- **automatic** – immediately execute the specified command

To run the container in interactive mode from the built image, execute the following command: `docker run -it --name portable-ansible ansible-alt10`

There is also an option to run the container once with directory mounting:
`docker run -it --rm -v /path/to/your/local/directory:/path/in/container ansible-alt10`

To run the container in automatic mode, add the desired command and arguments (if necessary) to the end of the previous example:
`docker run -it --rm -v /path/to/your/local/directory:/path/in/container ansible-alt10 ansible-playbook --version`

_P.S. In automatic mode, you can omit the `-it` flag, but using this flag allows Docker to create an interactive terminal session inside the container, which can be useful for improving the readability of command output._

You can exit interactive mode and stop the container by pressing: `Ctrl + D`
