<template>
<div class="editor">
  <input type="text" id="title" placeholder="Título" autocomplete="off" v-bind:value="title">
  <textarea id="content" class="autoExpand" placeholder="Comienza aquí..." rows="7" cols="50" v-bind:value="content"></textarea>
</div>
</template>

<script>
export default {
  name: "Editor",
  props: ["title", "content"]
}
</script>


<style>
#title {
  font-size: 30px;
  font-weight: bolder;
}

#content {
  font-size: 20px;
}

input,
textarea {
  box-sizing: border-box;
  font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  border: none;
  /* border: 1px solid #cccccc; */
  outline: none;
  width: 100%;
  margin-block-start: 2px;
  margin-block-end: 2px;
}

textarea {
  resize: none;
  height: 80vh;
}
</style>
