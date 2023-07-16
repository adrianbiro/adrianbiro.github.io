# Github Pages Troubleshooting
{% raw %}

In failed deploy job.
```
github-pages 228 | Error:  Liquid syntax error (line 8): Variable '{{"ProductKey", Int64.Type}' was not properly terminated with regexp: /\}\}/
```
[Troubleshooting Jekyll Build Errors](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/troubleshooting-jekyll-build-errors-for-github-pages-sites)

[Fix](https://github.com/alshedivat/al-folio/discussions/864#discussioncomment-3543060) go to repo `Settings` -> `Pages` and select the branch as `None`. Make a small change and push your code again. This would trigger a build and it should succeed this time. You should see the `gh-pages` branch now. So, go back and select the `gh-pages`.

Or in `Settings`, `Pages`, `Build and deployment`, `Source`: `Github Actions (beta)`

Add [`Liquid raw`](https://www.digitalocean.com/community/tutorials/jekyll-escaping-liquid-tags) tags.
{% endraw %}
