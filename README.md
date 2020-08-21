# Run Tsunami on Docker
This is a Docker sample for run [google/tsunami-security-scanner](https://github.com/google/tsunami-security-scanner) .

## Quick Start
```
docker run --rm -v $(pwd)/output:/output -e SCAN_TARGET="<scan target ip>" kappa0923/tsunami-security-scanner:0.0.2
```
