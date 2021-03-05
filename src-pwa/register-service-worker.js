import { register } from 'register-service-worker'
import { Notify, Loading } from 'quasar'

register(process.env.SERVICE_WORKER_FILE, {
  registrationOptions: { scope: './' },

  ready (/* registration */) {
  },

  registered (/* registration */) {
  },

  cached (/* registration */) {
  },

  updatefound (/* registration */) {
  },

  updated (/* registration */) {
    Notify.create({
      message: 'A new version is available!',
      icon: 'cloud_download',
      timeout: 15000,
      actions: [{
        label: 'Update Now',
        color: 'secondary',
        handler: () => {
          Loading.show()
          window.location.reload(true)
        }
      }]
    })
  },

  offline () {
  },

  error (err) {
    console.error(err) // eslint-disable-line no-console
  }
})
