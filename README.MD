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

tolkien/elven_futuristic_city_pencil.png
tolkien/minas_tirith_abstract_night_carcoal.jpeg
tolkien/minas_tirith_charcoal.jpeg
tolkien/moorgoth_ink_sketch.jpeg
personas/english_african_hunter_safary_art_nouveau_pencil.png
personas/english_african_hunter_safary.png
personas/romantic_era_hunter.png
personas/rusalka_pencil.png
personas/nachman_chabad_ai.jpeg
nature/early_romantic_english_park_detailed.png
nature/early_romantic_english_park_quick_sketch.png
nature/early_romantic_english_park_ruins_animals.png
art_deco/art_deco_abstract_collor.png
art_deco/art_deco_abstract_cross‑hatching_sepia.png
art_deco/art_deco_abstract_pencil.png
art_deco/art_deco_futuristic_street_pencil.png
art_deco/art_deco_high_gotic_fusion_charcoal.png
art_deco/art_deco_high_gotic_fusion_monochrome.png
art_deco/retro‑futuristic_art_deco_concept_city_pencil.png
art_deco/retro‑futuristic_art_deco_concept_city_sepia.png
```
