export const LoggerMixin = {
  name: "LoggerMixin",
  methods: {
    registerPunk() {
      this.$root.$on("punk:response", this.logResponse);
      this.$root.$on("punk:error", this.logError);
    },
    deregisterPunk() {
      this.$root.$off("punk:response", this.logResponse);
      this.$root.$off("punk:error", this.logError);
    },
    logResponse(response) {
      let message = "Received response.";
      if (response.data && response.data.message) {
        message = response.data.message;
        if (process.env.DEV) {
          console.info(message); // eslint-disable-line no-console
        }
        this.$q.notify({
          color: "info",
          icon: "info",
          message: message
        });
      }
    },
    logError(error) {
      let message = "An error occurred.";
      let errors = [];
      if (error.response && error.response.data) {
        let data = error.response.data;
        if (typeof data == "object") {
          message = data.message;
          errors = data.errors;
        } else {
          message = data;
        }
      }
      if (process.env.DEV) {
        console.error(message); // eslint-disable-line no-console
      }
      this.$q.notify({
        color: "negative",
        icon: "report_problem",
        message: message
      });
      errors.forEach(message => {
        if (process.env.DEV) {
          console.warn(message); // eslint-disable-line no-console
        }
        this.$q.notify({
          color: "warning",
          icon: "report_problem",
          message: message
        });
      });
    }
  }
};
