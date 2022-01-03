ARG JULIA_VERSION=1
FROM arm64v8/julia:${JULIA_VERSION}

# This Dockerfile adds a non-root user with sudo access. Update the “remoteUser” property in
# devcontainer.json to use it. More info: https://aka.ms/vscode-remote/containers/non-root-user.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
#Add postcreate script and make it executable
RUN mkdir -p /julia-devcontainer-scripts
COPY ./postcreate.jl /julia-devcontainer-scripts
RUN chmod +x /julia-devcontainer-scripts/postcreate.jl
