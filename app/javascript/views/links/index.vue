<template>
 <div id="links-index-view">
  <p>{{ message }}</p>
 </div>
</template>

<script>
export default {
  name: 'links-index-view',
  props: {
    message: String
  },
  data: function () {
    return {
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>