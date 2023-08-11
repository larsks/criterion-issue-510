SANITIZE = 0
CFLAGS += -g
VARIANT = ubuntu
IMAGE = criterion510-$(VARIANT)

ifeq ($(SANITIZE), 1)
CFLAGS += -fsanitize=address,undefined
LDFLAGS += -fsanitize=address,undefined
endif

all: test_example

run-test: clean test_example
	./test_example --verbose

run-test-in-container:
	docker run --rm -v $$PWD:/src -w /src $(IMAGE) make run-test SANITIZE=$(SANITIZE)

run-cmd-in-container:
	docker run --name criterion510 --rm -it -v $$PWD:/src -w /src $(IMAGE) $(CMD)

build-image: .build_$(VARIANT)

.build_$(VARIANT): Dockerfile.$(VARIANT) install-criterion.sh
	docker build -t $(IMAGE) -f Dockerfile.$(VARIANT) . && date > $@

test_example: test_example.o
	$(CC) $(LDFLAGS) -o $@ $< -lcriterion

clean:
	rm -f test_example test_example.o
