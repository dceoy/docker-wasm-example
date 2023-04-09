# syntax=docker/dockerfile:1
FROM scratch
ADD main.wasm /main.wasm
ENTRYPOINT ["/main.wasm"]
