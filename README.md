# SDKMAN! docker action

This action installs "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

### `candidate`

**Required** The name of the person to greet. Default `"World"`.

### `version`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `time`

The time we greeted you.

## Example usage

uses: actions/sdkman-action@v1
with:
  candidate: java
  version: 15.0.0-amzn
