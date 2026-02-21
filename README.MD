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
tolkien/elven_futuristic_city_pencil.png
tolkien/minas_tirith_abstract_night_carcoal.jpeg
tolkien/minas_tirith_charcoal.jpeg
tolkien/moorgoth_ink_sketch.jpeg
personas/english_african_hunter_safary_art_nouveau_pencil.png
personas/english_african_hunter_safary.png
personas/romantic_era_hunter.png
personas/rusalka_pencil.png
personas/nachman_chabad_ai.jpeg
personas/man_sitting_sad.jpeg
personas/man_sitting_hope.jpeg 
personas/man_sitting_reaching.jpeg
personas/man_squating_twist.jpeg
personas/man_running.jpeg
personas/woman_walking.jpeg
personas/woman_sitting.jpeg
personas/woman_sitting_sad.jpeg
personas/woman_arching_detailed.jpeg
personas/woman_arching.jpeg
personas/woman_kneeling_short_hair.jpeg
personas/woman_kneeling_longer_hair.jpeg
personas/woman_sitting_sad_detailed.jpeg
personas/two_sad_womans_sitting.jpeg
personas/two_long_hair_woman_sitting.jpeg 
personas/two_long_hair_woman_sitting_sad.jpeg 
personas/two_long_hair_woman_sitting_looking_at_me.jpeg 
personas/woman_sitting_dark_siluette.jpeg
art_deco/art_deco_abstract_cross‑hatching_sepia.png
art_deco/art_deco_abstract_pencil.png
art_deco/art_deco_futuristic_street_pencil.png
art_deco/art_deco_high_gotic_fusion_charcoal.png
art_deco/art_deco_high_gotic_fusion_monochrome.png
art_deco/retro‑futuristic_art_deco_concept_city_pencil.png
art_deco/retro‑futuristic_art_deco_concept_city_sepia.png
nature/animals/ant.jpeg 
nature/animals/bee.jpeg 
nature/animals/bobcat.jpeg 
nature/animals/deer_dark.jpeg 
nature/animals/deer_light.jpeg 
nature/animals/deer_standng.jpeg 
nature/animals/fox.jpeg 
nature/animals/fox_sketch.jpeg 
nature/animals/mause.jpeg 
nature/animals/raabbit.jpeg c
nature/animals/rabbit_sketch.jpeg
coat_of_arms/cloat_of_arms_lilac_bird.jpeg 
coat_of_arms/cloat_of_arms_lilac_bird_asymmetric.jpeg 
coat_of_arms/cloat_of_arms_lilac_bird_detailed.jpeg 
coat_of_arms/coat_of_ arms_helmet.jpeg 
coat_of_arms/coat_of_arms_owl_bees_roses.jpeg 
coat_of_arms/coat_of_arms_owl_lilac.jpeg
```
