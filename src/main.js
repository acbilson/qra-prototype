import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'

import QRAList from './components/detail/QRAList';
import QRATable from './components/overview/QRATable';

Vue.config.productionTip = false
Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    { path: '/detail', component: QRAList },
    { path: '/overview', component: QRATable }
  ]
});

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
