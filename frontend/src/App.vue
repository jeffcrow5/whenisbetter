<template>
  <div id="app">
    <b-navbar toggleable="lg" type="dark" variant="primary">
    <b-navbar-brand href="/">WhenIsBetter</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav v-if="token" class="ml-auto">
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
  </div>
</template>

<script>
export default {
  name: "App",
  data() {
    return {
      
    }
  },
  components: {},
  computed: {
    token() {
      return localStorage.getItem('accessToken')
    }
  }
};
</script>

<style>
</style>
