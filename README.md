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

```yaml
- uses: actions/sdkman-action@v1
  with:
    candidate: java
    version: 15.0.0-amzn
- uses: actions/setup-java@v1
    id: setup-java
    with:
      java-version: 15.0.0
      jdkFile: ${{ github.workspace }}/.sdkman/archives/java-15.0.0-amzn.zip
- run: java --version
```
