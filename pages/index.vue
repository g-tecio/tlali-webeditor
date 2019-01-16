<template>
  <h1>Home Page</h1>
</template>

<script>
export default {
  async asyncData({ $axios }) {
    const ip = await $axios.$get("http://icanhazip.com");
    return { ip };
  }
};
</script>
