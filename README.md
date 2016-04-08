# vue-collapsible

A simple collapsible / accordion

### [See it in action](https://vue-comps.github.io/vue-collapsible)

# Install

```sh
npm install --save-dev vue-collapsible/
```
or include `build/bundle.js`

## Usage
```coffee
# in your component
components:
  "collapsible": require("vue-collapsible/collapsible")
  "collapsible-entry": require("vue-collapsible/collapsible-entry")
# or, when using bundle.js
components:
  "collapsible": window.vueComps.collapsible
  "collapsible-entry": window.vueComps.collapsibleEntry
```

For examples see `dev/`

#### Props
Collapsible

| Name | type | default | description |
| ---:| --- | ---| --- |
| accordion | Boolean | false | only one child opened at a time |

Collapsible-entry

| Name | type | default | description |
| ---:| --- | ---| --- |
| is-active | Boolean | false | (two-way) is child opened |
| fade-in | function | no animation | used to animate the child. Arguments: `{el}` |
| fade-out | function | no animation | used to animate the child. Arguments: `{el}` |

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
