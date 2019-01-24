<template>
  <div class="article-bar">
    <div class="article-config">
    <h1>Configuración de artículo</h1>
    <hr>
    <p><b>ID:</b> {{ id }} </p>
    <p><b>Fecha:</b></p>
    <input type="text" id="date" v-bind:value="dateGiven" disabled>
    <p><b>Autor:</b></p>
    <input type="text" id="author" autocomplete="off" v-bind:value="author">
    <p><b>Estado:</b></p>
    <select id="status" v-bind:value="status">
      <option value="Aprobado" style="background-color:#1FE229">Aprobado</option>
      <option value="Pendiente" style="background-color:#FFE60C">Pendiente</option>
      <option value="Rechazado" style="background-color:#E02F2A">Rechazado</option>
    </select>

    <p><b>Localización:</b></p>
    <input type="text" id="location" autocomplete="off" v-bind:value="location">

    <p><b>Sección:</b></p>
    <input type="text" id="section" autocomplete="off" v-bind:value="section">

    <p><b>Etiquetas:</b></p>
    <input type="text" id="tags" autocomplete="off" v-bind:value="tags">

    <p><b>Imagen:</b> {{ s3dir }} </p>
    <hr>
    <!-- <button class="update-button" type="button" v-on:click="checkUpdate">ACTUALIZAR</button> -->
    <button class="update-button" type="button" v-on:click="$parent.updateArticle($route.params.id)">ACTUALIZAR</button>
    <button class="delete-button" type="button" v-on:click="$parent.deleteArticle()">ELIMINAR</button>
  </div>
  </div>
</template>

<script>
export default {
  name: "ArticleConfig",
  
  props: ["id", "author", "dateGiven", "location", "s3dir", "section", "status", "tags"],

  // data: function() {
  //   return {
  //     date: this.dateGiven,
  //   }
  // },

  // methods: {
  //   checkUpdate: function() {
  //   this.dateGiven == '' ? this.createDate() : this.date = this.dateGiven;
  //     console.log("Date of creation: " + this.date);
  //     this.$parent.updateArticle(this.$route.params.id)
  //   },

    // createDate: function() {
    //   var today = new Date();
    //   this.date = today.getFullYear()
    //     + '-' + this.pad((today.getMonth() + 1), 2)
    //     + '-' + this.pad(today.getDate(), 2)
    //     + ' ' + this.pad(today.getHours(), 2)
    //     + ':' + this.pad(today.getMinutes(), 2)
    //     + ':' + this.pad(today.getSeconds(), 2);
    // },

  //   pad: function(n, width) {
  //     n = n + '';
  //     return n.length >= width ? n : new Array(width - n.length + 1).join(0) + n;
  //   }
  // }
};
</script>


<style scoped>
p {
    margin: 10px 0 10px 0;

}

input, select {
  height: 30px;
  width: 100%;
  border: none;
  outline: none;
}

h1 {
  text-align: center;
  font-size: 20px;
}

.update-button, .delete-button {
  padding: 8px 0 8px 0;
  font-weight: bold;
  color: white;
  border: none;
}

.update-button {
  width: 100%;
  font-size: 12x;
  background-image: linear-gradient(rgb(58, 146, 228), rgb(17, 48, 151));
}

.delete-button {
  font-size: 10px;
  display: block;
  margin: 30px auto auto auto;
  width: 100px;
  background-image: linear-gradient(rgb(228, 58, 58), rgb(151, 17, 17));
}

.article-bar {
  transition: .7s;
  color: #2C3E50;
  background-color: #ECF0F1;
  height: 100%;
  position: fixed;
  right: 0;
  width: 250px;
}

.article-config {
  padding: 15px;
}
</style>