import lodash from "lodash";

export default async ({ Vue }) => {
  Vue.prototype.$lodash = lodash;
};
