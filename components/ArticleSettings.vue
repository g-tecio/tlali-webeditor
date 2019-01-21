<template>
  <div class="article-bar">
    <div class="article-config">
    <h1>Configuración de artículo</h1>
    <hr>
    <p><b>ID:</b> {{ id }} </p>
    <p><b>Fecha:</b> {{ date }}</p>
    <input type="date" id="date">
    <p><b>Autor:</b> {{ author }}</p>
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
  </div>
  </div>
</template>

<script>
export default {
  props: ["id", "author", "date", "status", "location", "section", "tags"]
}
</script>


<style scoped>
p {
    margin: 10px 0 10px 0;

}

input, select {
  width: 100%;
}

h1 {
  text-align: center;
  font-size: 20px;
}

.article-bar {
  transition: .7s;
  color: white;
  background-color: rgb(17, 17, 17);
  height: 100%;
  position: fixed;
  right: 0;
  width: 250px;
}

.article-config {
  padding: 15px;
}
</style>
