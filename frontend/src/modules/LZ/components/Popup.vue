<template>
  <MockLayout>
    <ModalBox :open="OpenModelFlag" :width="bodyTextFlag ? 800 : 500">
      <Container
        type="block"
        overflow="scroll"
        direction="column"
        class="height-40-per"
        align="center"
        :class="bodyTextFlag ? 'padding-50' : 'padding-32'"
      >
        <Container align="center">
          <Icon
            v-if="!CancelFlag"
            size="xxx-large"
            :name="IconName"
            :color="IconColor"
            type="filled"
          />
        </Container>
        <Container align="center" direction="column">
          <Typography
            type="h3"
            weight="black"
            color="dark"
            class="text-align-center"
            >{{ headerText }}
          </Typography>
          <Container class="width-86-per" v-if="!CancelFlag && bodyTextFlag">
            <Typography type="h3" weight="regular" color="gray-300"
              >{{ headerBody }}
            </Typography>
          </Container>
          <Container v-if="!CancelFlag && !bodyTextFlag" >
            <Typography type="h4" weight="regular" class="text-align-center" color="gray-300"
              >{{ headerBody }}
            </Typography>
          </Container>
          <Container align="center" v-if="CancelFlag">
            <Typography
              type="h3"
              class="text-align-center"
              weight="regular"
              color="dark"
              >{{ headerBody }}
            </Typography>
          </Container>
          <Typography
            type="h4"
            weight="black"
            color="dark"
            class="text-align-center"
            >{{ BodyHeader }}
          </Typography>
          <Container
            background="element-light"
            direction="column"
            v-if="bodyTextFlag"
          >
            <Container
              class="fc-light padding-bt-16"
              direction="column"
              v-for="(item, index) in adminInstruction"
              :key="index"
            >
              <Typography type="p2" weight="light" class="text-align-left">
                {{ item.instruction }}
              </Typography>
              <Logs
                v-if="item.subInstru"
                class="bg margin-tp-12"
                :content="item.subInstru"
                :showSearch="false"
                contentType="string"
              />
            </Container>
          </Container>
        </Container>
        <Container v-if="bodyTextFlag" direction="row" :gap="15">
          <Checkbox :checked.sync="proceedCheck" @click="onCheck"> </Checkbox>
          <Typography type="p2" weight="regular" color="dark">
            I Acknowledge and agree to the instructions given for SuperAdmin
          </Typography>
        </Container>

        <Container class="padding-16" align="center" v-if="bodyTextFlag">
          <Typography
            class="text-align-center"
            type="p2"
            :style="{
              visibility: showError ? 'visible' : 'hidden',
            }"
            weight="medium"
            color="error"
          >
            Please tick the acknowledgement to proceed.
          </Typography>
        </Container>
        <Container align="center">
          <Button
            size="normal"
            type="primary"
            state="Filled"
            :class="CancelFlag ? 'width-50-per' : !CancelFlag && !bodyTextFlag? 'width-50-per':'width-30-per'"
            @click="onProceed"
            :loading="false"
          >
            {{ ButtonText }}
          </Button>

          <Button
            size="normal"
            type="primary"
            state="outlined"
            v-if="CancelFlag"
            class="width-30-per"
            @click="onCancel"
            :disabled="!proceedCheck"
            :loading="false"
          >
            CANCEL
          </Button>
        </Container>
        <!-- </Container> -->
      </Container>
    </ModalBox>
  </MockLayout>
</template>
<script>
import {
  ModalBox,
  MockLayout,
  Icon,
  Logs,
  Container,
  Typography,
  Checkbox,
  Button,
} from "@cldcvr/flow";
import * as jsonData from "../../constants/constant.json";
export default {
  name: "Popup",
  components: {
    MockLayout,
    ModalBox,
    Icon,
    Logs,
    Container,
    Typography,
    Checkbox,
    Button,
  },
  props: {
    headerText: String,
    headerBody: String,
    BodyHeader: String,
    ButtonText: String,
    bodyTextFlag: Boolean,
    IconColor: String,
    CancelFlag: Boolean,
    OpenModelFlag: Boolean,
    IconName: String,
  },
  mounted() {
    this.adminInstruction = jsonData.instructions.superAdminInstru;
    this.iconname = this.IconName;
    if (this.bodyTextFlag == false) this.proceedCheck = !this.bodyTextFlag;
  },
  data() {
    return {
      proceedCheck: false,
      showError: false,
      headerText1: "Deployment",
      adminInstruction: [],
      haederBody1:
        "Please review the given inputs from your local to remote and click “Confirm” status individually to complete the Landing Zone Setup",
      BodyHeader1: "Instructions for SuperAdmin",
      ButtonText1: "LET’S PROCEED",
      bodyText1: true,
    };
  },
  methods: {
    onProceed() {
      if (this.bodyTextFlag) {
        if (this.proceedCheck) this.$emit("proceed");
        else this.showError = true;
      } else {
        this.$emit("proceed");
      }
    },
    onCancel() {
      this.$emit("cancelPopup");
    },
    onCheck() {
      this.showError = !this.proceedCheck;
    },
  },
};
</script>
<style scoped>
.width-86-per {
  width: 86%;
}
</style>
