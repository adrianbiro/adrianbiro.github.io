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
