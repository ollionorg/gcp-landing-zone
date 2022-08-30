const lzRoutes = [
  {
    path: "/home",
    name: "home",
    component: () =>
      import(/* webpackChunkName: "Home" */ "./views/Home.vue"),
  },
  {
    path:'/customstepper',
    name:"customstepper",
    component:()=>
      import(/* webpackChunkName: "CustomStepper" */ "./views/CustomStepper.vue"),
    
  },
  {
    path:'/completepage',
    name:"completepage",
    component:()=>
      import(/* webpackChunkName: "CompletePage" */ "./views/CompletePage.vue"),
    
  },

];

export default lzRoutes;
