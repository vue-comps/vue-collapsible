// out: ..
<template lang="jade">
li(:class="[itemClass, opened ? 'opened': '']")
  div(
    @click="toggle | notPrevented | prevent",
    :class="[headerClass]"
    )
    slot(name="header") No header
  div(
    v-el:body,
    :style="{display:display}",
    :class="[bodyClass]"
    )
    slot No body
</template>

<script lang="coffee">

module.exports =
  mixins: [
    require("vue-mixins/isOpened")
  ]

  filters:
    notPrevented: require("vue-filters/notPrevented")
    prevent: require("vue-filters/prevent")

  props:
    "transitionIn":
      type: Function
      default: ({cb}) -> cb()
    "transitionOut":
      type: Function
      default: ({cb}) -> cb()
    "itemClass":
      type: String
      default: "collapsible-item"
    "headerClass":
      type: String
      default: "collapsible-header"
    "bodyClass":
      type: String
      default: "collapsible-body"

  data: ->
    display: if @isActive then "block" else "none"

  methods:
    show: ->
      @setOpened()
      @display = "block"
      @$dispatch "beforeOpen", @
      @transitionIn el: @$els.body, cb: =>
        @$dispatch "opened"
    hide: ->
      @$dispatch "beforeClose", @
      @transitionOut el: @$els.body, cb: =>
        @setClosed()
        @display = "none"
        @$dispatch "closed"
    open: -> @show()
    close: -> @hide()
    toggle: ->
      if @opened
        @close()
      else
        @open()

  events:
    close: (sender) ->
      if sender != @
        @close()
      return true
</script>
