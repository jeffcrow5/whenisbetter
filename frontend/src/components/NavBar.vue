<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="primary">
      <b-navbar-brand :to="{ path: '/' }">whenisbetter</b-navbar-brand>
      <b-navbar-nav v-if="loggedIn">
      </b-navbar-nav>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <b-nav-item v-if="loggedIn" :to="{ path: '/' }"
            >Home</b-nav-item
          >
        </b-navbar-nav>
         <b-navbar-nav>
          <b-nav-item v-if="isAdmin" :to="{ path: '/admin' }"
            >Admin Settings</b-nav-item
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
          <b-nav-item-dropdown v-if="loggedIn" right>
            <!-- Using 'button-content' slot -->
            <template #button-content>
              {{user.firstname}} {{user.lastname}}
            </template>
            <b-dropdown-item href="#/profile">Settings</b-dropdown-item>
            <b-dropdown-item @click="logout()">Sign Out</b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>
import { getJwtToken } from "../auth";
import Api from "../api";

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
      this.checkAdmin()
  },
  methods: {
    logout() {
      this.$router.push("/logout");
      this.loggedin = false;
    },

    checkAdmin() {
        Api.getCurrentUser().then((response) => {
            this.user = response.data[0];
            this.isAdmin = this.user.isadmin;
        });
    }
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