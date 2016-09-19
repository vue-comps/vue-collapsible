// out: ..
<template lang="pug">
ul(
  :class="computedClass"
  )
  slot
</template>

<script lang="coffee">
module.exports =
  mixins: [
    require("vue-mixins/class")
    require("vue-mixins/transition")
  ]
  props:
    accordion:
      type: Boolean
      default: false
    class:
      default: -> ["collapsible"]
    itemClass:
      type: String
      default: "collapsible-item"
    headerClass:
      type: String
      default: "collapsible-header"
    bodyClass:
      type: String
      default: "collapsible-body"
    noScroll:
      type: Boolean
      default: false
    scrollTransition:
      type: Function
      default: (top) -> window?.scrollBy?(0,top)
    transition:
      type: String
      default: "collapsible"

  methods:
    closeAll: (sender) ->
      beforeSender = false
      for child, index in @$children
        if sender == child
          beforeSender = true
          continue
        if child.isCollapsibleItem and not child.stayOpen
          child.close(not beforeSender)
</script>
