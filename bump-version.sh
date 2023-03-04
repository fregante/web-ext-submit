#!/bin/bash
npx dot-json package.json dependencies.web-ext "^$npm_package_version"
npx dot-json package.json engines.node "$(npm info web-ext engines.node)"
npx dot-json package.json engines.npm "$(npm info web-ext engines.npm)"
