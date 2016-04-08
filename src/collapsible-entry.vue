// out: ..
<template lang="jade">
li.vc-collapsible-entry(:class="{active:active}")
  .vc-collapsible-header(@click="toggle | notPrevented | prevent")
    slot(name="header") No header
  .vc-collapsible-body(v-el:body v-show="active")
    slot No body
</template>

<script lang="coffee">

module.exports =
  props:
    "isActive":
      type: Boolean
      default: false
    "fadeIn":
      type: Function
      default: ({el}) ->
        @style.opacity = 1
    "fadeOut":
      type: Function
      default: ({el}) ->
        @style.opacity = 0

  filters:
    notPrevented: require("vue-filters/notPrevented")
    prevent: require("vue-filters/prevent")

  data: ->
    active: @isActive
    style:
      opacity: +@isActive

  methods:
    show: ->
      @active = true
      @isActive = true
      @$dispatch "beforeOpen", @
      @fadeIn el: @$els.body
    hide: ->
      @active = false
      @isActive = false
      @$dispatch "beforeClose", @
      @fadeOut el: @$els.body
    open: ->
      @show()
    close: ->
      @hide()
    toggle: ->
      if @active
        @close()
      else
        @open()
  events:
    close: (sender) ->
      if sender != @
        @close()
      return true
  watch:
    "isActive": (val) ->
      if val != @active
        if val
          @open()
        else
          @close()

</script>
