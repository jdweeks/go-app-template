BIN        := ./bin
SRC        := ./...

GO         := /usr/bin/env go
DOCKER     := /usr/bin/env docker

TARGET 	   := $(BIN)/main

ALL 	   := clean install lint build test

.PHONY: $(ALL) clean pretty run

build:
	$(GO) build -o $(TARGET) $(SRC)

install:
	$(GO) get all

docker: 
	$(DOCKER) build .

clean:
	$(GO) clean; \
	$(RM) $(BIN)/*; \
	rmdir $(BIN) || true

run:
	$(GO) run $(SRC)

test:
	$(GO) test -v $(SRC)

pretty:
	$(GO) fmt $(SRC)

lint:
	$(GO) vet $(SRC)

tidy:
	$(GO) mod tidy

all: $(ALL)
