# SDKMAN! docker action

This action installs any `candidate` via [sdkman](https://sdkman.io/).

## Inputs

### `candidate`

**Required** The name of the candidate to install.

### `version`

**Required** The version of the candidate to install.

## Outputs

N/A

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
      jdkFile: ${{ github.workspace }}/.sdkman/archives/java-15.0.0-amzn.zip
- run: java --version
```
