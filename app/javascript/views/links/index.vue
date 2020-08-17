<template>
 <div id="links-index-view">
  {{ link.title }}
 </div>
</template>

<script>
export default {
  name: 'links-index-view',
  props: {
    links: String
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