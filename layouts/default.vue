<template>
  <div class="main-layout">
    <Sidebar/>
    <nuxt/>
  </div>
</template>

<script>
import Sidebar from '@/components/Sidebar'
export default {
  components: {
    Sidebar
  }
}
</script>

<style>
body, h1, h2, p {
  margin: 0;
}
</style>
