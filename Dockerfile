# syntax=docker/dockerfile:1
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Base build tools + Qt6 dev packages and QML modules
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    ninja-build \
    git \
    pkg-config \
    # Qt6 toolchain
    qt6-base-dev \
    qt6-base-dev-tools \
    qt6-declarative-dev \
    # QML modules commonly needed
    qml6-module-qtquick \
    qml6-module-qtquick-window \
    qml6-module-qtqml-workerscript \
    # Optional: helpful for debugging QML imports
    qml6-module-qtqml \
    && rm -rf /var/lib/apt/lists/*

# Set paths so QML imports resolve during build/test runs in the container
ENV QML_IMPORT_PATH=/usr/lib/x86_64-linux-gnu/qt6/qml
ENV QT_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt6/plugins

# Create a build user (optional; keeps files owned by non-root)
ARG USER=builder
ARG UID=1000
RUN useradd -m -u ${UID} ${USER}
USER ${USER}
WORKDIR /work

# Example build (uncomment if you want the image to build your project automatically):
# COPY . /work
# RUN cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
#     && cmake --build build

# To run GUI apps inside Docker you’ll need X/Wayland forwarding on the host,
# which is separate from building. This image focuses on building.