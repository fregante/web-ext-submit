#!/bin/bash
npm pkg set dependencies.web-ext="^$npm_package_version"
npm pkg set engines.node="$(npm info web-ext engines.node)"
npm pkg set engines.npm="$(npm info web-ext engines.npm)"
