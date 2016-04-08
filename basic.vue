<template lang="jade">
.container
  p collapsible
  collapsible
    collapsible-entry
      p(slot="header") header1
      p body 1
    collapsible-entry
      p(slot="header") header2
      p body 2
    collapsible-entry
      p(slot="header") header3
      p body 3
  p accordion
  collapsible(accordion)
    collapsible-entry
      p(slot="header") header1
      p body 1
    collapsible-entry(is-active)
      p(slot="header") header2
      p body 2
    collapsible-entry
      p(slot="header") header3
      p body 3
  a(href="https://github.com/vue-comps/vue-collapsible/blob/master/dev/basic.vue") source
</template>

<script lang="coffee">
module.exports =
  components:
    "collapsible" : require "../src/collapsible.vue"
    "collapsible-entry" : require "../src/collapsible-entry.vue"

</script>

<style lang="stylus">
.container > a
  position absolute
  left 250px
  top 40px
.vc-collapsible
  border 1px solid black
  width 150px
  list-style-type: none
  padding 0
  div
    padding-left 30px
  .vc-collapsible-entry
    border-bottom 1px solid black
  .vc-collapsible-body
    border-top 1px dashed black
  .vc-collapsible-header
    cursor pointer
</style>
