<template>
  <article class="article-card">
    <nuxt-link v-bind:to="'/articles/' + singleArticle.id">
      <div class="article-card-data">
      <p class="card-left" id="card-title">{{ singleArticle.article.title }}</p>
      <p class="card-right" id="card-date">creado el {{ singleArticle.dt }}</p>
      <p class="card-left" id="card-author"><small>POR</small> {{ singleArticle.author }}</p>
      <div class="status-data">
      <p class="card-right" id="card-status">{{ singleArticle.publishStatus }}</p>
      <div class="status-circle" v-bind:style="{ backgroundColor: status }"></div>
      </div>
      </div>
    </nuxt-link>
    <hr>
  </article>
</template>

<script>
export default {
  name: 'ArticleCard',

  props: ["singleArticle"],

  data: function() {
    return {
      status: ''
    }
  },
  
  created: function() {
    this.status = this.singleArticle.publishStatus;
    this.setStatusColor();
  },

  methods: {
    setStatusColor: function() {
      if(this.status == "Aprobado") {
        this.status = "green";
      } else if(this.status == "Pendiente") {
        this.status = "yellow";
      } else if(this.status == "Rechazado") {
        this.status = "red";
      } else {
        this.status = "blue";
      }
    }
  }
};
</script>

<style scoped>
#card-title {
  color: #444;
  font-size: 18px;
  font-family: 'Segoe UI';
  font-weight: bold;
}

#card-author {
  font-size: 18px;
  color: rgb(61, 61, 61);
  font-weight: bold;
}

#card-date {
  color: #888;
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
  margin: 0 auto 0 auto;
  border: 0.5px solid #dddddd;
  width: 100%;
}

small {
  color: #00000055;
  font-weight: bold;
  font-size: 10px;
}

.article-card-data {
  display: grid;
  grid-template-columns: 70% 30%;
  /* margin: 0 20% 0 20%; */
  padding: 20px;
  align-items: center;
  align-content: center;
}

a {
  color: #000000;
  text-decoration: none;
}

.article-card {
  margin: 0 auto 0 auto;
  width: 60%;
  min-width: 500px;
}

.article-card:hover {
background-color: #f0f0f0;
}

</style>
