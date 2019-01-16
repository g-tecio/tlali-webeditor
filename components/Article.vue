<template>
<!-- nuxt-link makes the component to be clickable and links the article to the editor page -->
  <nuxt-link v-bind:to="'/articles/' + id">
    <article class="article" v-bind:style="{backgroundColor:color}">
      <!-- <div class="thumbnail" v-bind:style="{backgroundImage: 'url(' + thumbnail + ')'}"></div> -->
      <!-- <div class="thumbnail" style="background-image:url(http://jewel1067.com/wp-content/uploads/news.jpg);"></div> -->
      <h1>{{ title }}</h1>
      <h2>{{ author }}</h2>
    </article>
    <!-- display hides the delete for the New Article component -->
    <nuxt-link class="delete" v-bind:style="{display:display}" v-bind:to="'/articles/delete/' + id"> 
      <b>X</b>
    </nuxt-link>
  </nuxt-link>
</template>

<script>
export default {
  //Values expected by this component, passed from the parent @pages/articles/index.vue
  //Ready to be used on <template>
  props: ["id", "author", "title", "color", "display"]
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

.delete {
  padding: 4px 6px 4px 6px;
  float: right;
  color: white;
  left: 50px;
  top: -55px;
  background-color: rgb(185, 34, 34);
  position: relative;
}

.article {
  text-align: center;
  border: 1px solid #cccccc;
  margin: 10px;
}

.article:hover {
background-color: rgb(204, 241, 255);
}

</style>
