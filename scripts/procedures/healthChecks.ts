import { types as T, healthUtil } from "../deps.ts";

export const health: T.ExpectedExports.health = {
  async "web-ui"(effects, duration) {
    return healthUtil.checkWebUrl("http://satellite-personal-node.embassy:80/health")(effects, duration).catch(healthUtil.catchError(effects))
  },
};
