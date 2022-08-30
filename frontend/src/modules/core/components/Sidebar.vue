<template>
  <div class="flow-sidebar-top-section">
    <SidebarItem>
      <Slab type="bottom-border" :selected="true">
        <Pictogram size="small" class="cursor-pointer">
          <Icon name="cloud" type="filled" :effects="false" />
        </Pictogram>
        <p class="paragraph-1 fc-normal">Landing Zone</p>
      </Slab>
    </SidebarItem>
  </div>
</template>

<script>
import { SidebarItem, Slab, Pictogram, Icon } from "@cldcvr/flow";
import { routePaths } from "../../router";

export default {
  name: "SidebarTopSection",
  components: { SidebarItem, Slab, Pictogram, Icon },
  data() {
    return {
      sideBarMenu: {
        customers: {
          id: 2,
          IconName: "i-user-double",
          type: "filled",
          displayName: "Customers",
          routeTo: routePaths.customers,
        },
        settings: {
          id: 2,
          IconName: "cog",
          type: "filled",
          displayName: "Settings",
          routeTo: routePaths.settings,
        },
      },
      selectedMenu: routePaths.defaultRoute,
    };
  },
  methods: {
    handleDashboards(menuName, menu) {
      this.selectedMenu = menuName;
      this.$router.resolve(menu.routeTo).href !=
        this.$router.currentRoute.path && this.$router.push(menu.routeTo);
    },
    isActive(route) {
      const { path } = route;
      if (path === routePaths.defaultRoute) {
        if (this.path === routePaths.defaultRoute) return true;
      } else if (this.path.includes(path)) return true;

      return false;
    },
  },
  computed: {
    path() {
      return this.$route.path;
    },
  },
};
</script>

<style scoped lang="less">
.sidebar-icon:hover {
  filter: drop-shadow(1px 1px 0 var(--dashboard-primary))
    drop-shadow(-1px -1px 0 var(--dashboard-primary));
}
</style>
