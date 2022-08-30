<template>
  <div
    class="
      display-flex
      j-c-space-bet
      padding-8
      align-items-center
      width-100-per
      fc-dark
    "
  >
    Cloud Landing Zone
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "Header",
  components: {},
  props: {
    isAdmin: {
      type: Boolean,
      default: false,
    },
  },
  data: () => ({
    openProfile: false,
    location: null,
    weatherDesc: null,
    openWeatherPopover: false,
    weatherInterval: null,
  }),
  computed: {
    ...mapState(["appWeatherInfo", "user"]),
  },
  async created() {
    this.location = await this.getCoordinates();
    // fetch weather every hour
    this.weatherInterval = setInterval(() => {
      this.getWeatherInfo();
    }, 60 * 60 * 60 * 1000);
  },
  beforeDestroy() {
    clearInterval(this.weatherInterval);
    this.$store.dispatch("clearAppWeatherInfo");
  },
  methods: {
    getCoordinates() {
      const options = {
        enableHighAccuracy: true,
        timeout: Infinity,
        maximumAge: 0,
      };
      this.$getLocation(options)
        .then((coordinates) => {
          this.location = coordinates;
          this.getWeatherInfo();
        })
        .catch((e) => console.log(e));
    },
    async getWeatherInfo() {
      await this.$store.dispatch("fetchAppWeatherInfo", {
        latitude: this.location.lat,
        longitude: this.location?.lng,
      });
      if (!this.appWeatherInfo?.weather) return;
      // Set weather data and temperature from API response array
      this.weatherDesc = `${this.appWeatherInfo?.weather
        .map((w) => w.main)
        .join(", ")}
        - ${this.appWeatherInfo?.main?.temp} °C`;
    },
  },
};
</script>

<style lang="less" scoped></style>
