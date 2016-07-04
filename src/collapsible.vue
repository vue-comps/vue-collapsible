// out: ..
<template lang="pug">
ul(
  :class="[class]"
  )
  slot No content
</template>

<script lang="coffee">
module.exports =

  props:
    "transitionIn":
      type: Function
      default: ({cb}) -> cb()
    "transitionOut":
      type: Function
      default: ({cb}) -> cb()
    "accordion":
      type: Boolean
      default: false
    "class":
      type: String
      default: "collapsible"
    "itemClass":
      type: String
      default: "collapsible-item"
    "headerClass":
      type: String
      default: "collapsible-header"
    "bodyClass":
      type: String
      default: "collapsible-body"

  methods:
    closeAll: (sender) ->
      for child in @$children
        if child.isCollapsibleItem and not child.stayOpen
          child.close(sender)
</script>
