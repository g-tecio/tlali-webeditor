<template>
  <div class="filters-box">
    <input type="text" placeholder="Buscar..." v-model="searchTerm">
  <div class="selectors">
    <select class="status" v-model="currentStatus">
      <option value="">Todos</option>
      <option value="Aprobado">Aprobados</option>
      <option value="Pendiente">Pendientes</option>
      <option value="Rechazado">Rechazados</option>
    </select>

    <select class="sort-by" v-model="currentSort">
      <option value="Title">Título</option>
      <option value="Date">Fecha</option>
    </select>
    <select class="order" v-model="currentOrder">
      <option value="asc">Ascendente</option>
      <option value="desc">Descendente</option>
    </select>
  </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      searchTerm: '',
      currentStatus: '',
      currentSort: 'Date',
      currentOrder: 'asc'
    }
  },
  watch: {
    searchTerm: function() {
      this.$emit('searchRecords', this.searchTerm);
    },

    currentStatus: function() {
      this.$emit('filterStatus', this.currentStatus);
    }
  }
}
</script>


<style scoped>
.filters-box {
  display: block;
  margin: auto;
  width: 70%;
  min-width: 200px;
}

select {
  margin: 10px 5px 10px 5px;
  height: 40px;
  width: 140px;
}

input {
  padding: 0 10px 0 10px;
  outline: none;
  border: none;
  background-color: #eee;
  font-size: 20px;
  height: 50px;
  width: 100%;
}
</style>
