<template>
  <Wrapper class="wrap padding-0" borderRadius="4px">
    <Popup
      headerText="Are You Sure?"
      :headerBody="body"
      :CancelFlag="true"
      :OpenModelFlag="openModalFlag1"
      :bodyTextFlag="false"
      @proceed="onProceed1"
      @cancelPopup="onPopupCancel"
      ButtonText="YES, PROCEED"
    />
    <Wrapper borderRadius="4px" background="border">
      <Popup
        :headerText="headerText1"
        :BodyHeader="BodyHeader1"
        :IconName="iconname"
        :CancelFlag="false"
        @proceed="onProceed"
        IconColor="primary-300"
        :OpenModelFlag="openModalFlag"
        :headerBody="haederBody1"
        :bodyTextFlag="true"
        :ButtonText="ButtonText1"
      />
      <Container direction="row" type="block">
        <Container direction="column" class="float-left">
          <Typography
            type="h3"
            weight="black"
            class="fc-dark padding-bt-10 padding-tp-10"
          >
            Deployment
          </Typography>
          <Typography
            weight="light"
            color="light"
            class="fc-light text-align-left fs-16"
          >
            Please complete the following steps in linear manner
          </Typography>
        </Container>
        <Container align="center" class="float-right">
          <Typography
            weight="light"
            color="light"
            class="fc-light text-align-left fs-16"
          >
            Want to disable git pull request based verification ?
          </Typography>
          <div class="switch-button1">
            <input
              class="switch-button1-checkbox"
              v-model="DeployementData.gitAllowPr"
              @change="resetSwitch"
              type="checkbox"
            />
            <label class="switch-button1-label" for=""
              ><span class="switch-button1-label-span">DISABLE</span></label
            >
          </div>
        </Container>
        <div class="clear"></div>
      </Container>
      <Container direction="column">
        <Container direction="row">
          <Typography
            type="h3"
            weight="black"
            class="fc-dark padding-bt-10 padding-tp-10 width-5-per"
          >
            No.
          </Typography>

          <Typography
            type="h3"
            weight="black"
            class="fc-dark padding-bt-10 padding-tp-10 width-15-per"
          >
            Status
          </Typography>
          <Typography
            type="h3"
            weight="black"
            class="fc-dark padding-bt-10 padding-tp-10"
          >
            Requirement
          </Typography>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            1.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch1"
                @blur="chechFileData"
                :disabled="AllowChecks.check1"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              Deployment of Wrapper
            </Typography>

            <div v-for="(item, index) in wrapperInstru" :key="index">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                {{ item.instruction }}
              </Typography>
              <Logs
                v-if="item.subInstru"
                class="bg margin-tp-12"
                :content="item.subInstru"
                :showSearch="false"
                contentType="shell"
              />
            </div>
            <FileUpload
              class="width-60-per"
              title="Drag and drop files"
              @onFileSelect="addFiles"
              :disabled="AllowChecks.check1"
              subTitle="(png, jpg. pdf)"
            />
            <Container
              direction="row"
              class="bg-file padding-8 width-60-per"
              v-for="(item, index) in DeployementData.fileArray"
              :key="item.id"
            >
              <Container class="width-100-per">
                <Icon
                  name="i-file"
                  size="small"
                  type="filled"
                  color="gray-400"
                  :effects="false"
                ></Icon>
                <Typography type="p2" weight="thin">
                  {{ item.fileName }}
                </Typography>
              </Container>
              <Container align="right" class="width-100-per">
                <Icon
                  name="i-close"
                  size="x-small"
                  class="float-right"
                  type="filled"
                  @click="removeFile(index)"
                  color="gray-400"
                  :effects="false"
                ></Icon>
              </Container>
            </Container>
          </Container>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            2.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch2"
                :disabled="DeployementData.gitAllowPr"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              Deployment of Bootstrap
            </Typography>

            <div v-for="(item, index) in bootstrapInstru" :key="index">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                {{ item.instruction }}
              </Typography>
            </div>
            <FormField
              class="padding-0 width-60-per"
              v-if="DeployementData.gitAllowPr"
            >
              <label for="">
                <Typography
                  type="p3"
                  family="default"
                  weight="medium"
                  color="light"
                >
                  Pull Request URL
                </Typography></label
              >
              <InputText
                :value.sync="DeployementData.Boostrap"
                :disabled="AllowChecks.check2"
                @donetyping="
                  checkStatus(DeployementData.Boostrap, 'switch2', 'check3')
                "
                placeholder="Enter URL here"
              />
            </FormField>
          </Container>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            3.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch3"
                :disabled="DeployementData.gitAllowPr"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              Deployment of Org Setup
            </Typography>

            <div v-for="(item, index) in orgSetupInstru" :key="index">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                {{ item.instruction }}
              </Typography>
            </div>
            <FormField
              class="padding-0 width-60-per"
              v-if="DeployementData.gitAllowPr"
            >
              <label for="">
                <Typography
                  type="p3"
                  family="default"
                  weight="medium"
                  color="light"
                >
                  Pull Request URL
                </Typography></label
              >
              <InputText
                :value.sync="DeployementData.OrgSetup"
                :disabled="AllowChecks.check3"
                @blur="
                  checkStatus(DeployementData.OrgSetup, 'switch3', 'check4')
                "
                placeholder="Enter URL here"
              />
            </FormField>
          </Container>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            4.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch4"
                :disabled="DeployementData.gitAllowPr"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              Deployment of Environment Setup
            </Typography>

            <Container direction="column" class="padding-0">
              <div v-for="(item, index) in envSetupInstru" :key="index">
                <Typography
                  weight="regular"
                  color="default"
                  class="fc-light text-align-left fs-16 padding-0"
                >
                  {{ item.instruction }}
                </Typography>
              </div>

              <div
                v-for="(item, index) in DeployementData.EnvSetup"
                :key="item.id"
              >
                <FormField
                  class="padding-0 width-60-per"
                  v-if="DeployementData.gitAllowPr"
                >
                  <label for="">
                    <Typography
                      type="p3"
                      family="default"
                      weight="medium"
                      color="light"
                    >
                      Pull Request URL ({{ item.type }})
                    </Typography></label
                  >
                  <InputText
                    :value.sync="item.envSetupPrUrl"
                    :disabled="AllowChecks.check4"
                    @blur="
                      checkPrStatusOfArray(
                        item.envSetupPrUrl,
                        'switch4',
                        'check5',
                        index,
                        'EnvSetup',
                        'gitResp'
                      )
                    "
                    placeholder="Enter URL here"
                  />
                </FormField>
              </div>
            </Container>
          </Container>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            5.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch5"
                :disabled="DeployementData.gitAllowPr"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              Deployment of Network Setup
            </Typography>
            <Container direction="column" class="padding-0">
              <div v-for="(item, index) in netSetupInstru" :key="index">
                <Typography
                  weight="regular"
                  color="default"
                  class="fc-light text-align-left fs-16 padding-0"
                >
                  {{ item.instruction }}
                </Typography>
              </div>
              <div
                v-for="(item, index) in DeployementData.NetworkSetup"
                :key="item.id"
              >
                <FormField
                  class="padding-0 width-60-per"
                  v-if="DeployementData.gitAllowPr"
                >
                  <label for="">
                    <Typography
                      type="p3"
                      family="default"
                      weight="medium"
                      color="light"
                    >
                      Pull Request URL ({{ item.type }})
                    </Typography></label
                  >
                  <InputText
                    :value.sync="item.networkSetupPrUrl"
                    :disabled="AllowChecks.check5"
                    @blur="
                      checkPrStatusOfArray(
                        item.networkSetupPrUrl,
                        'switch5',
                        'check6',
                        index,
                        'NetworkSetup',
                        'gitResp'
                      )
                    "
                    placeholder="Enter URL here"
                  />
                </FormField>
              </div>
            </Container>
          </Container>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            6.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch6"
                :disabled="DeployementData.gitAllowPr"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              Business Unit Name & Code
            </Typography>

            <div v-for="(item, index) in buInstruc" :key="index">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                {{ item.instruction }}
              </Typography>
            </div>
            <Typography
              type="p2"
              weight="regular"
              color="dark"
              v-if="DeployementData.gitAllowPr"
            >
              Please note: once submitted, you will not be able to re-submit.
            </Typography>

            <div v-if="DeployementData.gitAllowPr">
              <Container
                direction="row"
                v-for="(item, index) in DeployementData.BUArray"
                :key="item.id"
                class="padding-0"
              >
                <FormField class="padding-0 width-35-per">
                  <label for="">
                    <Container class="padding-0" direction="row" :gap="4">
                      <Typography
                        type="p3"
                        family="default"
                        weight="medium"
                        color="light"
                      >
                        Business Unit Name
                      </Typography>
                      <Icon
                        color="gray-400"
                        name="i-info-fill"
                        type="outlined"
                        v-tooltip="toolTipBuName"
                        size="x-small"
                        :effects="false"
                      />
                    </Container>
                  </label>

                  <InputText
                    :value.sync="item.buName"
                    class="width-100-per"
                    :disabled="item.editFlag"
                    id="item.key+index"
                    placeholder="Enter key"
                  />
                  <Typography
                    type="p3"
                    weight="medium"
                    color="error"
                    :style="{
                      visibility: checkValidity(item.buName)
                        ? 'hidden'
                        : 'visible',
                    }"
                  >
                    Code must be in alphanumeric
                  </Typography>
                </FormField>

                <FormField class="padding-0 width-35-per">
                  <label for="">
                    <Container class="padding-0" direction="row" :gap="4">
                      <Typography
                        type="p3"
                        family="default"
                        weight="medium"
                        color="light"
                      >
                        Business Unit Code
                      </Typography>
                      <Icon
                        color="gray-400"
                        name="i-info-fill"
                        type="outlined"
                        v-tooltip="toolTipBuCode"
                        size="x-small"
                        :effects="false"
                      />
                    </Container>
                  </label>

                  <InputText
                    :value.sync="item.buCode"
                    id="item.name+index"
                    class="width-100-per"
                    :disabled="item.editFlag"
                    :maxlength="3"
                    placeholder="Enter Code"
                  />
                  <Typography
                    type="p3"
                    weight="medium"
                    color="error"
                    :style="{
                      visibility: checkValidity(item.buCode)
                        ? 'hidden'
                        : 'visible',
                    }"
                  >
                    Code must be in alphanumeric, not more than 3 letters
                  </Typography>
                </FormField>

                <Button
                  size="normal"
                  type="primary"
                  state="outlined"
                  :class="item.submitFlag ? 'border-gray' : 'border-blue'"
                  @click="onSubmit(index, 'switch6', 'check7')"
                  :disabled="AllowChecks.check6"
                  loadingType="icon"
                >
                  {{ item.submitFlag ? "SUBMITTED" : "SUBMIT" }}
                </Button>
                <div
                  class="bg-btn margin-lt-20"
                  v-if="DeployementData.BUArray.length > 1 && !item.submitFlag"
                  @click="remove(index)"
                >
                  x
                </div>
              </Container>
            </div>
            <Container
              class="width-15-per padding-0 margin-tp--24"
              v-if="DeployementData.gitAllowPr"
            >
              <!-- :disabled="checkSubmit" -->
              <Button
                size="normal"
                type="primary"
                state="outlined"
                class="margin-tp-20 border-blue fs-12"
                @click="add('switch6', 'check7')"
                :loading="false"
                loadingType="background"
              >
                ADD MORE
              </Button>
            </Container>
          </Container>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            7.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch7"
                :disabled="DeployementData.gitAllowPr"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              Deployment of Project Setup
            </Typography>

            <div v-for="(item, index) in projectInstru" :key="index">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                {{ item.instruction }}
              </Typography>
            </div>
            <div v-if="DeployementData.gitAllowPr">
              <Container
                v-for="(item, index) in DeployementData.BUArray"
                :key="item.id"
                class="padding-0"
                type="grid"
                itemSize="40%"
              >
                <FormField
                  class="padding-0 width-100-per"
                  v-for="(innerItem, key) in item.ProjectSetup"
                  :key="innerItem.id"
                >
                  <label for="">
                    <Typography
                      type="p3"
                      family="default"
                      weight="medium"
                      color="light"
                    >
                      Pull Request URL ({{ innerItem.type }})
                      <span v-if="item.buName">for </span>{{ item.buName }}
                    </Typography></label
                  >
                  <InputText
                    :value.sync="innerItem.projectSetupPrUrl"
                    :disabled="AllowChecks.check7"
                    @blur="
                      checkPrStatusOfArrayWithOptionalFields(
                        innerItem.projectSetupPrUrl,
                        'switch7',
                        'check8',
                        index,
                        key,
                        'ProjectSetup',
                        'gitResp'
                      )
                    "
                    placeholder="Enter URL here"
                  />
                </FormField>
              </Container>
            </div>
          </Container>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            8.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch8"
                :disabled="DeployementData.gitAllowPr"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              Deployment of Application Infra Setup
            </Typography>

            <div v-for="(item, index) in applicationInstru" :key="index">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                {{ item.instruction }}
              </Typography>
            </div>
            <div v-if="DeployementData.gitAllowPr">
              <Container
                v-for="(item, index) in DeployementData.BUArray"
                :key="item.id"
                class="padding-0"
              >
                <FormField
                  class="padding-0 width-60-per"
                  v-for="(innerItem, key) in item.instruSetup"
                  :key="innerItem.id"
                >
                  <label for="">
                    <Typography
                      type="p3"
                      family="default"
                      weight="medium"
                      color="light"
                    >
                      Pull Request URL ({{ innerItem.type }})
                      <span v-if="item.buName">for </span>{{ item.buName }}
                    </Typography></label
                  >
                  <InputText
                    :value.sync="innerItem.instruSetupPrUrl"
                    :disabled="AllowChecks.check8"
                    @blur="
                      checkPrStatusOfArrayWithOptionalFields(
                        innerItem.instruSetupPrUrl,
                        'switch8',
                        'check9',
                        index,
                        key,
                        'instruSetup',
                        'gitResp'
                      )
                    "
                    placeholder="Enter URL here"
                  />
                </FormField>
              </Container>
            </div>
          </Container>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            9.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch9"
                :disabled="DeployementData.gitAllowPr"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              KCC - Kubernetes Config Controller (Optional)
            </Typography>

            <div v-for="(item, index) in kccIntruction" :key="index">
              <Typography
                weight="regular"
                color="default"
                class="fc-light text-align-left fs-16 padding-0"
              >
                {{ item.instruction }}
              </Typography>
            </div>

            <FormField
              class="padding-0 width-60-per"
              v-if="DeployementData.gitAllowPr"
            >
              <label for="">
                <Typography
                  type="p3"
                  family="default"
                  weight="medium"
                  color="light"
                >
                  Pull Request URL
                </Typography></label
              >
              <InputText
                :value.sync="DeployementData.kccScript"
                :disabled="AllowChecks.check9"
                @blur="
                  checkStatus(DeployementData.kccScript, 'switch9', 'check10')
                "
                placeholder="Enter URL here"
              />
            </FormField>
          </Container>
        </Container>
        <Divider />
        <Container direction="row" align="left top">
          <Typography
            type="h3"
            weight="book"
            color="dark"
            class="fc-dark padding-bt-10 width-5-per"
          >
            10.
          </Typography>
          <div class="width-15-per">
            <div class="switch-button">
              <input
                class="switch-button-checkbox"
                v-model="DeployementChecks.switch10"
                @blur="showError = true"
                :disabled="AllowChecks.check10 && DeployementData.gitAllowPr"
                type="checkbox"
              />
              <label class="switch-button-label" for=""
                ><span class="switch-button-label-span">PENDING</span></label
              >
            </div>
          </div>

          <Container direction="column" class="padding-0 width-80-per">
            <Typography type="p1" weight="black" class="fc-dark padding-bt-10">
              KCC - Execute Scripts to Import Required Resources into KCC.
              (Optional)
            </Typography>

            <Typography
              weight="regular"
              color="default"
              class="fc-light text-align-left fs-16 padding-0"
            >
              Run the below steps to import the resources required to be
              monitored / audited using KCC.
            </Typography>

            <Logs
              class="bg margin-tp-12"
              content="# export resource manifests from project:
$ cd kcc; bash bulk-export.sh -p <project_id>
# export resource manifests from folder:
$ cd kcc; bash bulk-export.sh -f <folder_id>
# export resource manifests from organization:
$ cd kcc; bash bulk-export.sh -o <org_id>
# import resources into the kcc cluster
$ gcloud container clusters get-credentials lz-config-controller-cluster --region us-east1 --project <cicd-project-id>
$ kubectl apply -f resource-manifests/path/to/manifest/file/for/the/resources"
              :showSearch="false"
              contentType="shell"
            />
            <Typography
              weight="regular"
              color="default"
              class="fc-light text-align-left fs-16 padding-0 margin-tp-16"
            >
              Refer to README.md for further details.
            </Typography>
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
        <Button @click="onNext"> NEXT </Button>
      </Container>
    </Container>
  </Wrapper>
</template>
<script>
import {
  Container,
  Typography,
  FileUpload,
  Logs,
  InputText,
  FormField,
  Wrapper,
  Button,
  Divider,
  Icon,
} from "@cldcvr/flow";
import Popup from "../components/Popup.vue";
import Service from "../../api/lz-service";
import { mapState } from "vuex";
import * as jsonData from "../../constants/constant.json";
export default {
  name: "Deployment",
  components: {
    Container,
    Popup,
    Typography,
    FileUpload,
    InputText,
    Logs,
    Divider,
    Wrapper,
    FormField,
    Icon,
    Button,
  },
  data() {
    return {
      headerText1: "Deployment",
      haederBody1:
        "Please review the given inputs from your local to remote and click “Confirm” status individually to complete the Landing Zone Setup",
      BodyHeader1: "Instructions for SuperAdmin",
      ButtonText1: "LET’S PROCEED",
      openModalFlag: true,
      iconname: "i-tree",
      wrapperInstru: [],
      bootstrapInstru: [],
      orgSetupInstru: [],
      envSetupInstru: [],
      netSetupInstru: [],
      buInstruc: [],
      projectInstru: [],
      applicationInstru: [],
      kccIntruction: [],
      bodyText1: true,
      body: "By proceeding, you will lose all inputs and statuses and will need to re-setup the Landing Zone from start.",
      openModalFlag1: false,
      toolTipBuCode: {
        content:
          "<span class='fa-dark fs-12 paragraph-1'>A shorten code of a business unit that is deploying the Land Zone</span>",
        container: "div.flow-layout",
        classes: ["black"],
      },

      toolTipBuName: {
        content:
          "<span class='fa-dark fs-12 paragraph-1'>The name of the business unit that is deploying the Landing Zone.</span>",
        container: "div.flow-layout",
        classes: ["black"],
      },
      AllowChecks: {
        check1: false,
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
      DeployementChecks: {
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
      DeployementData: {
        gitAllowPr: true,
        wrapperFile: "",
        Boostrap: "",
        OrgSetup: "",
        EnvSetup: [
          { id: 1, envSetupPrUrl: "", type: "dev", gitResp: false },
          { id: 2, envSetupPrUrl: "", type: "stage", gitResp: false },
          { id: 3, envSetupPrUrl: "", type: "prod", gitResp: false },
        ],
        NetworkSetup: [
          { id: 1, networkSetupPrUrl: "", type: "shared", gitResp: false },
          { id: 2, networkSetupPrUrl: "", type: "dev", gitResp: false },
          { id: 3, networkSetupPrUrl: "", type: "stage", gitResp: false },
          { id: 4, networkSetupPrUrl: "", type: "prod", gitResp: false },
        ],
        ProjectSetup: [
          { id: 1, projectSetupPrUrl: "", gitResp: false },
          { id: 2, projectSetupPrUrl: "", gitResp: false },
          { id: 3, projectSetupPrUrl: "", gitResp: false },
        ],

        BUArray: [
          {
            id: 1,
            buName: "",
            buCode: "",
            isValidCode: false,
            isValidName: false,
            buprFlag: false,
            submitFlag: false,
            editFlag: true,
            ProjectSetup: [
              { id: 1, projectSetupPrUrl: "", type: "shared", gitResp: false },
              { id: 2, projectSetupPrUrl: "", type: "dev", gitResp: false },
              { id: 3, projectSetupPrUrl: "", type: "stage", gitResp: false },
              { id: 4, projectSetupPrUrl: "", type: "prod", gitResp: false },
            ],
            instruSetup: [
              { id: 1, instruSetupPrUrl: "", type: "dev", gitResp: false },
              { id: 2, instruSetupPrUrl: "", type: "stage", gitResp: false },
              { id: 3, instruSetupPrUrl: "", type: "prod", gitResp: false },
            ],
          },
        ],
        InstructionSetup: [
          { id: 1, instruSetupPrUrl: "", gitResp: false },
          { id: 2, instruSetupPrUrl: "", gitResp: false },
          { id: 3, instruSetupPrUrl: "", gitResp: false },
        ],
        kccScript: "",
        fileArray: [],
      },
    };
  },
  computed: {
    ...mapState(["DeployChecks", "DeployData", "DeployAckOn"]),
    Check() {
      // checking Mandatory fields are  filled or not
      const val = Object.values(this.DeployementChecks);
      if (this.DeployementData.gitAllowPr) {
        if (this.DeployementData.kccScript == "") {
          val.splice(9, 1);
          val.splice(8, 1);
        }
      } else {
        if (!this.DeployementChecks.switch9) {
          val.splice(9, 1);
          val.splice(8, 1);
        }
      }

      const findVal = val.indexOf(false);
      if (findVal == -1 && this.DeployementData.fileArray.length >= 1)
        return true;

      return false;
    },

    checkSubmit() {
      //  checking shell script api is executed successfully or not and after that enable or disable add more button
      const sudmitflag = this.DeployementData.BUArray.find(
        (x) => x.submitFlag == false
      );
      if (sudmitflag != undefined) return true;

      return false;
    },
  },
  mounted() {
    this.wrapperInstru = jsonData.instructions.wrapperinstrucstions;
    this.bootstrapInstru = jsonData.instructions.bootstrapInstru;
    this.orgSetupInstru = jsonData.instructions.orgSetupInstru;
    this.envSetupInstru = jsonData.instructions.envSetupInstru;
    this.netSetupInstru = jsonData.instructions.networkSetupInstru;
    this.buInstruc = jsonData.instructions.buInstru;
    this.projectInstru = jsonData.instructions.prjSetupinstru;
    this.applicationInstru = jsonData.instructions.infraSetupinstru;
    this.kccIntruction = jsonData.instructions.kccIntruc;

    this.fetchDeploydata();
    if (this.DeployData != undefined) this.DeployementData = this.DeployData;

    if (this.DeployChecks != undefined)
      this.DeployementChecks = this.DeployChecks;

    if (this.DeployAckOn != undefined) this.openModalFlag = false;
    else this.openModalFlag = true;
  },
  methods: {
    onCancel() {
      this.openModalFlag1 = true;
    },
    checkValidity(buData) {
      if (buData != "") {
        const regex = /^\w+$/gm;
        const regFlag = regex.test(buData);
        return regFlag;
      } else return true;
    },
    onProceed1() {
      this.$emit("cancel");
    },
    onPopupCancel() {
      this.openModalFlag1 = false;
    },

    onBack() {
      this.$emit("onback", 5);
    },
    makeActive(check) {
      this.AllowChecks[check] = false;
    },
    onNext() {
      if (this.Check) {
        this.$emit("onNext", 8);
        this.$store.dispatch("setDeployData", this.DeployementData);
        this.$store.dispatch("setDeployCheck", this.DeployementChecks);
      } else {
        this.showError = this.Check;
      }
    },
    onProceed() {
      this.openModalFlag = false;
      this.$store.dispatch("setDeployAckOn");
    },
    resetSwitch() {
      this.DeployementChecks = {
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
      };
      this.DeployementData.fileArray = [];
    },
    chechFileData() {
      if (this.DeployementData.fileArray.length == 0) {
        this.DeployementChecks.switch1 = false;
      } else {
        this.DeployementChecks.switch1 = true;
      }
    },
    checkValidUrl(url) {
      const reg =
        /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/gm;
      const regFlag = reg.test(url);
      return regFlag;
    },
    splitPrReq(req) {
      let urlData = {
        owner: "",
        repo: "",
        pr: "",
      };
      const splitArray = req.split("/");
      urlData.owner = splitArray[3];
      urlData.repo = splitArray[4];
      urlData.pr = splitArray[6];

      return urlData;
    },
    // below method for validating url and making api call if correct url after that if success enable next step if not disable next step
    checkStatus(req, prop, check) {
      if (this.checkValidUrl(req)) {
        const splitedUrl = this.splitPrReq(req);
        let Resp;
        let that = this;
        const Myinterval = setInterval(async function () {
          try {
            Resp = await Service.getStatus(
              splitedUrl.owner,
              splitedUrl.repo,
              splitedUrl.pr
            );
            if (Resp.status == 204) {
              clearInterval(Myinterval);

              that.DeployementChecks[prop] = true;
              that.AllowChecks[check] = false;

              if (that.Check) {
                that.showError = that.Check;
              }
            }
          } catch (error) {
            if (error.response.status != 404) {
              clearInterval(Myinterval);
              alert("Maintain Correct Token");
            } else {
              clearInterval(Myinterval);
            }
            that.DeployementChecks[prop] = false;
            that.AllowChecks[check] = true;
          }
        }, 1000);
      } else {
        this.DeployementChecks[prop] = false;
        this.AllowChecks[check] = true;
      }
    },
    // below method is for step project Environment setup and Network  setup
    // the method will check if the pr is merge or not
    checkPrStatusOfArray(
      req,
      prop,
      check,
      index, // index of array
      arrayName,
      fieldName
    ) {
      if (this.checkValidUrl(req)) {
        const splitedUrl = this.splitPrReq(req);
        let Resp;
        let that = this;
        const Myinterval = setInterval(async function () {
          try {
            Resp = await Service.getStatus(
              splitedUrl.owner,
              splitedUrl.repo,
              splitedUrl.pr
            );
            if (Resp.status == 204) {
              clearInterval(Myinterval);
              if (index != undefined) {
                that.DeployementData[arrayName][index][fieldName] = true;
                const buFlag = that.DeployementData[arrayName].find(
                  (x) => x[fieldName] == false
                );

                if (buFlag == undefined) {
                  that.DeployementChecks[prop] = true;
                  that.AllowChecks[check] = false;

                  if (check == "check6") {
                    that.DeployementData.BUArray[0].editFlag = false;
                  }
                }
              }
              if (that.Check) {
                that.showError = that.Check;
              }
            }
          } catch (error) {
            if (error.response.status != 404) {
              clearInterval(Myinterval);
              alert("Maintain Correct Token");
            } else {
              clearInterval(Myinterval);
            }

            if (index != undefined) {
              that.DeployementData[arrayName][index][fieldName] = false;
              that.DeployementChecks[prop] = false;
              that.AllowChecks[check] = true;
            } else {
              that.DeployementChecks[prop] = false;
              that.AllowChecks[check] = true;
            }
          }
        }, 1000);
      } else {
        this.DeployementChecks[prop] = false;
        this.AllowChecks[check] = true;
      }
    },
    // below method is for step project deployment setup and appliccation infra setup
    // the method will check if the pr is merge or not
    checkPrStatusOfArrayWithOptionalFields(
      req,
      prop,
      check,
      index1, // index of main array
      index2, // index of array inside main array
      arrayName,
      fieldName
    ) {
      if (this.checkValidUrl(req)) {
        const splitedUrl = this.splitPrReq(req);
        let Resp;
        let that = this;
        const Myinterval = setInterval(async function () {
          try {
            Resp = await Service.getStatus(
              splitedUrl.owner,
              splitedUrl.repo,
              splitedUrl.pr
            );
            if (Resp.status == 204) {
              clearInterval(Myinterval);

              if (index1 != undefined) {
                that.DeployementData.BUArray[index1][arrayName][index2][
                  fieldName
                ] = true;
                const buFlag = that.DeployementData.BUArray[index1][
                  arrayName
                ].find((x) => x[fieldName] == true);

                if (buFlag != undefined) {
                  that.DeployementChecks[prop] = true;
                  that.AllowChecks[check] = false;
                }
              }
              if (that.Check) {
                that.showError = that.Check;
              }
            }
          } catch (error) {
            if (error.response.status != 404) {
              clearInterval(Myinterval);
              alert("Maintain Correct Token");
            } else {
              clearInterval(Myinterval);
            }

            if (index1 != undefined) {
              that.DeployementData.BUArray[index1][arrayName][index2][
                fieldName
              ] = false;
              that.DeployementChecks[prop] = false;
              that.AllowChecks[check] = true;
            } else {
              that.DeployementChecks[prop] = false;
              that.AllowChecks[check] = true;
            }
          }
        }, 1000);
      } else {
        if (prop == "switch9") {
          this.DeployementChecks[prop] = false;
          this.DeployementChecks.switch10 = false;
        }
        if (req === "") {
          const buFlag = this.DeployementData.BUArray[index1][arrayName].find(
            (x) => x[fieldName] == true
          );

          if (buFlag != undefined) {
            this.DeployementChecks[prop] = true;
            this.AllowChecks[check] = false;
          } else {
            this.DeployementChecks[prop] = false;
            this.AllowChecks[check] = true;
          }
        } else {
          this.DeployementChecks[prop] = false;
          this.AllowChecks[check] = true;
        }
      }
    },
    add(swicthcheck, check) {
      if (this.DeployementData.BUArray.length <= 2) {
        if (this.DeployementChecks[swicthcheck] == true)
          this.DeployementChecks[swicthcheck] = false;

        if (this.AllowChecks[check] == false) this.AllowChecks[check] = true;

        this.DeployementData.BUArray.push({
          id: this.DeployementData.BUArray.length + 1,
          buName: "",
          buCode: "",
          buprFlag: false,
          submitFlag: false,
          editFlag: false,
          ProjectSetup: [
            { id: 1, projectSetupPrUrl: "", type: "shared", gitResp: false },
            { id: 2, projectSetupPrUrl: "", type: "dev", gitResp: false },
            { id: 3, projectSetupPrUrl: "", type: "stage", gitResp: false },
            { id: 4, projectSetupPrUrl: "", type: "prod", gitResp: false },
          ],
          instruSetup: [
            { id: 1, instruSetupPrUrl: "", type: "dev", gitResp: false },
            { id: 2, instruSetupPrUrl: "", type: "stage", gitResp: false },
            { id: 3, instruSetupPrUrl: "", type: "prod", gitResp: false },
          ],
        });
      }
    },
    remove(i) {
      this.DeployementData.BUArray.splice(i, 1);
    },

    // below method is for calling shell script api after every submit click and
    //  if success enable add more button and enable next step and if not disable it
    async onSubmit(index, swicthcheck, check) {
      if (
        this.checkValidity(this.DeployementData.BUArray[index].buName) &&
        this.checkValidity(this.DeployementData.BUArray[index].buCode) &&
        this.DeployementData.BUArray[index].buName != "" &&
        this.DeployementData.BUArray[index].buCode != ""
      ) {
        let body = {
          buName: this.DeployementData.BUArray[index].buName,
          buCode: this.DeployementData.BUArray[index].buCode,
        };
        try {
          let resp = await Service.post(body);
          if (resp.status == 200) {
            this.DeployementData.BUArray[index].submitFlag = true;
            this.DeployementData.BUArray[index].editFlag = true;
            let flag = this.DeployementData.BUArray.find(
              (x) => x.submitFlag == false
            );
            if (flag == undefined) {
              this.DeployementChecks[swicthcheck] = true;

              this.AllowChecks[check] = false;
            }
          }
        } catch (error) {
          this.DeployementData.BUArray[index].submitFlag = false;
          this.DeployementData.BUArray[index].editFlag = false;
        }

        let flag = this.DeployementData.BUArray.find(
          (x) => x.submitFlag == false
        );
        if (flag == undefined) {
          this.DeployementChecks[swicthcheck] = true;
          this.AllowChecks[check] = false;
        }
      }
    },

    // add files
    addFiles(file) {
      let fileData = file[0];
      let reader = new FileReader();
      reader.readAsDataURL(fileData);
      reader.onload = () => {
        this.imageUrl = reader.result;
        this.DeployementData.fileArray.push({
          id: this.DeployementData.fileArray.length + 1,
          fileName: file[0].name,
          fileData: reader.result,
        });
        this.AllowChecks.check2 = false;
      };
    },
    // remove file data
    removeFile(index) {
      this.DeployementData.fileArray.splice(index, 1);
    },

    // fetch all require for current page form state
    fetchDeploydata() {
      this.$store.dispatch("getDeployData");
      this.$store.dispatch("getDeployCheck");
      this.$store.dispatch("getDeployAckOn");
    },
  },
};
</script>
<style scoped>
.bg {
  background: #3a4d64;
}
.bg-btn {
  background: #3a4d64;
  padding: 5px 12px;
  border-radius: 4px;
  justify-content: center;
  align-items: center;
  color: #9eb0c7;
  cursor: pointer;
}
.bg-color {
  background-color: #2b394a !important;
}

.border-blue {
  border: 2px solid #1995ff !important;
  height: 30px !important;
}
.border-gray {
  border: 2px solid #3a4d64 !important;
  color: #7b93b2 !important;
  height: 30px !important;
}
.bg-file {
  background: #232e3c !important;
}
.float-left {
  float: left;
}
.float-right {
  float: right;
}
.clear {
  clear: both;
}
.width-5-per {
  width: 5% !important;
}
.width-15-per {
  width: 15% !important;
}
.width-35-per {
  width: 35% !important;
}
.margin-tp--38 {
  margin-top: -38px !important;
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
/* enable-button */
.switch-button1 {
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
.switch-button1:before {
  content: "ENABLE";
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
.switch-button1-checkbox {
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
.switch-button1-checkbox:checked + .switch-button1-label:before {
  transform: translateX(65px);
  background: #0fbd35;
  transition: transform 300ms linear;
}
.switch-button1-checkbox + .switch-button1-label {
  position: relative;
  padding: 5px 0;
  display: block;
  user-select: none;
  pointer-events: none;
}
.switch-button1-checkbox + .switch-button1-label:before {
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
.switch-button1-checkbox + .switch-button1-label .switch-button1-label-span {
  position: relative;
}
.invisible {
  visibility: hidden;
}
</style>