<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="primary">
      <b-navbar-brand :to="{ path: '/' }">whenisbetter</b-navbar-brand>
      <b-navbar-nav v-if="loggedIn">
      </b-navbar-nav>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <b-nav-item v-if="loggedIn" :to="{ path: '/myStuff' }"
            >My Stuff</b-nav-item
          >
        </b-navbar-nav>
        <b-navbar-nav>
          <b-nav-item v-if="!loggedIn" :to="{ path: '/login' }"
            >Login</b-nav-item
          >
        </b-navbar-nav>
        <b-navbar-nav>
          <b-nav-item v-if="!loggedIn" :to="{ path: '/register' }"
            >Register</b-nav-item
          >
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-navbar-nav>
            <b-nav-item v-if="loggedIn" @click="logout()"
              >Sign Out</b-nav-item
            >
          </b-navbar-nav>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>
import { getJwtToken } from "../auth";
export default {
  name: "NavBar",
  components: {},
  data: function () {
    return {
      user: {},
      isAdmin: false,
    };
  },
  mounted: function () {
  },
  methods: {
    logout() {
      this.$router.push("/logout");
      this.loggedin = false;
    },
  },
   computed: {
    loggedIn: function () {
      const token = getJwtToken();
      return !(token === undefined || token === "undefined" || token === null);
    }
  }
};
</script>


<style scoped>
</style>