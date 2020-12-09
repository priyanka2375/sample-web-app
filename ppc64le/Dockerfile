FROM registry.gitlab.com/skanekar/sample-web-app/ubuntu:latest-ppc
RUN uname -a; dpkg --configure -a; apt update -y
CMD echo "Hello World from a container running on $(uname -m)"