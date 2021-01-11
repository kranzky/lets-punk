import { register } from "register-service-worker";

register(process.env.SERVICE_WORKER_FILE, {
  ready() {
    // console.log("App is being served from cache by a service worker.");
  },
  registered(/* registration */) {
    // console.log("Service worker has been registered.");
  },
  cached(/* registration */) {
    // console.log("Content has been cached for offline use.");
  },
  updatefound(/* registration */) {
    // console.log("New content is downloading.");
  },
  updated(/* registration */) {
    // console.log("New content is available; please refresh.");
  },
  offline() {
    // console.log("No internet connection found. App is running offline.");
  },
  error(/* err */) {
    // console.error("Error during service worker registration:", err);
  }
});
