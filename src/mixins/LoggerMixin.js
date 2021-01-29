export const LoggerMixin = {
  name: "LoggerMixin",
  methods: {
    registerPunk() {
      this.$root.$on("punk:info", this.logInfo)
      this.$root.$on("punk:success", this.logSuccess)
      this.$root.$on("punk:error", this.logError)
    },
    deregisterPunk() {
      this.$root.$off("punk:info", this.logInfo)
      this.$root.$off("punk:success", this.logSuccess)
      this.$root.$off("punk:error", this.logError)
    },
    showNotification(type, message) {
      this.$q.notify({
        type: type,
        message: message,
        position: 'bottom-left',
        timeout: 10000,
        actions: [{ icon: 'close', color: 'white' }]
      })
    },
    logInfo(response) {
      let message = response
      if (response.data && response.data.message) {
        message = response.data.message
      }
      if (process.env.DEV) {
        console.debug(message) // eslint-disable-line no-console
      }
      this.showNotification('info', message)
    },
    logSuccess(response) {
      let message = response
      if (response.data && response.data.message) {
        message = response.data.message
      }
      if (process.env.DEV) {
        console.info(message) // eslint-disable-line no-console
      }
      this.showNotification('positive', message)
    },
    logError(error) {
      let message = error
      let errors = []
      if (error.response && error.response.data) {
        let data = error.response.data
        if (typeof data == "object") {
          message = data.message
          errors = data.errors
        } else {
          message = data
        }
      }
      if (process.env.DEV) {
        console.error(message) // eslint-disable-line no-console
      }
      this.showNotification('negative', message)
      errors.forEach(message => {
        if (process.env.DEV) {
          console.warn(message) // eslint-disable-line no-console
        }
        this.showNotification('warning', message)
      })
    }
  }
}
