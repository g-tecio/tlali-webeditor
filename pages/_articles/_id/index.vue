<template>
  <section class="article-data" v-bind:style="{marginRight:marginMain + 'px'}">
    <img src="@/assets/config.png" class="button-toggle" v-on:click="toggleBar()">
    <ArticleSettings
      v-bind:style="{marginRight: marginBar + 'px'}"
      v-bind:id="singleArticle.id"
      v-bind:author="singleArticle.author"
      v-bind:dateGiven="singleArticle.dt"
      v-bind:location="singleArticle.location"
      v-bind:s3dir="singleArticle.s3Dir"
      v-bind:section="singleArticle.article.section"
      v-bind:status="singleArticle.publishStatus"
      v-bind:tags="singleArticle.article.tags"
    />

    <div class="editor-box">
      <div class="editor-box-bg-color">
        <input type="text" id="author" v-bind:value="{articleData.article.title}">
        <hr>
        <MediumEditor id="vue-medium-editor" :text="content" :options="options" custom-tag="div"/>
      </div>
    </div>
  </section>
</template>

<script>
import ArticleSettings from "@/components/ArticleSettings";
import Editor from "@/components/Editor";
import MediumEditor from "vue2-medium-editor";

export default {
  name: "ArticleEditor",

  components: {
    ArticleSettings,
    Editor,
    MediumEditor
  },

  created: function() {
    console.log("Page loaded");
    this.content =
      "<h2>" +
      this.singleArticle.article.title +
      "</h2>" +
      "<p>" +
      this.singleArticle.article.content +
      "</p>";
  },

  data: function() {
    return {
      showBar: true,
      content: "<h1>Título</h1><p>Comienza aquí</p>",
      marginMain: 250,
      marginBar: 0,
      articleData: {
        dt: "",
        author: "",
        location: "",
        publishStatus: "",
        s3Dir: "",
        article: {
          content: "",
          section: "",
          tags: "",
          title: ""
        }
      },
      options: {
        toolbar: { buttons: ["bold", "italic", "strikethrough", "h2"] },
        placeholder: {
          text: "Comienza aquí..."
        }
      }
    };
  },

  async asyncData({ $axios, params }) {
    const apiURL =
      "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/";

    console.log("Conecting to: " + apiURL + params.id);
    const singleArticle = await $axios.$get(apiURL + params.id);

    console.log("Data fechted successfully!");
    return { singleArticle, apiURL };
  },

  methods: {
    // escapeJSON: function(str) {
    //   return str
    //     .replace(/[\"]/g, '\\"')
    //     .replace(/[\\]/g, "\\\\")
    //     .replace(/[\/]/g, "\\/")
    //     .replace(/[\b]/g, "\\b")
    //     .replace(/[\f]/g, "\\f")
    //     .replace(/[\n]/g, "\\n")
    //     .replace(/[\r]/g, "\\r")
    //     .replace(/[\t]/g, "\\t");
    // },

    updateArticle: function(isNew) {
      this.buildJSON();
      if (isNew == "Nuevo") {
        this.createData();
      } else {
        this.updateData();
      }
    },

    deleteArticle: function() {
      this.deleteData();
    },

    createData() {
      console.log("POST: " + this.apiURL);
      this.$axios
        .$post(this.apiURL, this.articleData)
        .then(function(response) {
          console.log(response);
        })
        .catch(function(error) {
          console.log(error);
        });
    },

    updateData() {
      console.log("PUT: " + this.apiURL + this.$route.params.id);

      this.$axios
        .$put(this.apiURL + this.$route.params.id, this.articleData)
        .then(function(response) {
          console.log(response);
        })
        .catch(function(error) {
          console.log(error);
        });
    },

    deleteData() {
      console.log(
        "DELETE: " +
          this.apiURL +
          this.$route.params.id +
          "/" +
          this.singleArticle.dt
      );

      this.$axios
        .$delete(
          this.apiURL + this.$route.params.id + "/" + this.singleArticle.dt
        )
        .then(function(response) {
          console.log(response);
        })
        .catch(function(error) {
          console.log(error);
        });
    },

    buildJSON: function() {
      console.log("building");
      this.articleData.dt = this.singleArticle.dt;
      this.articleData.author = document.getElementById("author").value;
      this.articleData.location = document.getElementById("location").value;
      this.articleData.publishStatus = document.getElementById("status").value;
      this.articleData.s3Dir = "-";
      this.articleData.article.content = document.getElementById(
        "vue-medium-editor"
      ).innerHTML;
      this.articleData.article.section = document.getElementById(
        "section"
      ).value;
      this.articleData.article.tags = document.getElementById("tags").value;
      this.articleData.article.title = "Made with Vue Medium Editor";
      console.log(JSON.stringify(this.articleData));
    },
    // buildJSON: function() {
    //   console.log("building");
    //   this.articleData.dt =                     this.singleArticle.dt;
    //   this.articleData.author =                 this.escapeJSON(document.getElementById("author").value);
    //   this.articleData.location =               this.escapeJSON(document.getElementById("location").value);
    //   this.articleData.publishStatus =          document.getElementById("status").value;
    //   this.articleData.s3Dir =                  "-";
    //   this.articleData.article.content =        this.escapeJSON(document.getElementById("content").value);
    //   this.articleData.article.section =        document.getElementById("section").value;
    //   this.articleData.article.tags =           document.getElementById("tags").value;
    //   this.articleData.article.title =          this.escapeJSON(document.getElementById("title").value);
    //   console.log(JSON.stringify(this.articleData));
    // },

    toggleBar: function() {
      this.showBar ? (this.showBar = false) : (this.showBar = true);
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
    }
  }
};
</script>

<style>
@import "@/CSS/editor.css";
@import "@/CSS/editor-theme.css";
#location,
#section,
#tags {
  display: inline;
}

div {
  outline: none;
}

.editor-box {
  padding: 20px 100px 100px;
}

.editor-box-bg-color {
  padding: 10px;
  background-color: #fafafa;
}

.editor-box h1 {
  font-size: 24px;
}

.article-data {
  transition: 0.7s;
  margin-left: 200px;
  margin-right: 250px;
  padding: 0 50px 0 50px;
  min-width: 500px;
  /* height: 700px; */
}

.button-toggle {
  float: right;
  margin-top: 20px;
  height: 30px;
  width: 30px;
}
</style>
