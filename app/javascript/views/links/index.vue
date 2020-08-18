<template>
  <div>
    <ul v-for="link in links" class="list-group">
      <li class="list-group-item" style="border: 2px solid #888; margin-top: 10px; margin-bottom: 10px"> 
        <a :href="'/links/' + link.id">{{ link.title }}</a><br>
        <a :href="link.url">{{ link.url }}</a><br>
        <a :href="'links/' + link.id">Comments</a>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'links-index-view',
  props: {
    links: Array
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