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

    before (done) ->
      env = loadComp(require("../dev/basic.vue"))
      env.$nextTick done

    after ->
      unloadComp(env)

    it "should work as collapsible", (done) ->
      should.not.exist env.$refs.ci1.opened
      should.not.exist env.$refs.ci2.opened
      should.not.exist env.$refs.ci3.opened
      clickNWait env.$refs.ci2.$el.firstChild, ->
        should.not.exist env.$refs.ci1.opened
        env.$refs.ci2.opened.should.be.true
        should.not.exist env.$refs.ci3.opened
        clickNWait env.$refs.ci3.$el.firstChild, ->
          should.not.exist env.$refs.ci1.opened
          env.$refs.ci2.opened.should.be.true
          env.$refs.ci3.opened.should.be.true
          clickNWait env.$refs.ci2.$el.firstChild, ->
            should.not.exist env.$refs.ci1.opened
            env.$refs.ci2.opened.should.be.false
            env.$refs.ci3.opened.should.be.true
            clickNWait env.$refs.ci3.$el.firstChild, ->
              should.not.exist env.$refs.ci1.opened
              env.$refs.ci2.opened.should.be.false
              env.$refs.ci3.opened.should.be.false
              done()

    it "should work as accordion", (done) ->
      should.not.exist env.$refs.ai1.opened
      should.not.exist env.$refs.ai2.opened
      env.$refs.ai3.opened.should.be.true
      clickNWait env.$refs.ai2.$el.firstChild, ->
        should.not.exist env.$refs.ai1.opened
        env.$refs.ai2.opened.should.be.true
        env.$refs.ai3.opened.should.be.false
        clickNWait env.$refs.ai3.$el.firstChild, ->
          should.not.exist env.$refs.ai1.opened
          env.$refs.ai2.opened.should.be.true
          env.$refs.ai3.opened.should.be.true
          clickNWait env.$refs.ai2.$el.firstChild, ->
            should.not.exist env.$refs.ai1.opened
            env.$refs.ai2.opened.should.be.false
            env.$refs.ai3.opened.should.be.true
            clickNWait env.$refs.ai3.$el.firstChild, ->
              should.not.exist env.$refs.ai1.opened
              env.$refs.ai2.opened.should.be.false
              env.$refs.ai3.opened.should.be.false
              done()
