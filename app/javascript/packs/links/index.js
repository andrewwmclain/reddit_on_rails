// import Vue from 'vue/dist/vue.js';
import Vue from 'vue'
// import LinksIndexView from 'views/links/index.vue';
import LinksIndexView from 'views/links/index.vue'

// new Vue({
//   el: '#links-index-view',
//   components: {
//       LinksIndexView
//   },
//   data: function() {
//       return({

//       })
//   }
// });

document.addEventListener('DOMContentLoaded', () => {
  const element = document.getElementById("links-index-view")
  const props = JSON.parse(element.getAttribute('data'))

  if (element != null && props != null) {
    const app = new Vue({
      el: '#links-index-view',
      render: h => h(LinksIndexView, {props})
    }).$mount()
    document.body.appendChild(app.$el)
  
    // console.log(app)
  }
})