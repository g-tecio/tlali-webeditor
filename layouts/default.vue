<template>
  <div id="everything">
    <!-- <Header /> -->
    <div id="sidebar">
    <Sidebar />
    </div>
    <div id="content">
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
#content {
  left: 100px;
  margin: auto;
  width: 100%;
  align-content: center;
  position: absolute;
}
</style>
