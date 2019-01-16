<template>
  <section class="articles">
    <!-- Render and <Article/> component for each article fetched from articlesData -->
    <Article
      v-for="article in articlesData"
      v-bind:key="article.ID"
      v-bind:id="article.ID"
      v-bind:author="article.ARTICLE.Author"
      v-bind:title="article.ARTICLE.Title"
    />
  </section>
</template>

<script>
import Article from "@/components/Article"; //Get the Article component

export default {
  components: {
    Article //Declare components to use in this document/page
  },

// Fetch articles from API and return object as articlesData,
// ready to be used on <template>

  async asyncData({ $axios }) {
    const articlesData = await $axios.$get(
      "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles"
    );
    return { articlesData };
  }
};
</script>

<style scoped>
.articles {
  display: block;
  margin: auto;
  width: 500px;
}
</style>
