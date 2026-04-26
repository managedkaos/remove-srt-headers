# remove-srt-headers

A Docker-based tool to remove the headers from an SRT file downloaded from Fireflies.ai. Using a container ensures consistent behavior across macOS (BSD tools) and Linux (GNU tools) environments.

## Docker Image

The image is published to GitHub Packages (GitHub Container Registry):

```
ghcr.io/managedkaos/remove-srt-headers:latest
```

## Usage

### Pull the image

```bash
docker pull ghcr.io/managedkaos/remove-srt-headers:latest
```

### Run against a single file

Mount the file into the container and pass its path as the argument:

```bash
docker run --rm -v $(pwd)/myfile.srt:/data/myfile.srt \
  ghcr.io/managedkaos/remove-srt-headers:latest /data/myfile.srt
```

### Run against all files in a directory

Mount the working directory and process a file by name:

```bash
docker run --rm -v $(pwd):/work -w /work \
  ghcr.io/managedkaos/remove-srt-headers:latest myfile.srt
```

### Shell alias (optional)

Add this to your `.bashrc` or `.zshrc` for a convenient shorthand:

```bash
alias clean-meeting='docker run --rm -v $(pwd):/work -w /work ghcr.io/managedkaos/remove-srt-headers:latest'
```

Then run:

```bash
clean-meeting myfile.srt
```

### Makefile wrapper (optional)

```makefile
CLEAN_IMG = ghcr.io/managedkaos/remove-srt-headers:latest

clean:
	@docker run --rm -v $(shell pwd):/work -w /work $(CLEAN_IMG) target_file.srt
```

## Building locally

```bash
docker build -t remove-srt-headers .
docker run --rm -v $(pwd)/myfile.srt:/data/myfile.srt remove-srt-headers /data/myfile.srt
```
