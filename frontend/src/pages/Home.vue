<template>
  <div>
    <p>Welcome to the IT350 blog!</p>
    <br />

    <!-- <ul v-else>
      <li v-for="article in articles" :key="article.articleid">
        <router-link :to="`article/${article.articleid}`">{{
          article.title
        }}</router-link>
      </li>
    </ul> -->
  </div>
</template>

<script>


export default {
  name: "Home",
  data: function () {
    return {
      articles: [],
    };
  },
  created() {
  },
};
</script>