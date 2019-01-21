<template>
  <div class="main-layout">
    <Sidebar/>
    <div class="nuxt-content">
      <nuxt/>
    </div>
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
.nuxt-content {
  margin-left: 200px;
}
</style>
