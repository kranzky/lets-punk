import Vue from "vue";
import Vuex from "vuex";

import page from "./page";

Vue.use(Vuex);

export default function() {
  const Store = new Vuex.Store({
    modules: {
      page
    },
    strict: process.env.DEV
  });

  return Store;
}
