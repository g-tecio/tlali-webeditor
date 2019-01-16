<template>
<!-- nuxt-link makes the component to be clickable and links the article to the editor page -->
  <nuxt-link v-bind:to="'/articles/' + id">
    <article class="article">
      <!-- <div class="thumbnail" v-bind:style="{backgroundImage: 'url(' + thumbnail + ')'}"></div> -->
      <!-- <div class="thumbnail" style="background-image:url(http://jewel1067.com/wp-content/uploads/news.jpg);"></div> -->
      <h1>{{ title }}</h1>
      <h2>by {{ author }}</h2>
    </article>
  </nuxt-link>
</template>

<script>
export default {
  //Values expected by this component, passed from the parent @pages/articles/index.vue
  //Ready to be used on <template>
  props: ["id", "author", "title"]
};
</script>

<style scoped>
a {
  color: #000000;
  text-decoration: none;
}

h1 {
  font-size: 20px;
  margin-block-start: 5px;
  margin-block-end: 5px;
}

h2 {
  font-size: 12px;
  margin-block-end: 5px;
  margin-block-end: 5px;
}

.article {
  text-align: center;
  border: 1px solid #cccccc;
  margin: 10px;
}
</style>
