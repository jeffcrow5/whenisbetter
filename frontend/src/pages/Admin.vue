<template>
  <div id="container">
    <b-form-radio-group
      buttons
      button-variant="outline-primary"
      v-model="activeTab"
      :options="['Group View', 'User View']">
    </b-form-radio-group>
    <hr>

    <div class="view" v-if="activeTab == 'Group View'">
      <div class="left">
        Group left side
      </div>
      <div class="right">
        Group right side
      </div>
    </div>
    <div class="view" v-else>
      <div class="left">
        User left side
      </div>
      <div class="right">
        User right side
      </div>
    </div>
  </div>
</template>

<script>
import Api from "../api"

export default {
  name: "Admin",
  data () {
    return {
      activeTab: 'Group View'
    }
  },
  created() {
    Api
  }
};
</script>

<style scoped>
#container {
  padding: 25px;
}

.view {
  display: grid;
  grid-template-areas:
    'left right';
  grid-template-columns: 49% 49%;
  gap: 20px;
  width: 100%;
  
}

.left {
  grid-area: left;
}
.right {
  grid-area: right;
}
</style>