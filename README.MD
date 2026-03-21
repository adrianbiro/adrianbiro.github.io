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
abstract_art/arvo_part/arvo-part-impressions-1.jpeg
abstract_art/arvo_part/arvo-part-impressions-2.jpeg
abstract_art/arvo_part/arvo-part-impressions-3.jpeg
abstract_art/arvo_part/arvo-part-impressions-4.jpeg
abstract_art/arvo_part/arvo-part-impressions-5.jpeg
abstract_art/arvo_part/arvo-part-impressions-6.jpeg
abstract_art/scifi-architecture/scifi-gothic-city-1.jpeg
abstract_art/scifi-architecture/scifi-gothic-city-2.jpeg
abstract_art/scifi-architecture/scifi-gothic-city-3.jpeg
abstract_art/scifi-architecture/scifi-gothic-city-4.jpeg
personas/english_african_hunter_safary.png
personas/romantic_era_hunter.png
personas/rusalka_pencil.png
personas/nachman_chabad_ai.jpeg
personas/man_sitting_hope.jpeg 
personas/man_sitting_reaching.jpeg
personas/man_squating_twist.jpeg
personas/man_running.jpeg
personas/woman_walking.jpeg
personas/woman_sitting.jpeg
personas/woman_sitting_sad.jpeg
personas/woman_arching.jpeg
personas/woman_kneeling_short_hair.jpeg
personas/woman_kneeling_longer_hair.jpeg
personas/woman_sitting_sad_detailed.jpeg
personas/two_long_hair_woman_sitting.jpeg 
personas/woman_sitting_dark_siluette.jpeg
personas/couple_park_dog.jpeg
personas/couple_park.jpeg
personas/woman_caffe.jpeg
personas/woman_1.jpeg
personas/woman_2.jpeg
personas/woman_3.jpeg
personas/man_1.jpeg
personas/man_2.jpeg
personas/man_3.jpeg
art_deco/art_deco_abstract_pencil.png
art_deco/art_deco_futuristic_street_pencil.png
art_deco/art_deco_high_gotic_fusion_charcoal.png
art_deco/art_deco_high_gotic_fusion_monochrome.png
art_deco/retro‑futuristic_art_deco_concept_city_pencil.png
art_deco/retro‑futuristic_art_deco_concept_city_sepia.png
art_deco/art_deco_future_2.jpg
art_deco/art_deco_future_3.jpg
art_deco/art_deco_future_4.jpg
art_deco/art_deco_future_5.jpg
art_deco/art_deco_future_6.jpg
art_deco/art_deco_future_7.jpg
art_deco/art_deco_future_8.jpg
art_deco/art_deco_future_9.jpg
art_deco/art_deco_future_10.jpg
art_deco/art_deco_future_11.jpg
art_deco/art_deco_future_12.jpg
nature/animals/ant.jpeg 
nature/animals/bee.jpeg 
nature/animals/bobcat.jpeg 
nature/animals/deer_dark.jpeg 
nature/animals/deer_light.jpeg 
nature/animals/deer_standng.jpeg 
nature/animals/fox.jpeg 
nature/animals/fox_sketch.jpeg 
nature/animals/mause.jpeg 
nature/animals/rabbit_sketch.jpeg
coat_of_arms/cloat_of_arms_lilac_bird.jpeg 
coat_of_arms/cloat_of_arms_lilac_bird_detailed.jpeg 
coat_of_arms/coat_of_ arms_helmet.jpeg 
coat_of_arms/coat_of_arms_owl_bees_roses.jpeg 
coat_of_arms/coat_of_arms_owl_lilac.jpeg
castles/castle.jpeg 
castles/castle_ruin.jpeg 
castles/castle_ruin_dark.jpeg 
castles/castle_ruin_dark_mist.jpeg
cubism/cubistic_caffe.jpeg
cubism/cubistic_caffe_square_1.jpeg
cubism/cubistic_caffe_square_2.jpeg
cubism/cubstic_square_people.jpeg
```
