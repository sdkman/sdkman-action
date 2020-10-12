# SDKMAN! docker action

This action installs any `candidate` via [sdkman](https://sdkman.io/).

## Inputs

### `candidate`

**Required** The name of the candidate to install.

### `version`

**Required** The version of the candidate to install.

### `platform`

**Optional** The version of the candidate to install. For example, for candidates like `java` this is required.

## Outputs

### `file`

Filename of the downloaded archive.

## Example usage

```yaml
- name: Print info
    id: server
    run: |
      echo ::set-output name=uname::$(uname)
- uses: sdkman/sdkman-action@master
  id: sdkman
  with:
    candidate: java
    version: 15.0.0-amzn
    platform: Linux
- uses: actions/setup-java@v1
    id: setup-java
    with:
      java-version: 15.0.0
      jdkFile: ${{ github.workspace }}/${{ steps.sdkman.outputs.file }}
- run: java --version
```
