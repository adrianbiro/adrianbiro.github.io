# Docker-Compose

## Combine `docker-compose` with an undockerized python app

```sh
#!/bin/bash
docker-compose -f services/docker-compose.yml up --build -d
if [[ ! -d /tmp/venv ]]; then
    echo "Creating venv in /tmp/venv"
    python3 -m venv /tmp/venv
fi
source /tmp/venv/bin/activate
pip install -r /src/requirements.txt

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:9070/health)" != "200" ]]; do
    sleep 5
    echo "waiting for service to come online"
done

python3 /src/main.py && \
  docker-compose -f services/docker-compose.yml down
```
