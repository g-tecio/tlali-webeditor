<template>
  <div>
    <Sidebar />
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
body {
  margin: 0;
}
</style>
