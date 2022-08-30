import Vue from "vue";
import { App, router, store } from "@/modules/app";
import VueGeolocation from "vue-browser-geolocation";
import VTooltip from "v-tooltip";
// import "@cldcvr/flow/dist/style.css";
Vue.use(VueGeolocation);
Vue.use(VTooltip);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
