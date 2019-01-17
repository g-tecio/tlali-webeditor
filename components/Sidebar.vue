<template>
    <nav id="sidebar">
      <h1>TLALI</h1>
      <ul>
        <li><nuxt-link to="/articles">Inicio</nuxt-link></li>
        <li><nuxt-link to="/articles/Aproved">Aprobados</nuxt-link></li>
        <li><nuxt-link to="/articles/Pending">Pendientes</nuxt-link></li>
        <li><nuxt-link to="/articles/Rejected">Rechazados</nuxt-link></li>
      </ul>
    </nav>
</template>

<style scoped>
a {
  color: white;
  text-decoration: none;
}

h1 {
  color: white;
  text-align: center
}

li {
  padding: 5px;
  list-style: none;
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
