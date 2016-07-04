// out: ..
<template lang="pug">
li(
  :class="itemClass"
  )
  div(
    :class="headerClass",
    @click="toggle"
    )
    slot(name="header") No header
  div(
    v-el:body,
    v-if="isOpened",
    :class="bodyClass"
    )
    slot No body
</template>

<script lang="coffee">
module.exports =
  mixins: [
    require("vue-mixins/isOpened")
  ]

  props:
    "stayOpen":
      type: Boolean
      default: false

  computed:
    itemClass: ->
      tmp = [@$parent.itemClass]
      if @isOpened
        tmp.push "active"
      return tmp
    headerClass: ->
      tmp = [@$parent.headerClass]
      if @isOpened
        tmp.push "active"
      return tmp
    bodyClass: -> [@$parent.bodyClass]

  data: ->
    isCollapsibleItem: true

  methods:
    show: ->
      @setOpened()
      @$emit "before-open", @
      @$parent.transitionIn el: @$els.body, cb: =>
        @$emit "opened", @
    hide: ->
      @$emit "before-close", @
      @$parent.transitionOut el: @$els.body, cb: =>
        @setClosed()
        @$emit "closed", @
    open: ->
      @$parent.closeAll(@) if @$parent.accordion
      @show()
    close: (sender) ->
      return if sender? and sender == @
      @hide()
    toggle: (e) ->
      if e?
        return if e.defaultPrevented
        e.preventDefault()
      if @opened
        @close()
      else
        @open()
</script>
