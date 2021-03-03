This branch contains a simple hugo site for use as a callysto hub landing page.
There are two important branches. This one, which contains the hugo site itself
and one called hugo-gh-pages which contains the result of building this branch
with hugo. The two branches are connected by a GitHub action which will build
the gh-pages branch every time you push to this branch.

## Building/Developing

All you should need to build this site is a recent version of hugo. Anything
above v0.64.1 _should_ work.

The site is uses the
[syzygy-callysto](https://github.com/pimsmath/gohugo-theme-syzygy-callysto)
theme, which is a single-page theme built using widgets. The idea is that you
will provide widgets as markdown files under [/content/home](/content/home/)
which will correspond to layouts in the
[theme](https://github.com/pimsmath/gohugo-theme-syzygy-callysto/layouts/partials/widgets/).
These are combined to create the landing page. Most of the customization is done
in these files or the global [config file](./config.toml).

The site uses the [hugo module system](https://gohugo.io/hugo-modules/) to
collect the theme so after cloning this repository you should be able to preview
the site by running
```bash
hugo serve
```
hugo will collect any dependencies (the theme) and serve up a copy of the site.

In a few places you will notice jinja2 template variables. These are filled in
when the site is deployed via ansible in
[callysto-infrastructure](https://github.com/callysto/infrastructure) repo.
