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

    <Container direction="row" align="top" padding="0" gap="30">
      <Wrapper
        borderRadius="4px"
        background="border"
        class="width-50-per height-50-vh"
      >
        <Container direction="column" type="block" padding="25">
          <Typography type="h3" weight="medium" color="dark">
            Review
          </Typography>

          <Typography type="p1" weight="medium" color="primary">
            Step 1
          </Typography>
          <Typography weight="thin" color="dark" class="width-90-per">
            Please download the collated file below and send to your SuperAdmin
            to review and get approval via Email.
          </Typography>
          <Container direction="column" padding="50px 0px 0px 0px" gap="20">
            <Container align="center" class="padding-0">
              <Icon
                name="i-file-csv"
                size="xxx-large"
                type="filled"
                :effects="false"
              ></Icon>
            </Container>

            <Container align="center" class="padding-0">
              <Button
                size="normal"
                type="primary"
                state="outlined"
                @click="onDownload"
                :disabled="false"
                halfwidth
                :loading="false"
              >
                DOWNLOAD
              </Button>
            </Container>
          </Container>
        </Container>
      </Wrapper>
      <Wrapper
        borderRadius="4px"
        background="border"
        class="width-50-per height-50-vh"
      >
        <Container direction="column" type="block" :disabled="disableStep2">
          <Typography type="h3" weight="medium" color="dark">
            Confirmation
          </Typography>

          <Typography type="p1" weight="medium" color="primary">
            Step 2
          </Typography>
          <Typography type="p2" weight="thin" class="width-90-per">
            Upon Approval by SuperAdmin, please take screenshot of the approved
            message or mail and attach below.
          </Typography>
          <FileUpload
            title="Drag and drop files"
            @onFileSelect="addFiles"
            subTitle="(png, jpg. pdf)"
          />

          <Container
            direction="row"
            class="padding-8"
            v-for="(item, index) in fileArray"
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
                @click="removefile(index)"
                color="gray-400"
                :effects="false"
              ></Icon>
            </Container>
          </Container>
        </Container>
      </Wrapper>
    </Container>

    <Container direction="row">
      <Icon name="i-info-fill" size="small" />
      <Typography type="p2" weight="bold"
        >If the SuperAdmin did not approve, please click the “back” button and
        adjust accordingly.</Typography
      >
    </Container>

    <Container direction="row" align="right" :class="{ invisible: showError }">
      <Typography type="p2" weight="medium" color="error"
        >To proceed, attach screenshot(s) as evidence of approval from
        SuperAdmin</Typography
      >
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
  Icon,
  Button,
  FileUpload,
  Wrapper,
} from "@cldcvr/flow";
import Popup from "./Popup.vue";
import { mapState } from "vuex";

export default {
  name: "Review",
  components: {
    Container,
    Typography,
    Icon,
    Button,
    FileUpload,
    Popup,
    Wrapper,
  },
  data() {
    return {
      fileArray: [],
      iconname: "i-tree",
      body: "By proceeding, you will lose all inputs and statuses and will need to re-setup the Landing Zone from start.",
      openModalFlag: false,
      showError: true,
      csvData: [],
      imageUrl: "",
      disableStep2: true,
    };
  },
  computed: {
    ...mapState([
      "ReviewFileData",
      "VarPageData",
      "PrerequisticsData",
      "DownloadedOn",
    ]),
    Check() {
      if (this.fileArray.length >= 1) return true;
      return false;
    },
  },
  mounted() {
    this.fetchReviewfiledata();
    if (this.ReviewFileData != undefined) {
      this.fileArray = this.ReviewFileData;
      this.imageUrl = this.fileArray[0].fileData;
    }
    if (this.DownloadedOn != undefined) this.disableStep2 = false;
    else this.disableStep2 = true;
  },
  methods: {
    onCancel() {
      this.openModalFlag = true;
    },

    // creating downloadable terraform file
    onDownload() {
      let map = new Map();

      this.VarPageData.customLabel.forEach(function (prop) {
        map.set(prop.key, prop.name);
      });

      let EntryData = Object.fromEntries(map);

      let StringifyEntryData = JSON.stringify(EntryData).replace(/:/g, "=");

      this.csvData = {
        group_org_admins: this.VarPageData.GrpAdmin,
        group_billing_admins: this.VarPageData.BillAdmin,
        billing_data_users: this.VarPageData.BillUser,
        audit_data_users: this.VarPageData.AuditUser,
        monitoring_workspace_users: this.VarPageData.MonitorUser,

        org_id: this.PrerequisticsData.GcpId,
        billing_account: this.PrerequisticsData.BillActId,
        default_region: this.VarPageData.DefaultRegion,
        parent_folder: this.VarPageData.ParentFolder,
        project_prefix: this.VarPageData.ProjPrefix,
        folder_prefix: this.VarPageData.FolderPrefix,
        bucket_prefix: this.VarPageData.BucketPrefix,
        log_sink_prefix: this.VarPageData.LogSinkPrefix,
        project_name: this.VarPageData.ProjName,
        primary_contact: this.VarPageData.PrimaryEmail,
        secondary_contact: this.VarPageData.SecEmail,

        // #bootstrap
        runner_repo_name: this.VarPageData.RepoName,
        runner_repo_owner: this.VarPageData.RepoOwner,
        runner_machine_type: this.VarPageData.MachineType,
        num_instances: Number(this.VarPageData.NoOfInst),
        gar_repo_name: this.VarPageData.ArifRegName,

        domains_to_allow: this.VarPageData.LzEnv,
        default_region2: this.VarPageData.SecRegion,
        domain: this.VarPageData.DnsName,

        runner_subnet_ip: this.VarPageData.SubnetName,
        git_pvt_key_scrt_name: this.VarPageData.PrivateKey,
        custom_labels: StringifyEntryData,
      };

      let dataEntry = Object.entries(this.csvData);
      let final;
      for (let i = 0; i < dataEntry.length; i++) {
        if (i == 0)
          final = dataEntry[i][0] + "=" + '"' + dataEntry[i][1] + '"' + `\n`;
        else {
          if (
            dataEntry[i][0] == "custom_labels" ||
            dataEntry[i][0] == "num_instances"
          ) {
            final = final + dataEntry[i][0] + "=" + dataEntry[i][1] + `\n`;
          } else {
            final =
              final +
              dataEntry[i][0] +
              "=" +
              '"' +
              dataEntry[i][1] +
              '"' +
              `\n`;
          }
        }

        if (i == 4 || i == 17 || i == 24 || i == 28) {
          final = final + `\n`;
        }
      }
      let blob = new Blob([final], { type: "text/plain;charset=utf-8;" });
      let link = document.createElement("a");
      let url = URL.createObjectURL(blob);
      link.setAttribute("href", url);
      link.setAttribute("download", `Report.tfvars`);
      link.style.visibility = "hidden";
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      this.disableStep2 = false;
      this.$store.dispatch("setDownloadOn");
    },
    onProceed() {
      this.$emit("cancel");
    },
    onBack() {
      this.$emit("onback", 4);
    },
    onNext() {
      if (this.Check) {
        this.$store.dispatch("setReviewFileData", this.fileArray);
        this.$emit("onNext", 6);
      } else {
        this.showError = this.Check;
      }
    },
    // fetch require data for current form state
    fetchReviewfiledata() {
      this.$store.dispatch("getReviewFileData");
      this.$store.dispatch("getVarData");
      this.$store.dispatch("getPrData");
      this.$store.dispatch("getDownloadOn");
    },
    onPopupcancel() {
      this.openModalFlag = false;
    },

    // Add files
    addFiles(file) {
      let fileData = file[0];
      let reader = new FileReader();
      reader.readAsDataURL(fileData);
      reader.onload = () => {
        this.imageUrl = reader.result;
        this.fileArray.push({
          id: this.fileArray.length + 1,
          fileName: file[0].name,
          fileData: reader.result,
        });
        if (this.Check) {
          this.showError = this.Check;
        }
      };
    },
    // remove file
    removefile(index) {
      this.fileArray.splice(index, 1);
    },
  },
};
</script>
<style scoped>
.clear {
  clear: both;
}
div[disabled="disabled"] {
  pointer-events: none;
  opacity: 0.4;
}
.invisible {
  visibility: hidden;
}
</style>
