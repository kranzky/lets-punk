<template>
  <div class="fixed-center text-center">
    <p>
      <img src="~assets/fail_logo.png" style="width:60vw;max-width:1024px;" />
    </p>
    <p class="text-faded">Mic Drop :(</p>
    <q-btn color="secondary" style="width:200px;" @click="$router.push('/')">Go back</q-btn>
  </div>
</template>

<script>
import { TitleMixin } from "../mixins/TitleMixin.js";
export default {
  name: "Error404",
  title: "Sad Punk :(",
  mixins: [TitleMixin]
};
</script>
