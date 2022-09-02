<template>
  <Container class="width-100-per" direction="column" id="top" padding="35">
    <Breadcrumbs
      :textOnly="true"
      :crumbs="crumbs"
      :max="3"
      color="light"
      @click="handleCrumbClick(...arguments)"
    >
    </Breadcrumbs>

    <!-- TODO Breadcrumbs color change -->
    <Container padding="10px 0px 10px 0px">
      <p>
        <Typography type="h1" weight="black" class="fc-dark width-100-per">
          Setup Landing Zone
        </Typography>
      </p>
    </Container>

    <Container direction="row" :gap="0" padding="10px 0px 10px 0px">
      <Button
        :state="stepObj.step1 ? 'filled' : 'outlined'"
        :class="
          stepObj.step1 && !stepObj.visited1
            ? ''
            : !stepObj.step1 && stepObj.visited1
            ? 'visited'
            : 'not-visited'
        "
        :disabled="false"
        :loading="false"
      >
        STANDARDS
      </Button>
      <Container direction="row" class="width-1-per padding-0" :gap="0">
        <Divider :size="4" :state="show > 1 ? 'primary' : 'gray-100'" />
      </Container>
      <Button
        :state="stepObj.step2 ? 'filled' : 'outlined'"
        :class="
          stepObj.step2 && !stepObj.visited2
            ? ''
            : !stepObj.step2 && stepObj.visited2
            ? 'visited'
            : 'not-visited'
        "
        :disabled="false"
        :loading="false"
      >
        BEST PRACTICES
      </Button>
      <Container direction="row" class="width-1-per padding-0" :gap="0">
        <Divider :size="4" :state="show > 2 ? 'primary' : 'gray-100'" />
      </Container>
      <Button
        :class="
          stepObj.step3 && !stepObj.visited3
            ? ''
            : !stepObj.step3 && stepObj.visited3
            ? 'visited'
            : 'not-visited'
        "
        :state="stepObj.step3 ? 'filled' : 'outlined'"
        :disabled="false"
        :loading="false"
      >
        VARIABLE
      </Button>
      <Container direction="row" class="width-1-per padding-0" :gap="0">
        <Divider :size="4" :state="show > 3 ? 'primary' : 'gray-100'" />
      </Container>
      <Button
        :class="
          stepObj.step4 && !stepObj.visited4
            ? ''
            : !stepObj.step4 && stepObj.visited4
            ? 'visited'
            : 'not-visited'
        "
        :state="stepObj.step4 ? 'filled' : 'outlined'"
        :disabled="false"
        :loading="false"
      >
        PREREQUISITIES
      </Button>
      <Container direction="row" class="width-1-per padding-0" :gap="0">
        <Divider :size="4" :state="show > 4 ? 'primary' : 'gray-100'" />
      </Container>
      <Button
        :class="
          stepObj.step5 && !stepObj.visited5
            ? ''
            : !stepObj.step5 && stepObj.visited5
            ? 'visited'
            : 'not-visited'
        "
        :state="stepObj.step5 ? 'filled' : 'outlined'"
        :disabled="false"
        :loading="false"
      >
        REVIEW
      </Button>
      <Container direction="row" class="width-1-per padding-0" :gap="0">
        <Divider :size="4" :state="show > 5 ? 'primary' : 'gray-100'" />
      </Container>
      <Button
        :class="
          stepObj.step6 && !stepObj.visited6
            ? ''
            : !stepObj.step6 && stepObj.visited6
            ? 'visited'
            : 'not-visited'
        "
        :state="stepObj.step6 ? 'filled' : 'outlined'"
        :disabled="false"
        :loading="false"
      >
        EXECUTION
      </Button>
      <Container direction="row" class="width-1-per padding-0" :gap="0">
        <Divider :size="4" :state="show > 6 ? 'primary' : 'gray-100'" />
      </Container>
      <Button
        :class="
          stepObj.step7 && !stepObj.visited7
            ? ''
            : !stepObj.step7 && stepObj.visited7
            ? 'visited'
            : 'not-visited'
        "
        :state="stepObj.step7 ? 'filled' : 'outlined'"
        :disabled="false"
        :loading="false"
      >
        DEPLOYMENT
      </Button>
      <Container direction="row" class="width-1-per padding-0" :gap="0">
        <Divider :size="4" :state="show > 7 ? 'primary' : 'gray-100'" />
      </Container>
      <Button
        size="normal"
        :class="
          stepObj.step8 && !stepObj.visited8
            ? ''
            : !stepObj.step8 && stepObj.visited8
            ? 'visited'
            : 'not-visited'
        "
        :state="stepObj.step8 ? 'filled' : 'outlined'"
        @click="onComplete"
        :disabled="false"
        :loading="false"
      >
        COMPLETE
      </Button>
    </Container>

    <Container v-if="show === 1" direction="row" padding="10px 0px 10px 0px">
      <StepupLandingZone @onback="onBack" @onNext="OnNext" @cancel="onCancel" />
    </Container>

    <Container v-if="show === 2" padding="10px 0px 10px 0px">
      <BestPractice @onback="onBack" @onNext="OnNext" @cancel="onCancel" />
    </Container>
    <Container v-if="show === 3" padding="10px 0px 10px 0px">
      <Variable @onback="onBack" @onNext="OnNext" @cancel="onCancel" />
    </Container>
    <Container v-if="show === 4" padding="10px 0px 10px 0px">
      <Prerequisities @onback="onBack" @onNext="OnNext" @cancel="onCancel" />
    </Container>
    <Container v-if="show === 5" padding="10px 0px 10px 0px">
      <Review @onback="onBack" @onNext="OnNext" @cancel="onCancel" />
    </Container>
    <Container v-if="show === 6" padding="10px 0px 10px 0px">
      <Execution @onback="onBack" @onNext="OnNext" @cancel="onCancel" />
    </Container>
    <Container v-if="show === 7" padding="10px 0px 10px 0px">
      <Deployment @onback="onBack" @onNext="OnNext" @cancel="onCancel" />
    </Container>
  </Container>
</template>
<script>
import {
  Container,
  Button,
  Typography,
  Breadcrumbs,
  Divider,
} from "@cldcvr/flow";
import StepupLandingZone from "../components/Standard.vue";
import BestPractice from "../components/BestPractice.vue";
import Prerequisities from "../components/Prerequisities.vue";
import Variable from "../components/Variable.vue";
import Review from "../components/Review.vue";
import Deployment from "../components/Deployment.vue";
import Execution from "../components/Execution.vue";
import { mapState } from "vuex";

export default {
  name: "CustomStepper",
  components: {
    Container,
    Button,
    Typography,
    StepupLandingZone,
    Prerequisities,
    BestPractice,
    Variable,
    Review,
    Deployment,
    Execution,
    Divider,
    Breadcrumbs,
  },
  data() {
    return {
      show: 1,
      stepObj: {
        step1: true,
        step2: false,
        step3: false,
        step4: false,
        step5: false,
        step6: false,
        step7: false,
        step8: false,
        visited1: false,
        visited2: false,
        visited3: false,
        visited4: false,
        visited5: false,
        visited6: false,
        visited7: false,
        visited8: false,
      },
      crumbs: [
        {
          icon: {
            name: "i-home",
          },
          label: "Main",
          state: "error",
        },
        {
          emoji: `&#127758;`,
          label: "Setup Landing Zone",
          state: "warning",
        },
      ],
    };
  },
  computed: {
    ...mapState(["StepperNo", "StepperPosition"]),
  },
  mounted() {
    const el = document.getElementById("top");
    el.scrollIntoView({ behavior: "smooth" }); // scroll to top

    this.fetchStepperNo();
    this.show = this.StepperNo;
    if (this.show >= 8) {
      this.$router.push("/completepage");
    }
    if (this.StepperPosition != undefined) {
      this.stepObj = this.StepperPosition;
    }
  },
  methods: {
    handleCrumbClick(clickedCrumb) {
      console.log(clickedCrumb);
    },
    onCancel() {
      this.$store.dispatch("DeteleAll");
      this.$router.push("/home");
    },
    // below is for making stepper backward user to pervious step and storing his data
    onBack(event) {
      const el = document.getElementById("top");
      el.scrollIntoView({ behavior: "smooth" }); // scroll to top

      this.show = event;
      let stepstr = "step" + event;
      let backstep = "step" + (event + 1);
      let visited = "visited" + (event + 1);
      let backvisited = "visited" + event;
      this.show = event;
      this.stepObj[backstep] = false;
      this.stepObj[stepstr] = true;
      this.stepObj[visited] = false;
      this.stepObj[backvisited] = false;
      this.$store.dispatch("setStepperNo", this.show);
      this.$store.dispatch("setStepperPosition", this.stepObj);
      if (this.show >= 7) {
        this.$router.push("/completepage");
      }
    },
    // below is for making stepper forwarding user to next step and storing his data
    OnNext(event) {
      const el = document.getElementById("top");
      el.scrollIntoView({ behavior: "smooth" }); // scroll to top

      let stepstr = "step" + event;
      let backstep = "step" + (event - 1);
      let visited = "visited" + (event - 1);
      this.show = event;
      this.stepObj[backstep] = false;
      this.stepObj[stepstr] = true;
      this.stepObj[visited] = true;
      this.$store.dispatch("setStepperNo", this.show);
      this.$store.dispatch("setStepperPosition", this.stepObj);
      if (this.show >= 8) {
        this.$router.push("/completepage");
      }
    },
    fetchStepperNo() {
      this.$store.dispatch("getStepper");
      this.$store.dispatch("getStepperPosition");
    },

    onComplete() {
      this.show = 8;
      this.$router.push("/completepage");
    },
  },
};
</script>

<style scoped>
.width-1-per {
  width: 1% !important;
}
.not-visited {
  border: 2px solid #7b93b2 !important;
  color: #7b93b2 !important;
}
.breadcrum-color p {
  color: #7b93b2;
}
.visited {
  border: 2px solid #1995ff !important;
}
</style>
