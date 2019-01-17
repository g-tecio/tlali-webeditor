<template>
  <header>
    <nav>
      <ul>
        <li><nuxt-link to="/">Inicio</nuxt-link></li>
        <li><nuxt-link to="/articles">Artículos</nuxt-link></li>
      </ul>
    </nav>
  </header>
</template>

<style>
body {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  margin: 0;
}

a {
  color: #FFFFFF;
  text-decoration: none;
}

header {
  background-color: rgb(59, 140, 221);
  font-size: 20px;
  width: 100%;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}

li {
  margin: 0 10px;
}
</style>
