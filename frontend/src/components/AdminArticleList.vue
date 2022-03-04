<template>
  <div>
    <div v-if="loading">Loading articles....</div>
    <router-link to="admin/add" class="float-right">Add article</router-link>
  </div>
</template>

<script>


export default {
  name: "AdminArticleList",
  data: function () {
    return {
      loading: false,
      articles: [],
    };
  },
  created: function () {
    this.loadArticles();
  },

  methods: {
    loadArticles() {
      this.loading = true;
      this.articles = [];
      
    },
  },
};
</script>