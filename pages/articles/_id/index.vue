<template>
  <section class="single-article">
    <h1>Editor</h1>
    <!-- Form to show and edit article data -->
    <form>
      <h2>ID:</h2>
      <input type="text" id="id" v-bind:value="articlesData.ID">
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
      <textarea id="content" v-bind:value="articlesData.ARTICLE.Content" rows="4" cols="50"></textarea>
      <br>
      <!-- Button to update changes -->
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
    updateInfo: function() { //Called by the button
      console.log("Button clicked, processing data...");
      console.log(this.buildJSON());
      this.postData(this.buildJSON()); //Call POST
    },

    async postData(articleJSON) {
      this.$axios.$post('https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/1547569172444II6',
      articleJSON).then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });
    },

//Build an object with the data from the form, return it as articleData
    buildJSON: function() {
      var articleData = {
        ID:               document.getElementById("id").value,
        ARTICLE: {
          Author:         document.getElementById("author").value,
          Content:        document.getElementById("content").value,
          DT:             document.getElementById("date").value,
          Location:       document.getElementById("location").value,
          PublishStatus:  document.getElementById("status").value,
          Section:        document.getElementById("section").value,
          Tags:           document.getElementById("tags").value,
          Title:          document.getElementById("title").value
        },
        IMG: {
          Author: "Test Author",
          DT: "Date Test",
          Location: "Location Test",
          "S3-DIR": "Test dir"
        }
      };
      return articleData;
    }
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
