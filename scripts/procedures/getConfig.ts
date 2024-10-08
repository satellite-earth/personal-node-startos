// To utilize the default config system built, this file is required. It defines the *structure* of the configuration file. These structured options display as changeable UI elements within the "Config" section of the service details page in the StartOS UI.

import { compat } from "../deps.ts";

export const [getConfig, setConfigMatcher] = compat.getConfigAndMatcher({
  "tor-address": {
    name: "Tor Address",
    description: "The Tor address of the node and relay interface",
    type: "pointer",
    subtype: "package",
    "package-id": "satellite-personal-node",
    target: "tor-address",
    interface: "main",
  },
});
