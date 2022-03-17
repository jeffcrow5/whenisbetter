<template>
<div id="app">
  <navbar :key="componentKey"></navbar>
  <router-view :navbarRefresh="forceRerender"></router-view>
</div>
</template>

<script>
import { getJwtToken } from './auth'
import navbar from './components/NavBar'

export default {
  name: "App",
  data() {
    return {
      componentKey: 0,
    }
  },
  components: {
    navbar,
  },
  computed: {
    token() {
      console.log("test", getJwtToken())
      return getJwtToken()
    }
  },
  methods: {
    forceRerender() {
      this.componentKey += 1;
    }
  }
};
</script>

<style>
#app {
  height: 100vh;
  display: flex;
  flex-direction: column;
}
</style>
