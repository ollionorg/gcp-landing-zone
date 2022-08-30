<template>
  <Wrapper background="element-light" height="80%" width="auto" class="wrap">
    <Container
      class="height-100-per width-100-per"
      background="border"
      direction="column"
      align="center"
      padding="0"
    >
      <Container class="fc-light padding-0" :gap="0">
        <Icon
          name="i-cloud-add"
          size="xxx-large"
          type="filled"
          :effects="false"
        ></Icon>
      </Container>

      <Container class="padding-0" :gap="0">
        <Typography type="h3" weight="black"> Setup Landing Zone </Typography>
      </Container>

      <Container class="padding-0" :gap="0" direction="row">
        <Typography
          weight="light"
          color="light"
          class="fc-light text-align-center fs-16"
        >
          The easiest way to set up and govern a secure, compliant mulit-account
          environment.
        </Typography>
      </Container>
      <Container direction="row" :gap="4">
        <Typography
          weight="light"
          color="light"
          class="fc-light text-align-center fs-16"
        >
          For more details refer this
        </Typography>
        <Typography weight="black" link
          ><a
            :href="userGuideUrl"
            target="_blank"
            rel="noopener noreferrer"
            class="fc-normal"
          >
            user guide</a
          >
        </Typography>
      </Container>
      <Container class="padding-0" :gap="0">
        <Button
          size="normal"
          type="primary"
          state="filled"
          @click="gotoSteupPage"
          :disabled="false"
          :loading="false"
        >
          SETUP NOW
        </Button>
      </Container>
    </Container>
  </Wrapper>
</template>

<script>
import { Container, Icon, Typography, Wrapper, Button } from "@cldcvr/flow";
import { mapState } from "vuex";
export default {
  name: "Example",
  components: { Container, Icon, Typography, Wrapper, Button },
  data() {
    return {
      openSlideout: false,
      userGuideUrl:
        "https://drive.google.com/file/d/1KY_WSmBY3_T5dyMH05WuYZ8siKpDDCZW/view?usp=sharing",
      timer: null,
    };
  },
  computed: {
    ...mapState(["StepperNo"]),
  },
  mounted() {
    this.fetchStepperNo();
    if (this.StepperNo > 1) {
      this.$router.push("/customstepper");
    }
  },
  methods: {
    gotoSteupPage() {
      this.$router.push("/customstepper");
    },
    fetchStepperNo() {
      this.$store.dispatch("getStepper");
    },
  },
};
</script>

<style lang="less" scoped>
.wrap {
  margin: 15px;
  border: 2px dashed #3a4d64;
  border-radius: 4px;
  padding: 15px 12px;
}
</style>
