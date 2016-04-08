# collapsible

A simple collapsible / accordion

### [See it in action](https://vue-comps.github.io/collapsible)

# Install

```sh
npm install --save-dev collapsible
```
or include `build/bundle.js`

## Usage
```coffee
# in your component
components:
  "collapsible": require("collapsible")
  "collapsible-entry": require("collapsible-entry")
# or, when using bundle.js
components:
  "collapsible": window.vueComps.collapsible
  "collapsible-entry": window.vueComps.collapsibleEntry
```
#### Props
Collapsible

| Name | type | default | description |
| ---:| --- | ---| --- |
| accordion | Boolean | false | only one child opened at a time |

Collapsible-entry

| Name | type | default | description |
| ---:| --- | ---| --- |
| is-active | Boolean | false | (two-way) is child opened |
| fadeIn | function | no animation | used to animate the child. Arguments: `{el}` |
| fadeOut | function | no animation | used to animate the child. Arguments: `{el}` |

# Development
Clone repository
```sh
npm install
npm run dev
```
Browse to `http://localhost:8080/`

## License
Copyright (c) 2016 Paul Pflugradt
Licensed under the MIT license.
