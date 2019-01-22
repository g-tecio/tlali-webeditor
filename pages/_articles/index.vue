<template>
  <section class="articles">
    <h1> {{ $route.params.articles }} </h1>

      <!-- Whenever searchRecords is emmited from the child component SearchBox,
      execute searchArticles from this index.vue component-->

    <SearchBox
      v-on:searchRecords="searchArticles"/>

    <hr>

    <Article
      v-for="article in articlesList"
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
import SearchBox from "@/components/SearchBox";

export default {
  name: 'MainApp',

  data: function() {
    return {
      searchTerms: ''
    }
  },

  components: {
    Article,
    SearchBox
  },

  methods: {
    searchArticles: function(terms) {
      this.searchTerms = terms;
    }
  },

  computed: {
    // Return articleList according to the search terms from the search box.
    // If terms is empty, then return full list of articles.
    articlesList: function() {
      return this.articlesData.filter(function(item) {
        return ( //If any of the following matchs returns true, the article is added to articleList
          (item.ARTICLE.Title.toLowerCase().match(this.searchTerms.toLowerCase())) || //Search on the Title
          (item.ARTICLE.Author.toLowerCase().match(this.searchTerms.toLowerCase())) //Search on the Author
        )
      }.bind(this));
    }
  },

async asyncData({ $axios, params }) {
    if(params.articles == "Articulos") {
      const articlesData = await $axios.$get(
        "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/");
      return { articlesData };
    } else {
        const articlesData = await $axios.$get(
          "https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/publishstatus/" + params.articles.slice(0, -1)); //Trim the last letter to make correct URL
        return { articlesData };
    }
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css?family=Courgette');
.articles {
  margin-left: 200px;
}

hr {
  border: 0.5px solid #dddddd;
  margin: 0;
}

h1 {
  font-size: 40px;
  padding: 30px 0 30px 0;
  font-family: 'Courgette', cursive;
  text-align: center;
}
</style>
