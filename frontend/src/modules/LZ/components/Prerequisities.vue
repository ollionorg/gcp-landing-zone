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
          Prerequisities
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
                  v-model="prerequChecks.switch1"
                  disabled
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
                Set up a Google Cloud organization
              </Typography>

              <FormField class="padding-0">
                <label for="">
                  <Container class="padding-0" direction="row" :gap="4">
                    <Typography
                      type="p3"
                      family="default"
                      weight="medium"
                      color="light"
                    >
                      Organization ID
                    </Typography>
                    <Icon
                     color="gray-300"
                      name="i-info-fill"
                      v-tooltip="toolTip.orgId"
                      size="x-small"
                      :effects="false"
                    />
                  </Container>
                </label>
                <InputText
                  :value.sync="prerequData.GcpId"
                  @keyup="patternCheckgcp"
                  placeholder="Enter 12 digit GCP org id Ex:- 123456789123"
                  :maxlength="12"
                />
              </FormField>
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
                  v-model="prerequChecks.switch2"
                  disabled
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
                Set up a Google Cloud billing account. Make sure to note down
                the Billing ID and add it to the tfvars in the 0-bootstrap.
              </Typography>

              <FormField class="padding-0">
                <label for="">
                  <Container class="padding-0" direction="row" :gap="4">
                    <Typography
                      type="p3"
                      family="default"
                      weight="medium"
                      color="light"
                    >
                      Billing Account ID
                    </Typography>
                    <Icon
                      color="gray-300"
                      name="i-info-fill"
                      v-tooltip="toolTip.BillActId"
                      size="x-small"
                      :effects="false"
                    />
                  </Container>
                </label>
                <InputText
                  :value.sync="prerequData.BillActId"
                  @keyup="patternCheck"
                  :disabled="AllowChecks.check1"
                  placeholder="Enter account id Ex:- XXXXXX-XXXXXX-XXXXXX"
                />
              </FormField>
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
                  v-model="prerequChecks.switch3"
                  type="checkbox"
                  @click="makeActive('check2', 'switch3')"
                  :disabled="AllowChecks.check1"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container
              direction="column"
              class="width-80-per height-100-per"
              align="left center"
              padding="0"
            >
              <Typography weight="regular" color="default">
                Configure Authentication - Cloud Identity or Workspace (G
                Suite).
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
              4.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="prerequChecks.switch4"
                  type="checkbox"
                  @click="makeActive('check3', 'switch4')"
                  :disabled="AllowChecks.check2"
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
                Ensure the quotas for associating projects with billing account
                is increased to 50
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
                  v-model="prerequChecks.switch5"
                  type="checkbox"
                  @click="makeActive('check4', 'switch5')"
                  :disabled="AllowChecks.check3"
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
                Create Cloud Identity or Google Workspace (formerly G Suite)
                groups for organization and billing admins.
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
              6.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="prerequChecks.switch6"
                  @click="makeActive('check5', 'switch6')"
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
                The <span class="bg"> group_org_admins</span> group must also
                have the below permissions:
                <Logs
                  class="height-50-per"
                  content="roles/resourcemanager.projectCreator
roles/resourcemanager.organization
Adminroles/billing.admin
roles/resourcemanager.folderCreator"
                  :showSearch="false"
                  background="element"
                  contentType="string"
                />
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
                  v-model="prerequChecks.switch7"
                  type="checkbox"
                  @click="makeActive('check6', 'switch7')"
                  :disabled="AllowChecks.check5"
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
                Ensure the user deploying the initial code should be present in
                the
                <span class="bg">group_org_admins</span> group.
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
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="prerequChecks.switch8"
                  type="checkbox"
                  @click="makeActive('check7', 'switch8')"
                  :disabled="AllowChecks.check6"
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
                Create a new branch from the main branch which will be in
                template form, New branch name should be
                <span class="bg">${prj-name}-init </span>
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
              9.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="prerequChecks.switch9"
                  type="checkbox"
                  @click="makeActive('check8', 'switch9')"
                  :disabled="AllowChecks.check7"
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
                Create bot machine user and a GitHub Token with
                <span class="bg">repo</span>
                <span class="bg">read:org</span> and
                <span class="bg">read:discussions</span>
              </Typography>
            </Container>
          </Container>

          <Divider />

          <Container
            direction="row"
            align="left center"
            padding="10px 0px 10px 10px"
          >
            <Typography
              type="h3"
              weight="book"
              color="dark"
              class="width-5-per"
            >
              10.
            </Typography>
            <div class="width-15-per">
              <div class="switch-button">
                <input
                  class="switch-button-checkbox"
                  v-model="prerequChecks.switch13"
                  @click="makeActive('check9', 'switch10')"
                  :disabled="AllowChecks.check8"
                  type="checkbox"
                />
                <label class="switch-button-label" for=""
                  ><span class="switch-button-label-span">PENDING</span></label
                >
              </div>
            </div>

            <Container direction="column" class="padding-0 width-80-per">
              <Container direction="column" :gap="1" lass="padding-0">
                <Typography type="p2" weight="medium" color="dark">
                  Optional
                </Typography>
                <Typography
                  weight="regular"
                  color="default"
                  class="fc-light text-align-left fs-16 padding-0"
                >
                  Create Slack WebHook Secret in GitHub
                  <span class="bg">GCF_SLACK_WEBHOOK</span>, GitHub Token Secret
                  in GitHub as <span class="bg">GH_TOKEN</span>
                </Typography>
              </Container>
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
  InputText,
  FormField,
  Icon,
  Logs,
  Button,
  Divider,
  Wrapper,
} from "@cldcvr/flow";
import Popup from "./Popup.vue";
import { mapState } from "vuex";
export default {
  name: "Prerequisities",
  components: {
    Container,
    Typography,
    Logs,
    InputText,
    FormField,
    Icon,
    Button,
    Popup,
    Divider,
    Wrapper,
  },

  data() {
    return {
      switchOn: false,
      iconname: "i-tree",
      prerequData: {
        GcpId: "",
        BillActId: "",
      },
      AllowChecks: {
        check1: true,
        check2: true,
        check3: true,
        check4: true,
        check5: true,
        check6: true,
        check7: true,
        check8: true,
        check9: true,
        check10: true,
      },
      prerequChecks: {
        //maintain the order of attribute
        switch1: false,
        switch2: false,
        switch3: false,
        switch4: false,
        switch5: false,
        switch6: false,
        switch7: false,
        switch8: false,
        switch9: false,
        switch10: false,
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
    ...mapState([
      "PrerequisticsData",
      "PrerequisticsCheck",
      "preReqallowCheck",
    ]),
    Check() {
      // this method will check that user has fill all the  require field or not
      const val = Object.values(this.prerequChecks);
      val.pop(); //removing the optional attribute
      const findVal = val.indexOf(false);
      if (findVal == -1) return true;

      return false;
    },
  },
  mounted() {
    this.fetchPrdata();
    if (this.PrerequisticsData != undefined)
      this.prerequData = this.PrerequisticsData;

    this.fetchPrchecks();
    if (this.PrerequisticsCheck != undefined)
      this.prerequChecks = this.PrerequisticsCheck;
    if (this.preReqallowCheck != undefined)
      this.AllowChecks = this.preReqallowCheck;
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
        this.prerequChecks[switchData] = true;

      if (check != "check11") {
        this.AllowChecks[check] = false;
      } else {
        this.AllowChecks.check11 = false;
        this.AllowChecks.check12 = false;
      }
      if (this.Check) {
        this.showError = this.Check;
      }
    },

    // below mehtod is for validating bill account id
    patternCheck() {
      const regex = /^[A-Z0-9]{6}[-][A-Z0-9]{6}[-][A-Z0-9]{6}$/gm;
      const regFlag = regex.test(this.prerequData.BillActId);
      if (regFlag && this.prerequChecks.switch1) {
        this.prerequChecks.switch2 = true;
        this.makeActive("check1");
      } else {
        this.prerequChecks.switch2 = false;
      }
    },
    // below method is for validating GCP Id
    patternCheckgcp() {
      const regex = /^[\d]{12}$/gm;
      const regFlag = regex.test(this.prerequData.GcpId);
      if (regFlag) {
        this.prerequChecks.switch1 = true;
        this.AllowChecks.check1 = false;
      } else {
        this.prerequChecks.switch1 = false;
      }
    },

    onPopupcancel() {
      this.openModalFlag = false;
    },
    onBack() {
      this.$emit("onback", 3);
    },
    onNext() {
      if (this.Check) {
        this.showError = this.Check;
        this.$emit("onNext", 5);
        this.$store.dispatch("setPrData", this.prerequData);
        this.$store.dispatch("setPrAllowCheck", this.AllowChecks);
        this.$store.dispatch("setPrChecks", this.prerequChecks);
      } else {
        this.showError = this.Check;
      }
    },
    fetchPrdata() {
      this.$store.dispatch("getPrData");
    },
    fetchPrchecks() {
      this.$store.dispatch("getPrChecks");
      this.$store.dispatch("getPrAllowCheck");
    },
  },
};
</script>
<style scoped>
.bg {
  background: #3a4d64;
}
.bg-color {
  background-color: #2b394a !important;
}
.float-left {
  float: left;
}
.float-right {
  float: right;
}
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
