<template>
  <div class="filters-box">

  <div class="selectors">
    <input type="text" placeholder="Buscar..." v-model="searchTerm">
    <select class="status" v-model="statusFilter">
      <option value="">Todos</option>
      <option value="Aprobado">Aprobados</option>
      <option value="Pendiente">Pendientes</option>
      <option value="Rechazado">Rechazados</option>
    </select>

    <select class="sort-by" v-model="sortFilter">
      <option value="Title">Título</option>
      <option value="Date">Fecha</option>
    </select>

    <select class="order" v-model="sortOrder">
      <option value="asc">Ascendente</option>
      <option value="desc">Descendente</option>
    </select>
  </div>

  </div>
</template>

<script>
export default {
  name: "Filtering",

  data: function() {
    return {
      searchTerm: '',
      statusFilter: '',
      sortFilter: 'Date',
      sortOrder: 'asc'
    }
  },

  watch: {
    searchTerm: function() {
      this.$parent.filterBySearch(this.searchTerm);
    },

    statusFilter: function() {
      this.$parent.filterByStatus(this.statusFilter);
    },

    sortFilter: function() {
      this.$parent.setSortKey(this.sortFilter);
    },

    sortOrder: function() {
      this.$parent.setSortOrder(this.sortOrder);
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

.selectors {
  display: flex;
  align-items: center;
  justify-content: center;
}

select {
  margin: 10px;
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
