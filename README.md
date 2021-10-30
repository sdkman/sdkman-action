# SDKMAN! action

This action installs any `candidate` via [sdkman](https://sdkman.io/).

## Inputs

### `candidate`

**Required** The name of the candidate to install.

### `version`

**Required** The version of the candidate to install.

## Example usage

```yaml
- uses: sdkman/sdkman-action@master
  id: sdkman
  with:
    candidate: java
    version: 15.0.0-amzn
- run: java --version
```
