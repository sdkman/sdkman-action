# SDKMAN! docker action

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
- uses: sdkman/sdkman-action@v1-preview
  with:
    candidate: java
    version: 15.0.0-amzn
- uses: actions/setup-java@v1
    id: setup-java
    with:
      java-version: 15.0.0
      jdkFile: ${{ github.workspace }}/.sdkman/archives/${{ steps.sdkman.outputs.file }}
- run: java --version
```
