<template>
  <section class="articles">
    <h1>Historias</h1>

    <ArticlesFilter
      v-on:searchRecords="filterBySearch"
      v-on:filterStatus="filterByStatus" />

    <hr>

    <Article
      v-for="article in processedList"
      v-bind:key="article.ID"
      v-bind:id="article.ID"
      v-bind:author="article.ARTICLE.Author"
      v-bind:title="article.ARTICLE.Title"
      v-bind:date="article.ARTICLE.DT"
      v-bind:status="article.ARTICLE.PublishStatus" />
  </section>
</template>

<script>
import Article from "@/components/Article";
import ArticlesFilter from "@/components/ArticlesFilter";

export default {
  name: 'MainApp',

  data: function() {
    return {
      processedList: [],
      tempList: [],
    }
  },

  created: function() {
    this.processedList = this.articlesData;
    this.tempList = this.articlesData;
},

  components: {
    Article,
    ArticlesFilter
  },

async asyncData({ $axios }) {
  const apiURL = "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/";
  const articlesData = await $axios.$get(apiURL);
  return { articlesData };
  },

  methods: {
    filterBySearch: function(terms) {
      this.processedList = this.tempList.filter(function(item) {
        return ( //If any of the following matchs returns true, the article is added to articleList
          (item.ARTICLE.Title.toLowerCase().match(terms.toLowerCase())) || //Search on the Title
          (item.ARTICLE.Author.toLowerCase().match(terms.toLowerCase())) //Search on the Author
        )
      });
    },

    filterByStatus: function(status) {
      this.processedList = this.articlesData.filter(function(item) {
        return (
          (item.ARTICLE.PublishStatus.match(status))
        )
      });
      this.tempList = this.processedList;
    },

    // orderBy: function() {
      
    //   }
  }
};
</script>

<style scoped>
.articles {
  margin-left: 200px;
}

hr {
  border: 0.5px solid #dddddd;
  /* margin: 0; */
  width: 70%;
}

h1 {
  font-size: 40px;
  padding: 30px 0 30px 0;
  text-align: center;
}
</style>
