# Guix-Pack-Factory

**Guix Pack Factory** is a Debian-based containerized build system that allows you to create specialized and reproducible Guix Docker images.

- Reproducible builds with `guix time-machine` based on specific channel information
- Build any Guix packages via a manifest

## Quick Start

### Requirements
- Docker 
- Git
### 1. Clone the repository
```bash
git clone https://github.com/user2595/guix-pack-factory.git
cd guix-pack-factory
```
### 2. Build the factory image
```bash
docker build -f Dockerfile.guix-pack-factory -t guix-pack-factory .
```
### 3. Prepare the workspace folder
```bash
mkdir workspace
cp example-manifest.scm workspace/manifest.scm
cp example-channels.scm workspace/channels.scm
```
### 4. Create a new Guix image
> Note: The current setup still requires a *privileged* container so that Guix can create its own sandbox namespaces; a less privileged variant is under development.
```bash
docker run -it --rm --privilged -v $(pwd)/workspace:/workdir guix-pack-factory ./build-guix-image.sh
```
This creates `workspace/guix-container-tools.tar.gz`.
### 5. Use the generated image
```bash
docker load < workspace/guix-container-tools.tar.gz
docker run -it --rm -v $(pwd)/new-workspace:/workdir <image-id> bash
```
