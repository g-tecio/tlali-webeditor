<template>
    <nav class="sidebar">
      <nuxt-link to="/">
      <img src="@/assets/logo.png" alt="Tlali">
      </nuxt-link>
      <ul>
        <li><nuxt-link class="nav-link" to="/Articulos/Nuevo">Nueva historia</nuxt-link></li>
        <li><nuxt-link class="nav-link" to="/Articulos/">Artículos</nuxt-link></li>
      </ul>
    </nav>
</template>

<script>
export default {
  name: "NavigationBar"
}
</script>


<style scoped>
img {
  display: block;
  margin: 20px auto 20px auto;
  width: 150px;
}

ul {
  padding: 0;
}

li {
  font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  font-weight: bold;
  list-style: none;
  font-size: 16px;
  text-transform: uppercase;
}

.sidebar {
  background-color: #3498DB;
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
  transition: 0.5s;
  /* color:black; */
  background-color: #FFFFFF30;
}
</style>
