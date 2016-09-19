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
##### Collapsible

Name | type | default | description
---:| --- | ---| ---
accordion | Boolean | false | only one child opened at a time
transition | String | "collapsible" | name of a vue transition. [Detailed description](#transition)
class | String / Object / Array | [`collapsible`] | class of the `ul`
item-class | String | `collapsible-item` | class of the `li`
header-class | String | `collapsible-header` | class of the header `a`
body-class | String | `collapsible-body` | class of the body `div`
no-scroll | Boolean | false | disable scroll to top, on open of an item with accordion
scroll-transition | Function | `(diff) -> window?.scrollBy?(0,diff)` | function which gets used for scrolling item back into view on opening.

##### Collapsible-item

Name | type | default | description
---:| --- | ---| ---
transition | String | (inherit from `collapsible`) | name of a vue transition. [Detailed description](#transition)
is-opened | Boolean | false | (two-way) is child opened
stay-open | Boolean | false | (only with accordion) will stay open

#### Events on collapsible-item

Name | description
---:| ---
before-enter | will be called before open animation
after-enter |  will be called when opened
before-leave |  will be called before close animation
after-leave |  will be called when closed
toggled(isOpened:Boolean) | emitted when gets opened or closed. Alternative to use two-way `is-opened` prop

#### Transition

You can provide a vue transition like this:
```js
Vue.transition("fade",{
  // your transition
})
// or in the instance:
transitions: {
  fade: {
    // your transition
  }
}
// usage:
template: "<collapsible transition='fade'>" +
    "<collapsible-item></collapsible-item>" +
    "<collapsible-item transition='fade2'></collapsible-item>" +
  "</collapsible>"
// the first item will use fade and the second fade2
```

## Changelog
- 1.1.0  
scroll bugfix  
set default transition  

- 1.0.1  
changed how scroll works  

- 1.0.0  
changed header type from `div` to `a`  
now using vue transitions  
events are renamed after vue transitions  
added toggled event  
using `vue-mixins/class` to merge class on `collapsible` and `collapsible-item`  
added scroll to top and `no-scroll`, `scroll-transition` props

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
