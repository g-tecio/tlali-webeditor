<template>
  <section class="articles">
    <h1> {{ $route.params.articles }} </h1>
    <!-- Render and <Article/> component for each article fetched from articlesData -->
    <hr>
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
          "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/publishstatus/" + params.articles.slice(0, -1)); //Trim the last letter to make correct URL
        return { articlesData };
    }
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css?family=Courgette');
.articles {
  margin-left: 200px;
}

hr {
  border: 0.5px solid #dddddd;
  margin: 0;
}

h1 {
  font-size: 40px;
  padding: 30px 0 30px 0;
  font-family: 'Courgette', cursive;
  text-align: center;
}
</style>
