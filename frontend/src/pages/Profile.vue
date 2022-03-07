<template>
  <div>
    <p>Welcome to ur heckin profile nerd</p>


  </div>
</template>

<script>
import Api from '../api'

export default {
  name: "Profile",
  data: function () {
    return {
      articles: [],
    };
  },
  created() {
    Api.getUserProfile().then((res) => {
      console.log(res)
    })
  },
};
</script>