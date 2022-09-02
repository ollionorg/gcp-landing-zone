<template>
  <Wrapper class="wrap padding-0" borderRadius="4px">
    <Popup
      headerText="Are You Sure?"
      :headerBody="body"
      :CancelFlag="true"
      :OpenModelFlag="openModalFlag"
      :IconName="iconname"
      :bodyTextFlag="false"
      @proceed="onProceed"
      @cancelPopup="onPopupcancel"
      ButtonText="YES, PROCEED"
    />
    <Wrapper borderRadius="4px" background="border">
      <Container direction="column" padding="30">
        <Typography type="h3" weight="medium" color="dark">
          Execution of Wrapper Scripts
        </Typography>
        <Typography weight="light" color="light">
          Simply follow the steps to setup and update the statuses individually
          to easily keep track of your progress
        </Typography>

        <Container direction="column" padding="0">
          <Container direction="row" padding="10px 0px 0px 0px">
            <Typography
              type="h3"
              weight="medium"
              color="dark"
              class="width-5-per"
            >
              No.
            </Typography>

            <Typography
              type="h3"
              weight="medium"
              color="dark"
              class="width-15-per"
            >
              Status
            </Typography>
            <Typography
              type="h3"
              weight="medium"
              color="dark"
              class="padding-tp-10"
            >
              Requirement
            </Typography>
          </Container>

          <Divider />

          <Container
            direction="row"
            align="left top"
            padding="10px 0px 10px 10px"
          >
            <Typography
              type="h3"
              weight="book"
              color="dark"
              class="width-5-per"
            >
              1.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="execuSwitch.switch1"
                  @click="makeActive('check1', 'switch1')"
                  type="checkbox"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container direction="column" class="padding-0 width-80-per">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                Add relevant values to the terraform.tfvars of
                <span class="bg">0-bootstrap</span> in the new branch.
              </Typography>
            </Container>
          </Container>

          <Divider />

          <Container
            direction="row"
            align="left top"
            padding="10px 0px 10px 10px"
          >
            <Typography
              type="h3"
              weight="book"
              color="dark"
              class="width-5-per"
            >
              2.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="execuSwitch.switch2"
                  @click="makeActive('check2', 'switch2')"
                  :disabled="AllowChecks.check1"
                  type="checkbox"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container direction="column" class="padding-0 width-80-per">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                Add correct billing ID in the terraform.tfvars file for the
                initial deployment of the 0-bootstrap stage.
              </Typography>
            </Container>
          </Container>

          <Divider />

          <Container
            direction="row"
            align="left top"
            padding="10px 0px 10px 10px"
          >
            <Typography
              type="h3"
              weight="book"
              color="dark"
              class="width-5-per"
            >
              3.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="execuSwitch.switch3"
                  @click="makeActive('check3', 'switch3')"
                  :disabled="AllowChecks.check2"
                  type="checkbox"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container direction="column" class="padding-0 width-80-per">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                Setup <span class="bg">GH_TOKEN</span> as
                <span class="bg">$GITHUB_PAT</span> environment variable and
                execute the wrapper script using below command <br />
                (Ensure <span class="bg">.terraform</span> directories created
                locally from previous runs are deleted):
              </Typography>
              <Wrapper borderRadius="2px" background="element">
                <Logs
                  content="$ cd ./prerequisites/scripts

$ read -s token
<enter_github_token_obtained_in_step_9>

$ export GITHUB_PAT=$token

$ chmod +x wrapper.sh ; ./wrapper.sh"
                  :showSearch="false"
                  contentType="string"
                />
              </Wrapper>
            </Container>
          </Container>

          <Divider />

          <Container
            direction="row"
            align="left top"
            padding="10px 0px 10px 10px"
          >
            <Typography
              type="h3"
              weight="book"
              color="dark"
              class="width-5-per"
            >
              4.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="execuSwitch.switch4"
                  @click="makeActive('check4', 'switch4')"
                  :disabled="AllowChecks.check3"
                  type="checkbox"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container direction="column" class="padding-0 width-80-per">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                After execution of wrapper script, add cloudbuild service
                account from cicd project as a principal in the billing account
                with
                <span class="bg">billing.administrator</span> and
                <span class="bg">billing.user</span>
              </Typography>
            </Container>
          </Container>

          <Divider />

          <Container
            direction="row"
            align="left top"
            padding="10px 0px 10px 10px"
          >
            <Typography
              type="h3"
              weight="book"
              color="dark"
              class="width-5-per"
            >
              5.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="execuSwitch.switch5"
                  @click="makeActive('check5', 'switch5')"
                  :disabled="AllowChecks.check4"
                  type="checkbox"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container direction="column" class="padding-0 width-80-per">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                Wrapper script will create following branch protection rules for
                branch <span class="bg"> ${prj-name}-main</span>
              </Typography>
              <Wrapper borderRadius="4px" background="element">
                <Logs
                  content="Require a pull request before merging.
Required two number of approvals before merging
Dismiss stale pull request approvals when new commits are pushed
Require review from Code Owners
Require status checks to pass before merging
Require branches to be up to date before merging
Require conversation resolution before merging.
Require signed commits.
Requires administrator
ßAllow auto-merge and allow auto-deletion of branches"
                  :showSearch="false"
                  contentType="string"
                />
              </Wrapper>
            </Container>
          </Container>

          <Divider />

          <Container
            direction="row"
            align="left top"
            padding="10px 0px 10px 10px"
          >
            <Typography
              type="h3"
              weight="book"
              color="dark"
              class="width-5-per"
            >
              6.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="execuSwitch.switch6"
                  @click="makeActive('check6', 'switch6')"
                  :disabled="AllowChecks.check5"
                  type="checkbox"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container direction="column" class="padding-0 width-80-per">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                Commit and push changes from
                <span class="bg">.github/workflows</span> ,
                <span class="bg">build</span> ,
                <span class="bg">0-bootstrap</span> ,
                <span class="bg">README.md</span> to
                <span class="bg">${prj-name}-init</span> and ensure everything
                gets successfully applied.
              </Typography>
            </Container>
          </Container>

          <Divider />

          <Container
            direction="row"
            align="left top"
            padding="10px 0px 10px 10px"
          >
            <Typography
              type="h3"
              weight="book"
              color="dark"
              class="width-5-per"
            >
              7.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="execuSwitch.switch7"
                  @click="makeActive('check7', 'switch7')"
                  :disabled="AllowChecks.check6"
                  type="checkbox"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container direction="column" class="padding-0 width-80-per">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
                >On GitHub, create a new branch
                <span class="bg">${prj-name}-main</span> from the main branch and
                create a pull request to merge the changes from step 3 into
                <span class="bg">${prj-name}-main</span> from
                <span class="bg">${prj-name}-init</span> .
              </Typography>
            </Container>
          </Container>

          <Divider />

          <Container
            direction="row"
            align="left top"
            padding="10px 0px 10px 10px"
          >
            <Typography
              type="h3"
              weight="book"
              color="dark"
              class="width-5-per"
            >
              8.
            </Typography>
            <!--  -->
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="execuSwitch.switch8"
                  @click="makeActive('check8', 'switch8')"
                  :disabled="AllowChecks.check7"
                  type="checkbox"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container direction="column" class="padding-0 width-80-per">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                Start deployment by raising PRs for subsequent stages by pushing
                the
                <span class="bg">backend.tf</span> changes made by wrapper
                script for each stage in
                <span class="bg">${prj-name}-init</span>.
              </Typography>
            </Container>
          </Container>
        </Container>
      </Container>
    </Wrapper>

    <Container padding="50px 0px 10px 0px" align="right">
      <Typography
        type="p2"
        weight="medium"
        color="error"
        :class="{ invisible: showError }"
      >
        To proceed, all items’ mentioned above should be setup and status
        updated to “Complete”.
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
import {
  Container,
  Typography,
  Logs,
  Button,
  Wrapper,
  Divider,
} from "@cldcvr/flow";
import Popup from "./Popup.vue";
import { mapState } from "vuex";
export default {
  name: "Execution",
  components: {
    Container,
    Typography,
    Logs,
    Button,
    Popup,
    Wrapper,
    Divider,
  },
  data() {
    return {
      iconname: "i-tree",
      AllowChecks: {
        check1: true,
        check2: true,
        check3: true,
        check4: true,
        check5: true,
        check6: true,
        check7: true,
        check8: true,
      },
      execuSwitch: {
        //maintain the order of attribute
        switch1: false,
        switch2: false,
        switch3: false,
        switch4: false,
        switch5: false,
        switch6: false,
        switch7: false,
        switch8: false,
      },
      showError: true,
      body: "By proceeding, you will lose all inputs and statuses and will need to re-setup the Landing Zone from start.",
      openModalFlag: false,
      toolTip: {
        orgId: {
          content:
            "<span class='fa-dark fs-12 paragraph-1'>A GCP organisation ID. You should get this value after completing pre-requisites stage.</span>",
          container: "div.flow-layout",
          classes: ["black"],
        },
        BillActId: {
          content:
            "<span class='fa-dark fs-12 paragraph-1'>A billing account id. You should get this value after completing pre-requisites stage.</span>",
          container: "div.flow-layout",
          classes: ["black"],
        },
      },
    };
  },
  computed: {
    ...mapState(["ExecutionSwitch", "executionAllowCheck"]),
    Check() {
      // this method will check that user has fill all the  require field or not
      const val = Object.values(this.execuSwitch);
      const findVal = val.indexOf(false);
      if (findVal == -1) return true;

      return false;
    },
  },
  mounted() {
    this.fetchExdata();
    if (this.ExecutionSwitch != undefined)
      this.execuSwitch = this.ExecutionSwitch;
    if (this.executionAllowCheck != undefined)
      this.AllowChecks = this.executionAllowCheck;
  },
  methods: {
    onCancel() {
      this.openModalFlag = true;
    },
    onProceed() {
      this.$emit("cancel");
    },
    makeActive(check, switchData) {
      if (switchData != null && switchData != undefined)
        this.execuSwitch[switchData] = true;
      this.AllowChecks[check] = false;

      if (this.Check) {
        this.showError = this.Check;
      }
    },

    onPopupcancel() {
      this.openModalFlag = false;
    },
    onBack() {
      this.$emit("onback", 5);
    },
    onNext() {
      if (this.Check) {
        this.showError = this.Check;
        this.$emit("onNext", 7);
        this.$store.dispatch("setExecutionData", this.execuSwitch);
        this.$store.dispatch("setExecutionAllowCheck", this.AllowChecks);
      } else {
        this.showError = this.Check;
      }
    },
    fetchExdata() {
      this.$store.dispatch("getExecutionData");
      this.$store.dispatch("getExecutionAllowCheck");
    },
  },
};
</script>
<style scoped>
.width-5-per {
  width: 5% !important;
}
.width-15-per {
  width: 15% !important;
}

.switch-button {
  background: #3a4d64;
  border-radius: 7px;
  overflow: hidden;
  width: 133px;
  text-align: center;
  font-size: 8px;
  letter-spacing: 1px;
  color: #fff;
  position: relative;
  padding-right: 60px;
}
.switch-button:before {
  content: "COMPLETE";
  position: absolute;
  top: 0;
  bottom: 0;
  right: 0;
  padding: 5px 5px;
  width: 55px;
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1;
  pointer-events: none;
}
.switch-button-checkbox {
  cursor: pointer;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  z-index: 2;
}
.switch-button-checkbox:checked + .switch-button-label:before {
  transform: translateX(65px);
  background: #0fbd35;
  transition: transform 300ms linear;
}
.switch-button-checkbox + .switch-button-label {
  position: relative;
  padding: 5px 0;
  display: block;
  user-select: none;
  pointer-events: none;
}
.switch-button-checkbox + .switch-button-label:before {
  content: "";
  background: #f57070;
  height: 100%;
  width: 94%;
  position: absolute;
  left: 0;
  top: 0;
  border-radius: 7px;
  transform: translateX(0);
  transition: transform 300ms;
}
.switch-button-checkbox + .switch-button-label .switch-button-label-span {
  position: relative;
}
.invisible {
  visibility: hidden;
}
.bg {
  background: #3a4d64;
  border-radius: 2px;
  padding-left: 10px;
  padding-right: 10px;
}
</style>
