<template>
  <q-page class="flex flex-center">
    <img alt="Punk! logo" src="~assets/punk_logo.png" />
  </q-page>
</template>

<script>
import { TitleMixin } from "../mixins/TitleMixin.js";
export default {
  name: "Splash",
  title: "Punk! is Loading...",
  mixins: [TitleMixin],
  created() {
    this.$q.loading.show();
  },
  beforeDestroy() {
    this.$q.loading.hide();
  },
  mounted() {
    this.redirect();
  },
  methods: {
    async redirect() {
      await new Promise(r => {
        return setTimeout(r, 1200);
      });
      this.$router.push("/main");
    }
  }
};
</script>
