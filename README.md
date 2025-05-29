# Michael Soh - Resume Webpage

[![Jekyll Site Build](https://github.com/sohmc/sohmc.github.io/actions/workflows/jekyll-build.yaml/badge.svg)](https://github.com/sohmc/sohmc.github.io/actions/workflows/jekyll-build.yaml)

Are you sure you want to be viewing the code?  Or did you mean to see [the website](https://sohmc.github.io)?

## Welcome!

I am using the following open-source assets to build my site:

- Github Actions [modern resume theme](https://github.com/sproogen/modern-resume-theme) by [@sproogen](https://github.com/sproogen)
- [Reactive Resume builder](https://rxresu.me/)

Within the `.github/workflows` folder, you'll find the necessary scripts and `jq` filters to parse the JSON file created by Reactive Resume builder to produce this theme.  Unfortunately, neither Reactive Resume builder nor the modern resume theme support [resumejson.com](https://resumejson.org/) schema so I've had to build a very quick-and-dirty converter.

For those who are interested there are [Github Actions compatible themes available](https://jsonresume.org/projects) but you'll need to either convert the json like I did or find a resume builder that exports it.


# Licenses

All code located within the `.github` and `.ci` directories are released under the AGPL 3 license.

My profile picture stored in `images/profile.jpg` as well plain text stored within markdown files and configuration files are leased under the [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) license.

