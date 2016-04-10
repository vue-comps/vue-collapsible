# vue-collapsible

A simple collapsible / accordion.

### [Demo](https://vue-comps.github.io/vue-collapsible)

# Install

```sh
npm install --save-dev vue-collapsible/
```
or include `build/bundle.js`.

## Usage
```coffee
# in your component
components:
  "collapsible": require("vue-collapsible/collapsible")
  "collapsible-item": require("vue-collapsible/collapsible-item")
# or, when using bundle.js
components:
  "collapsible": window.vueComps.collapsible
  "collapsible-item": window.vueComps.collapsibleItem
```
```html
<collapsible>
  <collapsible-item>
    <h4 slot="header">header1</h4>
    <p>body 1</p>
  </collapsible-item>
  <collapsible-item>
    <h4 slot="header">header21</h4>
    <p>body 2</p>
  </collapsible-item>
</collapsible>
```
For examples see [`dev/`](https://github.com/vue-comps/vue-collapsible/tree/master/dev).

#### Props
Collapsible

| Name | type | default | description |
| ---:| --- | ---| --- |
| accordion | Boolean | false | only one child opened at a time |
| class | String | collapsible | class of the `ul`|

Collapsible-item

| Name | type | default | description |
| ---:| --- | ---| --- |
| is-opened | Boolean | false | (two-way) is child opened |
| transition-in | function | no animation | used to animate the child. Arguments: `{el}` |
| transition-out | function | no animation | used to animate the child. Arguments: `{el}` |
| item-class | String | collapsible-item | class of the `li`|
| header-class | String | collapsible-header | class of the header `div`|
| body-class | String | collapsible-body | class of the body `div`|

# Development
Clone repository.
```sh
npm install
npm run dev
```
Browse to `http://localhost:8080/`.

## License
Copyright (c) 2016 Paul Pflugradt
Licensed under the MIT license.
