<template>
  <div class="bg-grey-2">
    <q-layout view="lHh Lpr lFf">
      <q-header elevated>
        <q-toolbar>
          <main-menu-button />
          <q-toolbar-title>{{ pageTitle }}</q-toolbar-title>
        </q-toolbar>
      </q-header>
      <main-menu-drawer />
      <q-page-container>
        <div class="row justify-center bg-accent">
          <router-view class="gf-page col bg-grey-2 shadow-12" />
        </div>
      </q-page-container>
    </q-layout>
  </div>
</template>

<script>
import { LoggerMixin } from "../mixins/LoggerMixin.js";
export default {
  name: "MainLayout",
  mixins: [LoggerMixin],
  components: {
  },
  created() {
    this.registerPunk();
  },
  beforeDestroy() {
    this.deregisterPunk();
  },
  computed: {
    pageTitle: {
      get() {
        return this.$store.state.page.title;
      }
    }
  }
};
</script>

<style lang="stylus" scoped>
.gf-page {
  width: 100%;
  max-width: 720px;
}
</style>
