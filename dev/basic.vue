<template lang="jade">
.container
  p collapsible
  collapsible
    collapsible-item
      p(slot="header") header1
      p body 1
    collapsible-item
      p(slot="header") header2
      p body 2
    collapsible-item
      p(slot="header") header3
      p body 3
  p accordion
  collapsible(accordion)
    collapsible-item
      p(slot="header") header1
      p body 1
    collapsible-item(is-active)
      p(slot="header") header2
      p body 2
    collapsible-item
      p(slot="header") header3
      p body 3
  a(href="https://github.com/vue-comps/vue-collapsible/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "collapsible" : require "../src/collapsible.vue"
    "collapsible-item" : require "../src/collapsible-item.vue"

</script>

<style lang="stylus">
.container > a
  position absolute
  left 250px
  top 40px
.collapsible
  border 1px solid black
  width 150px
  list-style-type: none
  padding 0
  div
    padding-left 30px
  .collapsible-item
    border-bottom 1px solid black
  .collapsible-body
    border-top 1px dashed black
  .collapsible-header
    cursor pointer
</style>
