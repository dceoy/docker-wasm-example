docker-wasm-hello-go
====================

Example of Docker+Wasm (Beta)

Usage
-----

1.  Turn on the [containerd image store](https://docs.docker.com/desktop/containerd/) feature.

2.  Build a WASM file.

    ```sh
    $ docker container run \
        --rm -v ${PWD}:/wd -w /wd --entrypoint=/bin/sh golang:latest \
        -c 'GOOS=js GOARCH=wasm go build -o main.wasm main.go'
    ```


2.  Build the image specifying the wasi/wasm32 architecture.

    ```sh
    $ docker buildx build \
        --platform wasi/wasm32 -t wasm-hello-go .
    ```

3.  Run the container.

    ```sh
    $ docker container run \
        --rm --runtime=io.containerd.wasmedge.v1 --platform=wasi/wasm32 \
        wasm-hello-go
    ```
