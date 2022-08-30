const coreRoutes = [
  {
    path: "*",
    name: "notFound",
    component: () =>
      import(/* webpackChunkName: "NotFound" */ "../core/views/NotFound.vue"),
  },
];

export default coreRoutes;
