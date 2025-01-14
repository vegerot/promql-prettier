BUILD_TIME=$(shell date '+%Y-%m-%d_%H:%M:%S')
GIT_VERSION=$(shell git rev-parse --short HEAD)
GIT_BRANCH:=$(shell git rev-parse --abbrev-ref HEAD)

TARGET=promql-prettier

build:
	go build -o $(TARGET) -v -ldflags "-X main.BuildBranch=${GIT_BRANCH} -X main.BuildVersion=${GIT_VERSION} -X main.BuildTime=${BUILD_TIME}"

clean:
	rm $(TARGET)

build-wasm:
	GOOS=js GOARCH=wasm go build -o docs/main.wasm

serve:
	cd docs; python3 -m http.server
