function getTitle(vm) {
  const { title } = vm.$options;
  if (title) {
    return typeof title === "function" ? title.call(vm) : title;
  }
}

export const TitleMixin = {
  name: "TitleMixin",
  created() {
    this.$store.dispatch("page/setTitle", getTitle(this));
  }
};
