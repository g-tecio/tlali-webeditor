<template>
  <section class="article-data" v-bind:style="{marginRight:marginMain + 'px'}">
    <ArticleSettings

    v-bind:style="{marginRight: marginBar + 'px'}"
    v-bind:id="articlesData.ID"
    v-bind:author="articlesData.ARTICLE.Author"
    v-bind:date="articlesData.ARTICLE.DT"
    v-bind:location="articlesData.ARTICLE.Location"
    v-bind:section="articlesData.ARTICLE.Section"
    v-bind:status="articlesData.ARTICLE.PublishStatus"
    v-bind:tags="articlesData.ARTICLE.Tags"
    />
    <input type="button" class="button-toggle" v-on:click="toggleBar()" value="MÁS">

    <input type="text" id="title" placeholder="Título" autocomplete="off" v-bind:value="articlesData.ARTICLE.Title">
    <textarea id="content" class="autoExpand" placeholder="Comienza aquí..." v-bind:value="articlesData.ARTICLE.Content" rows="7" cols="50"></textarea>
  </section>
</template>

<script>
import ArticleSettings from '@/components/ArticleSettings'

export default {
  components: {
    ArticleSettings
  },

  created: function() {
    console.log("Page loaded");
  },

  data: function() {
    return {
      showBar: true,
      marginMain: 250,
      marginBar: 0
    }
  },

  methods: {
    updateInfo: function() { //Called by the button
      console.log("Button clicked, processing data...");
      console.log(this.buildJSON());
      this.postData(this.buildJSON()); //Call POST
    },

    toggleBar: function() {
      this.showBar ? this.showBar = false : this.showBar = true;
      this.toggleMargin();
    },

    toggleMargin: function() {
      if (this.showBar) {
        this.marginMain = 250;
        this.marginBar = 0;
      } else {
        this.marginMain = 0;
        this.marginBar = -250;
      }
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
          // Author:         this.articlesData.ARTICLE.Author,
          Author:         document.getElementById("author").value,
          Content:        document.getElementById("content").value,
          DT:             document.getElementById("date").value,
          // DT:             this.articlesData.ARTICLE.DT,
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
#location, #section, #tags {
  display: inline;
}

#title {
  font-size: 30px;
  font-weight: bolder;
}

#content {
  font-size: 20px;
}

.article-data {
  transition: .7s;
  margin-left: 200px;
  margin-right: 250px;
  padding: 0 50px 0 50px;
  min-width: 500px;
  /* height: 700px; */
}

.button-toggle {
  font-weight: bolder;
  float: right;
  margin: 20px 0 20px 0;
  height: 30px;
  font-size: 15px;
  color: rgb(84, 108, 218);
  width: 70px;
  background-color: #ebebeb;
}

input,
textarea {
  box-sizing: border-box;
  font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  border: none;
  /* border: 1px solid #cccccc; */
  outline: none;
  width: 100%;
  margin-block-start: 2px;
  margin-block-end: 2px;
}

textarea {
  resize: none;
  height: 80vh;
}
</style>
