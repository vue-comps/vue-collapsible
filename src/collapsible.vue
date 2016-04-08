// out: ..
<template lang="jade">
ul.vc-collapsible
  slot No content
</template>

<script lang="coffee">
module.exports =
  props:
    "accordion":
      type: Boolean
      default: false
  methods:
    closeAll: ->
      @$broadcast "close"
  events:
    beforeOpen: (sender) ->
      if @accordion
        @$broadcast "close", sender
      return true
    beforeClose: -> true

</script>
