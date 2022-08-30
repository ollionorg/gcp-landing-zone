<template>
  <Layout
    :mode="`${theme}-mode`"
    :theme="`${theme}-theme`"
    :open-sidebar.sync="isSideBarOpen"
  >
    <template #navbar><Header /></template>
    <template #sidebar><Sidebar /></template>
    <div class="height-100-per">
      <router-view />
    </div>
  </Layout>
</template>
<script>
import { Layout } from "@cldcvr/flow";
import { Header, Sidebar } from "../core/components";

export default {
  name: "App",
  data: () => ({
    theme: "dark",
    isSideBarOpen: false,
  }),
  components: {
    Layout,
    Header,
    Sidebar,
  },
  computed: {},
  methods: {
    removed() {
      // Take action after removing notification
    },
  },
};
</script>

<style lang="less" scoped></style>
<style>
div.flow-layout > div.flow-layout-body > div.flow-layout-sidebar[open] {
  width: 16em;
}
@import url("https://cldcvr.com/product-fonts/835631/DBEF18FBD3B7721D4.css");

/* TODO: Replace this with similar free font ask @percy */
:root {
  --number-font: "Tungsten A", "Tungsten B";
  --body-font: "Gotham SSm A", "Gotham SSm B";
}
</style>
