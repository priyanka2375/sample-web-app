FROM ppc64le/debian:latest
RUN uname -a; dpkg --configure -a; apt update -y
CMD echo "Hello World from a container running on $(uname -m)"