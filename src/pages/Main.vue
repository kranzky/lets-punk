<template>
  <q-page>
    <transition appear enter-active-class="animated fadeIn" leave-active-class="animated fadeOut">
      <splash v-if="showSplash" />
      <home v-else/>
    </transition>
  </q-page>
</template>

<script>
import { TitleMixin } from "../mixins/TitleMixin.js"
export default {
  name: "Main",
  title: "Let's Punk! v" + process.env.PACKAGE_VERSION,
  mixins: [TitleMixin],
  data () {
    return {
      showSplash: !process.env.DEV
    }
  },
  mounted() {
    if (this.showSplash) {
      setTimeout(() => {
        this.showSplash = false
      }, 1500)
    }
  },
  components: {
    "splash": () => import("components/SplashComponent.vue"),
    "home": () => import("components/HomeComponent.vue")
  }
}
</script>

<style lang="stylus">
</style>
