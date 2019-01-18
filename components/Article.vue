<template>
<!-- nuxt-link makes the component to be clickable and links the article to the editor page -->
  <nuxt-link v-bind:to="'/articles/' + id">
    <article class="article">
      <!-- <div class="thumbnail" v-bind:style="{backgroundImage: 'url(' + thumbnail + ')'}"></div> -->
      <!-- <div class="thumbnail" style="background-image:url(http://jewel1067.com/wp-content/uploads/news.jpg);"></div> -->
      <p class="card-left" id="card-title">{{ title }}</p>
      <p class="card-right" id="card-author"><small>POR</small> {{ author }}</p>
      <p class="card-left" id="card-date">publicado el {{ date }}</p>
      <p class="card-right" id="card-status">{{ status }}</p>
    </article>
  </nuxt-link>
</template>

<script>
export default {
  //Values expected by this component, passed from the parent @pages/articles/index.vue
  //Ready to be used on <template>
  props: ["id", "author", "title", "date", "status"]
};
</script>

<style scoped>
#card-title {
  font-size: 24px;
  font-weight: bold;
}

#card-author {
  font-size: 18px;
}

/* .card-left {
  background-color: rgb(204, 255, 255);
} */

.card-right {
  text-align: right;
  /* background-color: rgb(255, 238, 208); */
}

small {
  font-weight: bold;
  font-size: 10px;
}

p {
  margin:0;
}

a {
  color: #000000;
  text-decoration: none;
}

.article {
  display: grid;
  grid-template-columns: 60% 40%;
  border: 1px solid #cccccc;
  padding: 10px;
  margin: 10px 0 10px 0;
}

.article:hover {
background-color: #f0f0f0;
}

</style>
