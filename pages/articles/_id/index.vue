<template>
  <section class="single-article">
    <form>
      <h1>Editor</h1>
      <h2>ID:</h2>
      {{ $route.params.id }}
      <h2>Título:</h2>
      <input type="text" id="title" v-bind:value="articlesData.ARTICLE.Title">
      <h2>Autor:</h2>
      <input type="text" id="author" v-bind:value="articlesData.ARTICLE.Author">
      <h2>Fecha:</h2>
      <input type="text" id="date" v-bind:value="articlesData.ARTICLE.DT">
      <h2>Localización</h2>
      <input type="text" id="location" v-bind:value="articlesData.ARTICLE.Location">
      <h2>Estado de publicación:</h2>
      <input type="text" id="status" v-bind:value="articlesData.ARTICLE.PublishStatus">
      <h2>Sección:</h2>
      <input type="text" id="section" v-bind:value="articlesData.ARTICLE.Section">
      <h2>Etiquetas:</h2>
      <input type="text" id="tags" v-bind:value="articlesData.ARTICLE.Tags">
      <h2>Contenido:</h2>
      <textarea v-model="articlesData.ARTICLE.Content" rows="4" cols="50"></textarea>
      <br>
      <input type="button" id="submit" v-on:click="updateInfo()" value="Actualizar">
    </form>
  </section>
</template>

<script>
export default {
  created: function() {
    console.log("Page loaded");
  },

  methods: {
    updateInfo: function() {
      console.log("Button clicked!");
      console.log("Author: " + document.getElementById("author").value);
      // POST
      // this.$axios.$post(
      //   "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/01",
      //   {
      //     ARTICLE: {
      //       Author: document.getElementById("author").value
      //     }
      //   }
      // );
    }
  },

  async asyncData({ $axios, params }) {
    const url = "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/" + params.id;
    console.log(url);
    const articlesData = await $axios.$get(url);
    console.log("Data fechted");
    return { articlesData };
  }
};
</script>

<style scoped>
#submit {
  background-color: rgb(230, 230, 230);
}

h1 {
  text-align: center;
  font-size: 30px;
}

h2 {
  font-size: 14px;
  margin-block-start: 2px;
  margin-block-end: 2px;
}

form {
  padding: 10px;
  display: block;
  margin: auto;
  width: 500px;
}

input,
textarea {
  box-sizing: border-box;
  border: 1px solid #cccccc;
  padding: 5px;
  margin: 5px;
  width: 500px;
  margin-block-start: 2px;
  margin-block-end: 2px;
}
</style>
