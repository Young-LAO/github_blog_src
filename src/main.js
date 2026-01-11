import Vue from 'vue';
import VueCompositionApi from '@vue/composition-api';
Vue.use(VueCompositionApi);
import Http from './api/api';
import Loading from './components/loading/loading';

import App from './App.vue';
import router from './router';



Vue.config.productionTip = false;
Vue.prototype.$http = Http;
Vue.prototype.$loading = Loading;


new Vue({
  router,
  render: h => h(App),
}).$mount('#app');
