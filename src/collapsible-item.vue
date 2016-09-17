// out: ..
<template lang="pug">
li(
  :class="computedClass"
  )
  a(
    :class="headerClass",
    @click="toggle"
    )
    slot(name="header")
  div(
    v-el:body,
    v-if="isOpened",
    :transition="cTransition",
    :class="bodyClass"
    )
    slot
</template>

<script lang="coffee">
module.exports =
  mixins: [
    require("vue-mixins/isOpened")
    require("vue-mixins/class")
    require("vue-mixins/transition")
  ]

  props:
    "stayOpen":
      type: Boolean
      default: false

  computed:
    mergeClass: ->
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
    cTransition: ->
      name = @transition
      name ?= @$parent.transition
      name ?= "default"
      @processTransition(name, @$parent.$parent)
      return name
  data: ->
    isCollapsibleItem: true

  methods:
    show: ->
      @setOpened()
    hide: ->
      @setClosed()
    open: ->
      if @$parent.accordion
        @$parent.closeAll(@)
        unless @$parent.noScroll
          @$once "after-enter", =>
            top = @$el.getBoundingClientRect().top
            if top < 0
              @$parent.scrollTransition(top,@$el)
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
