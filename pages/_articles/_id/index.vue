<template>
  <section class="single-article">
    <h1>Editor</h1>
    <!-- Form to show and edit article data -->
    <form>
      <p><b>ID:</b> {{ articlesData.ID }} </p>

      <p><b>Autor:</b> {{ articlesData.ARTICLE.Author }}</p>

      <p><b>Fecha:</b> {{ articlesData.ARTICLE.DT }}</p>

      <!-- <input type="date" id="date"> -->

      <p><b>Estado actual:</b> {{ articlesData.ARTICLE.PublishStatus }}</p>

      <select id="status">
        <option value="Aprobado" style="background-color:green">Aprobado</option>
        <option value="Pendiente" style="background-color:orange">Pendiente</option>
        <option value="Rechazado" style="background-color:red">Rechazado</option>
      </select>

      <h2>Título:</h2>
      <input type="text" id="title" v-bind:value="articlesData.ARTICLE.Title">

      <h2>Localización</h2>
      <input type="text" id="location" v-bind:value="articlesData.ARTICLE.Location">

      <h2>Sección:</h2>
      <input type="text" id="section" v-bind:value="articlesData.ARTICLE.Section">

      <h2>Etiquetas:</h2>
      <input type="text" id="tags" v-bind:value="articlesData.ARTICLE.Tags">

      <h2>Contenido:</h2>
      <textarea id="content" v-bind:value="articlesData.ARTICLE.Content" rows="7" cols="50"></textarea>
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
      console.log("https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/" + this.$route.params.id);
      this.$axios.$put('https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/' + this.$route.params.id,
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
        // ID:             this.articlesData.ID,
        ARTICLE: {
          Author:         this.articlesData.ARTICLE.Author,
          Content:        document.getElementById("content").value,
          // DT:             document.getElementById("date").value,
          DT:             this.articlesData.ARTICLE.DT,
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
          S3DIR: "Test dir"
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
