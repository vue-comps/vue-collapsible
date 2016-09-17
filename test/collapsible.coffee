env = null

clickNWait = (el,cb) ->
  e = new MouseEvent("click",{
    "view": window,
    "bubbles": true,
    "cancelable": true
  })
  el.dispatchEvent(e)
  env.$nextTick -> cb()

describe "collapsible", ->

  describe "basic env", ->

    before ->
      env = loadComp(require("../dev/basic.vue"))

    after ->
      unloadComp(env)

    it "should work as collapsible", (done) ->
      env.$refs.ci1.opened.should.be.false
      env.$refs.ci2.opened.should.be.false
      env.$refs.ci3.opened.should.be.false
      clickNWait env.$refs.ci2.$el.firstChild, ->
        env.$refs.ci1.opened.should.be.false
        env.$refs.ci2.opened.should.be.true
        env.$refs.ci3.opened.should.be.false
        clickNWait env.$refs.ci3.$el.firstChild, ->
          env.$refs.ci1.opened.should.be.false
          env.$refs.ci2.opened.should.be.true
          env.$refs.ci3.opened.should.be.true
          clickNWait env.$refs.ci2.$el.firstChild, ->
            env.$refs.ci1.opened.should.be.false
            env.$refs.ci2.opened.should.be.false
            env.$refs.ci3.opened.should.be.true
            clickNWait env.$refs.ci3.$el.firstChild, ->
              env.$refs.ci1.opened.should.be.false
              env.$refs.ci2.opened.should.be.false
              env.$refs.ci3.opened.should.be.false
              done()

    it "should work as accordion", (done) ->
      env.$refs.ai1.opened.should.be.false
      env.$refs.ai2.opened.should.be.false
      env.$refs.ai3.opened.should.be.true
      clickNWait env.$refs.ai2.$el.firstChild, ->
        env.$refs.ai1.opened.should.be.false
        env.$refs.ai2.opened.should.be.true
        env.$refs.ai3.opened.should.be.false
        clickNWait env.$refs.ai3.$el.firstChild, ->
          env.$refs.ai1.opened.should.be.false
          env.$refs.ai2.opened.should.be.true
          env.$refs.ai3.opened.should.be.true
          clickNWait env.$refs.ai2.$el.firstChild, ->
            env.$refs.ai1.opened.should.be.false
            env.$refs.ai2.opened.should.be.false
            env.$refs.ai3.opened.should.be.true
            clickNWait env.$refs.ai3.$el.firstChild, ->
              env.$refs.ai1.opened.should.be.false
              env.$refs.ai2.opened.should.be.false
              env.$refs.ai3.opened.should.be.false
              done()
