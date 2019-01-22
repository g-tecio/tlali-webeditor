<template>
  <div>
    <input type="text" placeholder="Buscar..." v-model="searchTerm">
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      searchTerm: ''
    }
  },
  watch: {
    searchTerm: function() {
      this.$emit('searchRecords', this.searchTerm);
    }
  }
}
</script>


<style scoped>
div {
  margin: 10px;
}

input {
  padding: 0 10px 0 10px;
  outline: none;
  border: none;
  background-color: #eee;
  font-size: 20px;
  margin: auto;
  display: block;
  height: 50px;
  width: 60%;
  min-width: 200px;
}
</style>
