<template>
  <div id="everything">
    <!-- <Header /> -->
    <div class="sidebar">
    <Sidebar />
    </div>
    <div class="content">
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

<style scoped>
.content {
  left: 100px;
  margin: auto;
  width: 100%;
  align-content: center;
  position: absolute;
}
</style>
