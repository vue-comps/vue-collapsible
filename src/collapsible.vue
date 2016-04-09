// out: ..
<template lang="jade">
ul(:class="[class]")
  slot No content
</template>

<script lang="coffee">
module.exports =
  props:
    "accordion":
      type: Boolean
      default: false
    "class":
      type: String
      default: "collapsible"
  methods:
    closeAll: ->
      @$broadcast "close"
  events:
    beforeOpen: (sender) ->
      if @accordion
        @$broadcast "close", sender
      return true
    beforeClose: -> true
    opened: -> true
    closed: -> true
</script>
