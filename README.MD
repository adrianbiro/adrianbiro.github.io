# <https://biroadrian.com>

## <https://adrianbiro.github.io>

### TODOs

* favicon visibility in dark mode
* copyright

### Template

```yaml
+++
title = 'TODO'
summary = 'TODO 140 char long'
date = 2026-01-31T00:00:00-00:00
draft = false
tags = ['Technology', 'FinOps', 'CostOptimization', 'DigitalTransformation', 'Governance', 'CxOAgenda', 'ROI', 'CloudStrategy']
+++

{{< figure src="/posts/_images_files/TODO" title="TODO" alt="TODO" width="auto" >}}

```

### Get Tags

```bash
grep -oP '(?<=tags = \[).*(?=\])' --no-filename  -- content/posts/**/*.md |sed 's/, /\n/g' | sort --unique | column
```

### Get image links

```bash
grep -oP '(?<=figure src=").*?(?=" )' -- content/posts/**/*.md | cut -d: -f2 | sort -u
```

### Images to use

```txt
futuristic_city_beige.jpeg
nachman_chabad_ai.jpeg
```
