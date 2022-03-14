<template>
  <div>Logging you out...</div>
</template>

<script>
import { deleteJwtToken } from "../auth";
export default {
  name: "Logout",
  props: ["navbarRefresh"],
  mounted: function () {
    deleteJwtToken();
    this.navbarRefresh();
    this.$router.push({ path: "/login" });
  },
};
</script>