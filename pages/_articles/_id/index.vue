<template>
  <section class="article-data">
    <h1>Editor</h1>
    <!-- Form to show and edit article data -->
    <div class="article-data-grid">
      <p><b>ID:</b> {{ articlesData.ID }} </p>
      <p><b>Fecha:</b> {{ articlesData.ARTICLE.DT }}</p>
      <p><b>Autor:</b> {{ articlesData.ARTICLE.Author }}</p>
      <div class="status-data-grid">
        <p><b>Estado:</b></p>
          <select id="status" v-bind:value="articlesData.ARTICLE.PublishStatus">
            <option value="Aprobado" style="background-color:#1FE229">Aprobado</option>
            <option value="Pendiente" style="background-color:#FFE60C">Pendiente</option>
            <option value="Rechazado" style="background-color:#E02F2A">Rechazado</option>
          </select>
      </div>
      <h2>Localización:</h2>
      <input type="text" id="location" v-bind:value="articlesData.ARTICLE.Location">

      <h2>Sección:</h2>
      <input type="text" id="section" v-bind:value="articlesData.ARTICLE.Section">

      <h2>Etiquetas:</h2>
      <input type="text" id="tags" v-bind:value="articlesData.ARTICLE.Tags">
    </div>
    <hr>
   <div class="article-form">
      <!-- <input type="date" id="date"> -->

      <input type="text" id="title" placeholder="Título" autocomplete="off" v-bind:value="articlesData.ARTICLE.Title">
      <textarea id="content" placeholder="Comienza aquí..." v-bind:value="articlesData.ARTICLE.Content" rows="7" cols="50"></textarea>

    </div>
      <!-- Button to update changes -->
      <input type="button" class="button-update" v-on:click="updateInfo()" value="ACTUALIZAR">
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
h1 {
  text-align: center;
  padding: 20px;
}

h2 {
  font-size: 14px;
}
#title {
  font-size: 30px;
  font-weight: bolder;
}

#content {
  font-size: 20px;
}

.article-data {
  margin: auto;
  width: 70%;
  min-width: 500px;
}

.status-data-grid {
  align-items: center;
  display: grid;
  grid-template-columns: 30% 70%;
}

.article-data-grid {
  align-items: center;
  display: grid;
  grid-template-columns: 50% 50%;
}

.button-update {
  height: 30px;
  width: 100px;
  font-weight: bold;
  font-size: 12px;
  color: white;
  background-color: rgb(104, 136, 243);
}

input,
textarea {
  box-sizing: border-box;
  font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  /* border: 1px solid #cccccc; */
  outline: none;
  border: none;
  /* padding: 5px;
  margin: 5px; */
  width: 100%;
  margin-block-start: 2px;
  margin-block-end: 2px;
}
</style>
