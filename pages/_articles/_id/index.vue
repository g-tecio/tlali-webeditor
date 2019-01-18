<template>
  <section class="article-data">
    <h1>Editor</h1>
    <!-- Form to show and edit article data -->
    <div class="article-data-grid">
      <p><b>ID:</b> {{ articlesData.ID }} </p>
      <p><b>Fecha:</b> {{ articlesData.ARTICLE.DT }}</p>
      <p><b>Autor:</b> {{ articlesData.ARTICLE.Author }}</p>
      <div class="status-data-grid">
        <p><b>Estado:</b> {{ articlesData.ARTICLE.PublishStatus }}</p>
          <select id="status">
          <option value="Aprobado" style="background-color:#1FE229">Aprobado</option>
          <option value="Pendiente" style="background-color:#FFE60C">Pendiente</option>
          <option value="Rechazado" style="background-color:#E02F2A">Rechazado</option>
        </select>
        <input type="button" class="button-status" value="✔">
      </div>
    </div>
    <hr>
   <div class="article-form">
      <!-- <input type="date" id="date"> -->

      <h2>Título:</h2>
      <input type="text" id="title" v-bind:value="articlesData.ARTICLE.Title">

      <h2>Localización:</h2>
      <input type="text" id="location" v-bind:value="articlesData.ARTICLE.Location">

      <h2>Sección:</h2>
      <input type="text" id="section" v-bind:value="articlesData.ARTICLE.Section">

      <h2>Etiquetas:</h2>
      <input type="text" id="tags" v-bind:value="articlesData.ARTICLE.Tags">

      <h2>Contenido:</h2>
      <textarea id="content" v-bind:value="articlesData.ARTICLE.Content" rows="7" cols="50"></textarea>
    </div>
      <!-- Button to update changes -->
      <input type="button" class="button-update" v-on:click="updateInfo()" value="Actualizar">
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
.article-data {
  margin: auto;
  width: 70%;
  min-width: 500px;
}

.status-data-grid {
  display: grid;
  grid-template-columns: 30% 30% 20%;
}

.article-data-grid {
  display: grid;
  grid-template-columns: 50% 50%;
}

.button-update {
  background-color: rgb(230, 230, 230);
}

.button-status {
  height: 30px;
  width: 30px;
  align-self: center;
  justify-self: center;
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
