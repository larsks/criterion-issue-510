This repository reproduces the problem described in [Criterion issue #510][510].

[510]: https://github.com/Snaipe/Criterion/issues/510

## Running the test in an Ubuntu 22.04 container

This is expected to fail.

```
make VARIANT=ubuntu build-image run-test-in-container
```

To enable the GCC address sanitizer:

```
make VARIANT=ubuntu SANITIZE=1 build-image run-test-in-container
```

## Running the test in a Fedora 38 container

This is expected to succeed.

```
make VARIANT=fedora build-image run-test-in-container
```

To enable the GCC address sanitizer:

```
make VARIANT=fedora SANITIZE=1 build-image run-test-in-container
```

## Running the test locally

Outcome depends on your local environment.

```
make run-test
```
