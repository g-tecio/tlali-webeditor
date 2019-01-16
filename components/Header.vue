<template>
<!-- Navigation bar -->
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
  margin: 0;
}

a {
  text-decoration: none;
}

header {
  background-color: #f0f0f0;
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
