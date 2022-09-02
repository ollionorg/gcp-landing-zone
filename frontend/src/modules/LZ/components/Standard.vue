<template>
  <Wrapper class="wrap padding-0" borderRadius="4px">
    <Popup
      headerText="Are You Sure?"
      :headerBody="body"
      :CancelFlag="true"
      :OpenModelFlag="openModalFlag"
      :bodyTextFlag="false"
      :IconName="iconname"
      @proceed="onProceed"
      @cancelPopup="onPopupcancel"
      ButtonText="YES, PROCEED"
    />

    <Wrapper borderRadius="4px" background="border">
      <Container
        :padding="20"
        direction="column"
        :gap="10"
        class="height-50-vh width-100-per"
        align="top"
      >
        <Typography type="h3" weight="medium" class="fc-dark">
          Standards
        </Typography>
        <Container class="fc-default padding-0" :gap="0">
          <Typography>
            The detailed documentation on the GCIFI LZ adherence to the existing
            standards is in progress and will be available in the next release.
          </Typography>
        </Container>
      </Container>
    </Wrapper>
<!-- commented for current release -->
    <!-- <Container padding="20px 0px 10px 0px" direction="row" :gap="15">
      <Checkbox
        :size="size"
        :state="state"
        :checked.sync="standardCheck"
        @click="onStandardcheck"
        :disabled="true"
      >
      </Checkbox>
      <Typography type="p2">
        I Acknowledge and agree to the Best Practices shared above.
      </Typography>
    </Container> -->
    <Container padding="10px 0px 10px 0px" align="right">
      <Typography
        type="p2"
        weight="light"
        color="error"
        :class="{ invisible: showError }"
      >
        {{ errorText }}
      </Typography>
    </Container>

    <Container padding="10px 0px 10px 0px" align="space-between">
      <Button state="outlined" @click="onCancel"> CANCEL </Button>
      <Container padding="0">
        <Button state="outlined" @click="onBack"> BACK </Button>
        <Button @click="onNext"> NEXT </Button>
      </Container>
    </Container>
  </Wrapper>
</template>

<script>
import { Wrapper, Typography, Container, Button } from "@cldcvr/flow";
import Popup from "./Popup.vue";
import { mapState } from "vuex";
export default {
  name: "StepupLandingZone",
  components: {
    Wrapper,
    Typography,
    Container,
    Button,
    Popup,
  },
  data() {
    return {
      openSlideout: false,
      standardCheck: false,
      showError: true,
      timer: null,
      iconname: "i-tree",
      errorText: "To proceed, please tick the acknowledgement",
      body: "By proceeding, you will lose all inputs and statuses and will need to re-setup the Landing Zone from start.",
      openModalFlag: false,
    };
  },
  computed: {
    ...mapState(["StandardAck"]),
  },
  mounted() {
    this.fetchStandardAck();
    this.standardCheck = this.StandardAck;
  },
  methods: {
    onCancel() {
      this.openModalFlag = true;
    },
    onProceed() {
      this.$emit("cancel");
    },
    onPopupcancel() {
      this.openModalFlag = false;
    },
    onBack() {
      this.$emit("onback", 1);
    },
    onNext() {
      // if (this.standardCheck) {
      this.showError = true;
      this.$emit("onNext", 2);
      // } else this.showError = false;
      this.$store.dispatch("setStandardAck", this.standardCheck);
    },
    onStandardcheck() {
      this.showError = this.standardCheck;

      this.$store.dispatch("setStandardAck", this.standardCheck);
    },
    fetchStandardAck() {
      this.$store.dispatch("getStandardAck");
    },
  },
};
</script>

<style lang="less" scoped>
.invisible {
  visibility: hidden;
}
</style>
