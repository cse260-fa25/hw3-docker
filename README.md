# CSE260 HW3 Docker
This repository contains the files necessary to build a Docker environment for the CSE260 Homework 3. The docker environment supports running `mpirun` with up to the number of processes available CPU cores on the host machine. This is intended to facilitate easy testing and development for the homework assignment. You will need to use other environments (expanse, pi-cluster) to run larger experiments.

## Setup
1. **Install Docker**: Make sure you have Docker Engine installed on your machine. If not installed, follow the instructions corresponding to your operating system:

    - **Linux**:
        For Linux, you can follow the official Docker Engine [installation guide](https://docs.docker.com/engine/install/).

    - **MacOS**:
        Docker Engine is available for macOS through Docker Desktop. Follow the official Docker Desktop [macOS installation guide](https://docs.docker.com/desktop/setup/install/mac-install/).

    - **Windows**:
        Docker Engine is available for Windows through Docker Desktop. Follow the official Docker Desktop [Windows installation guide](https://docs.docker.com/desktop/install/windows-install/).

Refer to the [installation documentation](https://docs.docker.com/engine/install) for your specific operating system. Note that on Windows and Mac, Docker Desktop is required instead of Docker Engine.

2. **Get the image**: You can either pull the pre-built image or build it yourself.

    - **Option 1: Pull the pre-built image**:
        ```bash
        docker pull ghcr.io/cse260-fa25/hw3-docker:latest
        ```

    - **Option 2: Build the image yourself**:
        ```bash
        git clone https://github.com/cse260-fa25/hw3-docker.git
        cd hw3-docker
        docker build -t cse260-hw3-docker .
        ```

## Usage
1. **Start a container**: Run the following command to start a Docker container with the CSE260 HW3 environment. Make sure to replace `<path_to_your_hw3_repository>` with the actual path to your local hw3 repository.

```bash
docker run --rm -it --name cse260-hw3-docker -v <path_to_your_hw3_repository>:/home/ubuntu/hw3 ghcr.io/cse260-fa25/hw3-docker:latest bash
```

> [!NOTE]
> If you built the image yourself, replace `ghcr.io/cse260-fa25/hw3-docker:latest` with `cse260-hw3-docker`.

2. **Develop and Test**: The container will start with a bash shell already set up for development. Your repository will be mounted at `/home/ubuntu/hw3` inside the container. You can now compile, debug, and run your MPI programs from this shell as needed. See the homework instructions for specific commands and usage.

> [!TIP]
> You can connect VSCode to the running container for a better development experience. See the [using VSCode](#using-vscode) section below for details.

## Using VSCode
To use VSCode with the Docker container, follow these steps:
1. Install the "Remote - Containers" extension in VSCode.
2. Start your Docker container as described in the Usage section.
3. In VSCode, open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P) and select "Remote-Containers: Attach to Running Container...".
4. Choose the container you started for CSE260 HW3.
5. You can now use VSCode to edit files, run terminals, and debug code directly inside the container.
