<template>
<div id="app">
    <navbar :key="componentKey"></navbar>
    <b-container>
      <router-view :navbarRefresh="forceRerender"></router-view>
    </b-container>
  </div>
  <!-- <div id="app">
    <b-navbar toggleable="lg" type="dark" variant="primary">
    <b-navbar-brand href="/">WhenIsBetter</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav> -->

      <!-- Right aligned nav items -->
      <!-- <b-navbar-nav v-if="token" class="ml-auto">
        <b-nav-item-dropdown text="User" right>
          <b-dropdown-item href="#">Profile</b-dropdown-item>
          <b-dropdown-item href="/#/logout">Sign Out</b-dropdown-item>
        </b-nav-item-dropdown>
      </b-navbar-nav>
      <b-navbar-nav v-else class="ml-auto">
        <router-link to="/login">Login</router-link>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
    <router-view></router-view>
  </div> -->
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
</style>
