import Vue from "vue";
import VueRouter from "vue-router";
import { coreRoutes } from "../core";

import { lzRoutes } from "../LZ";

import routePaths from "./routePaths";

Vue.use(VueRouter);

// Redirect to default page
const appRoutes = [{ path: "/", redirect: { name: routePaths.defaultRoute } }];

const routes = [...appRoutes, ...coreRoutes, ...lzRoutes];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

router.beforeEach((to, from, next) => {
  next();
});

export default router;
