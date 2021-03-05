export function setTitle (store, title) {
  const root = this.$router.app
  if (root.$lodash.isUndefined(title)) {
    title = "Let's Punk!"
  }
  this.commit('page/title', title)
}
