<template>
    <nav class="sidebar">
      <nuxt-link to="/">
      <img src="@/assets/logo.png" alt="Tlali">
      </nuxt-link>
      <ul>
        <li><nuxt-link class="nav-link" to="/Articulos/">Inicio</nuxt-link></li>
        <li><nuxt-link class="nav-link" to="/Aprobados">Aprobados</nuxt-link></li>
        <li><nuxt-link class="nav-link" to="/Pendientes">Pendientes</nuxt-link></li>
        <li><nuxt-link class="nav-link" to="/Rechazados">Rechazados</nuxt-link></li>
      </ul>
    </nav>
</template>

<style scoped>
img {
  display: block;
  margin: 20px auto 20px auto;
  width: 100px;
}

li {
  list-style: none;
}

ul {
  padding: 0;
}

.sidebar {
  background-color: #111;
  height: 100%;
  position: fixed;
  text-align: center;
  width: 200px;
}

.nav-link {
  color: white;
  display: block;
  padding: 10px;
  text-decoration: none;
}

.nav-link:hover {
  color:black;
  background-color: white;
}
</style>
