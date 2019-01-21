<template>
<!-- nuxt-link makes the component to be clickable and links the article to the editor page -->
  <nuxt-link v-bind:to="'/articles/' + id">
    <article class="article-card">
      <div class="article-card-data">
      <!-- <div class="thumbnail" v-bind:style="{backgroundImage: 'url(' + thumbnail + ')'}"></div> -->
      <!-- <div class="thumbnail" style="background-image:url(http://jewel1067.com/wp-content/uploads/news.jpg);"></div> -->
      <p class="card-left" id="card-title">{{ title }}</p>
      <p class="card-right" id="card-date">creado el {{ date }}</p>
      <p class="card-left" id="card-author"><small>POR</small> {{ author }}</p>
      <div class="status-data">
      <p class="card-right" id="card-status">{{ status }}</p>
      <div class="status-circle" v-bind:style="{ backgroundColor: statusColor }"></div>
      </div>
      </div>
    </article>
    <hr>
  </nuxt-link>
</template>

<script>
export default {
  //Values expected by this component, passed from the parent @pages/articles/index.vue
  //Ready to be used on <template>
  props: ["id", "author", "title", "date", "status"],
  data: function() {
    return {
      statusColor: 'red'
    }
  },
  created: function() {
    this.setStatusColor();
  },

  methods: {
    setStatusColor: function() {
      if(this.status == "Aprobado") {
        this.statusColor = "green";
      } else if(this.status == "Pendiente") {
        this.statusColor = "yellow";
      } else if(this.status == "Rechazado") {
        this.statusColor = "red";
      } else {
        this.statusColor = "blue";
      }
    }
  }
};
</script>

<style scoped>
#card-title {
  font-size: 26px;
  font-family: 'Segoe UI';
  font-weight: bold;
}

#card-author {
  font-size: 18px;
}

#card-date {
  color: #888888;
}

#card-status {
  text-transform: uppercase;
}

.status-data {
  font-size: 12px;
  display: grid;
  align-items: center;
  grid-template-columns: auto 40px;
}

.status-circle {
  justify-self: center;
  height: 16px;
  width: 16px;
  background-color: rgb(25, 184, 91);
  border-radius: 50%;
}

/* .card-left {
  background-color: rgb(204, 255, 255);
} */

.card-right {
  text-align: right;
  /* background-color: rgb(255, 238, 208); */
}

hr {
  border: 0.5px solid #dddddd;
  margin: 0 50px 0 50px;
}

small {
  color: #00000055;
  font-weight: bold;
  font-size: 10px;
}

.article-card-data {
  display: grid;
  grid-template-columns: 60% 40%;
  margin: 0 20% 0 20%;
  align-items: center;
  align-content: center;
}

a {
  color: #000000;
  text-decoration: none;
}

.article-card {
  padding: 20px 0 20px;
}

.article-card:hover {
background-color: #f0f0f0;
}

</style>
