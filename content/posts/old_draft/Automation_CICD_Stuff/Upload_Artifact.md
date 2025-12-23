+++
title = 'Upload Artifact'
date = 2023-01-15T09:00:00-07:00
draft = true
tags = ['tar', 'automation CI/CD stuff']
+++
# Upload Artifact

```bash
#!/bin/bash
chmod -c -R +rX "$INPUT_PATH" | while read -r file; do
    echo "Invalid file permissions fixed for: $file"
done
tar \
    --dereference --hard-dereference \
    --directory "$INPUT_PATH" \
    --create --verbose \
    --file "$RUNNER_TEMP/artifact.tar" \
    --exclude=.git \
    --exclude=.github \
    "${PWD}"
```
