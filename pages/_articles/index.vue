<template>
  <section class="articles">
    <h1>Mostrando todos los artículos</h1>
    <!-- Render and <Article/> component for each article fetched from articlesData -->
    <Article
      v-for="article in articlesData"
      v-bind:key="article.ID"
      v-bind:id="article.ID"
      v-bind:author="article.ARTICLE.Author"
      v-bind:title="article.ARTICLE.Title"
      v-bind:date="article.ARTICLE.DT"
      v-bind:status="article.ARTICLE.PublishStatus"
    />
  </section>
</template>

<script>
import Article from "@/components/Article"; //Get the Article component

export default {
  components: {
    Article //Declare components to use in this document/page
  },
  // Filter the articles, according to the Route.params and calling the right URL
  async asyncData({ $axios, params }) {
    if(params.articles == "Articulos") {
      const articlesData = await $axios.$get(
        "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/");
      return { articlesData };
    } else {
        const articlesData = await $axios.$get(
          "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/publishstatus/" + params.articles);
        return { articlesData };
    }
  }
};
</script>

<style scoped>
h1 {
  text-align: center;
}
.articles {
  display: block;
  margin: auto;
  width: 70%;
  min-width: 500px;
}
</style>
