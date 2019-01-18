<template>
    <nav id="sidebar">
      <nuxt-link id="start" to="/">
      <img src="@/assets/logo.png" alt="Tlali">
      </nuxt-link>
      <ul>
        <li><nuxt-link to="/Articulos/">Inicio</nuxt-link></li>
        <li><nuxt-link to="/Aprobado">Aprobados</nuxt-link></li>
        <li><nuxt-link to="/Pendiente">Pendientes</nuxt-link></li>
        <li><nuxt-link to="/Rechazado">Rechazados</nuxt-link></li>
      </ul>
    </nav>
</template>

<style scoped>
a {
  color: white;
  text-decoration: none;
}

img {
  display: block;
  margin: auto;
  width: 100px;
}

ul {
  padding: 0;
}

li {
  padding: 10px;
  list-style: none;
  text-align: center;
}

#sidebar {
  height: 100%;
  width: 200px;
  position: fixed;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}
</style>
