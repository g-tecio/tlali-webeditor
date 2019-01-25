<template>
  <section class="articles">
    <h1>Historias</h1>

    <ArticlesFilter />

    <hr>

    <ArticleCard
      v-for="article in processedList"
      v-bind:key="article.id"
      v-bind:singleArticle="article" />
  </section>
</template>

<script>
import ArticleCard from "@/components/ArticleCard";
import ArticlesFilter from "@/components/ArticlesFilter";

export default {
  name: 'ArticleList',

  data: function() {
    return {
      processedList: [],
      tempList: [],
      sortKey: '',
      sortOrder: ''
    }
  },

  created: function() {
    this.processedList = this.articlesData;
    this.tempList = this.articlesData;
},

  components: {
    ArticleCard,
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
        (item.article.title.toLowerCase().match(terms.toLowerCase())) || //Search on the Title
        (item.author.toLowerCase().match(terms.toLowerCase())) //Search on the Author
      )
    });
  },

  filterByStatus: function(status) {
    this.processedList = this.articlesData.filter(function(item) {
      return (
        (item.publishStatus.match(status))
      )
    });
    this.tempList = this.processedList;
  },

  setSortKey: function(sortSent) {
    this.sortKey = sortSent;
    this.sortArticles(this.sortKey, this.sortOrder);
  },

  setSortOrder: function(orderSent) {
    this.sortOrder = orderSent;
    this.sortArticles(this.sortKey, this.sortOrder);
  },

  sortArticles: function(key, order) {
    this.processedList = this.processedList.sort(function(a, b) { 
        if (key == "title") {
          if(order == "asc")
            return (a.article.title > b.article.title) ? 1 : ((a.article.title < b.article.title) ? -1 : 0);
          else 
            return (b.article.title > a.article.title) ? 1 : ((b.article.title < a.article.title) ? -1 : 0);
        } else {
          if (order == "asc")
            return (a.dt > b.dt) ? 1 : ((a.dt < b.dt) ? -1 : 0);
          else
            return (b.dt > a.dt) ? 1 : ((b.dt < a.dt) ? -1 : 0);
          }
    });
  }
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
