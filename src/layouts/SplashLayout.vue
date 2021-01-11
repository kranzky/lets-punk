<template>
  <q-layout view="hHh lpR fFf">
    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { LoggerMixin } from "../mixins/LoggerMixin.js";
export default {
  name: "SplashLayout",
  mixins: [LoggerMixin],
  created() {
    this.registerPunk();
  },
  beforeDestroy() {
    this.deregisterPunk();
  },
  methods: {
  }
};
</script>
