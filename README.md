# SDKMAN! action

This action installs any `candidate` via [sdkman](https://sdkman.io/).

## Inputs

### `candidate`

**Required** The name of the candidate to install.

### `version`

**Required** The version of the candidate to install.

## Outputs

### `file`

Filename of the downloaded archive.

## Example usage

```yaml
- uses: sdkman/sdkman-action@master
  id: sdkman
  with:
    candidate: java
    version: 19.0.1-tem
- uses: actions/setup-java@v1
  id: setup-java
  with:
    java-version: 19.0.1
    jdkFile: ${{ steps.sdkman.outputs.file }}
- run: java --version
```
