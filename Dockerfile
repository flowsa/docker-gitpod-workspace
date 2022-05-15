FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN brew install drud/ddev/ddev
RUN sudo apt-get update && sudo apt-get install -y xdg-utils tree rsync
