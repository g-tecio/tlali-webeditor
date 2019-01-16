<template>
  <section class="single-article">
    <h1>¿Eliminar artículo?</h1>
    <article>
      <p>
        <b>ID:</b>
        {{ articlesData.ID }} <br>
        <b>Título:</b>
        {{ articlesData.ARTICLE.Title }} <br>
        <b>Autor:</b>
        {{ articlesData.ARTICLE.Author }} <br>
        <b>Fecha:</b>
        {{ articlesData.ARTICLE.DT }} <br>
        <b>Localización</b>
        {{ articlesData.ARTICLE.Location }} <br>
        <b>Estado de publicación:</b>
        {{ articlesData.ARTICLE.PublishStatus }} <br>
        <b>Sección:</b>
        {{ articlesData.ARTICLE.Section }} <br>
        <b>Etiquetas:</b>
        {{ articlesData.ARTICLE.Tags }} <br>
        <b>Contenido:</b>
        {{ articlesData.ARTICLE.Content }} <br>
      </p>
    </article>
    <!-- Button to update changes -->
    <br>
    <input type="button" id="submit" v-on:click="callDelete()" value="SI, ELIMINAR">
  </section>
</template>

<script>
export default {
  created: function() {
    console.log("Page loaded");
  },

  methods: {
    callDelete: function() { //Called by the button
      console.log("Button clicked, processing request...");
      this.deleteArticle();
    },

    async deleteArticle() {
      console.log(this.$route.params.id);
      this.$axios.$delete('https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/' + this.$route.params.id)
      .then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });
    },
  },

  async asyncData({ $axios, params }) { //Fetch the data from a single article, given the ID
    const url =
      "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/" +
      params.id;
    console.log(url);
    const articlesData = await $axios.$get(url);
    console.log("Data fechted");
    return { articlesData };
  }
};
</script>

<style scoped>
p{
  margin-block-start: 0;
  margin-block-end: 0;
}

input {
  font-weight: bold;
  display: block;
  margin: auto;
  height: 30px;
  width: 200px;
  color: white;
  background-color: rgb(185, 34, 34);
}

h1 {
  text-align: center;
  font-size: 24px;
}

b {
  font-size: 14px;
  margin-block-start: 2px;
  margin-block-end: 2px;
}

article {
  /* border: 1px solid #cccccc; */
  padding: 10px;
  box-shadow: 2px 2px 5px rgb(153, 153, 153);
  margin: auto;
  width: 500px;
}
</style>
