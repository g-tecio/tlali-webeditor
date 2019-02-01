<template>
  <div class="start-screen">
    <iframe
      width="560"
      height="315"
      src="https://www.youtube.com/embed/zEZJ_mLUNPc"
      frameborder="0"
      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
      allowfullscreen
    ></iframe>
  </div>
</template>

<script>
export default {
  name: "Welcome-Page"
};
</script>


<style scoped>
.start-screen {
  margin-left: 200px;
}

.alert {
  font-size: 10px;
  color: #aaaaaa;
}

.login {
  display: flex;
  width: fit-content;
  align-items: center;
  justify-content: center;
  margin: 100px auto 20px auto;
  border-radius: 30px;
  /* border: 1px solid #888888; */
  box-shadow: 0 0 10px 0px #aaaaaa;
}

.label {
  color: #aaa;
  font-size: 20px;
}

.wrap {
  margin: 50px;
  width: 500px;
}

input {
  width: 100%;
  height: 25px;
}

h1,
p {
  text-align: center;
}
</style>