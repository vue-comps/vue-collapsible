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
  transition(:is="cTransition", :name="cTransitionName")
    div(
      v-if="opened",
      :class="bodyClass"
      )
      slot
</template>

<script lang="coffee">
module.exports =
  mixins: [
    require("vue-mixins/isOpened2")
    require("vue-mixins/class")
    require("vue-mixins/transition2")
  ]

  props:
    stayOpen:
      type: Boolean
      default: false
    transition:
      type: String
    transitionName:
      type: String

  computed:
    mergeClass: ->
      tmp = [@$parent.itemClass]
      if @opened
        tmp.push "active"
      return tmp
    headerClass: ->
      tmp = [@$parent.headerClass]
      if @opened
        tmp.push "active"
      return tmp
    bodyClass: -> [@$parent.bodyClass]
    cTransition: ->
      name = @transition
      name ?= @$parent.transition
      return @processTransition(name, parent: @$parent.$parent)
    cTransitionName: ->
      name = @transitionName
      name ?= @$parent.transitionName
      return name

  data: ->
    isCollapsibleItem: true

  methods:
    show: ->
      @setOpened()
    hide: ->
      @setClosed()
    open: ->
      @show()
      if @$parent.accordion
        @$parent.closeAll(@)
    close: (scroll) ->
      if @opened
        if scroll and not @$parent.noScroll
          top = @$el.children[1].getBoundingClientRect().top
          if top < 0
            @$parent.scrollTransition(top)
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
