<template>
  <Wrapper class="wrap padding-0" borderRadius="4px">
    <Popup
      headerText="Are You Sure?"
      :headerBody="body"
      :CancelFlag="true"
      :OpenModelFlag="openModalFlag"
      :bodyTextFlag="false"
      @proceed="onProceed"
      :IconName="iconname"
      @cancelPopup="onPopupCancel"
      ButtonText="YES, PROCEED"
    />
    <Wrapper borderRadius="4px" background="border">
      <Container direction="column" padding="30">
        <Typography type="h3" weight="medium" class="fc-dark">
          Bootstrap
        </Typography>

        <Container direction="column" padding="0px 0px 0px 0px" gap="20">
          <Container direction="column" padding="15px 0px 15px 0px" gap="20">
            <Typography type="h4" weight="medium" color="dark">
              Group Details
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
                    Group Admin
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsGrpAdmin"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.GrpAdmin"
                class="width-70-per"
                @keyup="copyAll"
                placeholder="Enter domain name Ex:- group_org_admins@<DOMAIN NAME>"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="emailCheck(VariablePageData.GrpAdmin, 'GrpAdminFlag')"
              >
                Enter Valid Group Admin ID
              </Typography>
              <Container padding="0px 0px 10px 0px" direction="row" :gap="10">
                <Checkbox
                  :checked.sync="checkall"
                  @click="copyAll"
                  :size="size"
                  :state="state"
                  :disabled="disabled"
                >
                </Checkbox>
                <Typography type="p2">
                  Apply same for all group items below
                </Typography>
              </Container>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Billing Admin
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsBillAdmin"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.BillAdmin"
                class="width-70-per"
                placeholder="Enter domain name Ex:- group_bill_admins@<DOMAIN NAME>"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="emailCheck(VariablePageData.BillAdmin, 'BillAdminFlag')"
              >
                Enter Valid Billing Admin ID
              </Typography>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Billing User
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsBillUser"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.BillUser"
                class="width-70-per"
                placeholder="Enter domain name Ex:- group_bill_user@<DOMAIN NAME>"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="emailCheck(VariablePageData.BillUser, 'BillUserFlag')"
              >
                Enter Valid Billing User ID
              </Typography>
            </FormField>
            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Audit User
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsAudituser"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.AuditUser"
                class="width-70-per"
                placeholder="Enter domain name Ex:- group_audit_user@<DOMAIN NAME>"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="emailCheck(VariablePageData.AuditUser, 'AuditUserFlag')"
              >
                Enter Valid Audit Users ID
              </Typography>
            </FormField>
            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Monitoring User
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsMontrUser"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.MonitorUser"
                class="width-70-per"
                placeholder="Enter domain name Ex:- group_monitor_user@<DOMAIN NAME>"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  emailCheck(VariablePageData.MonitorUser, 'MonitorUserFlag')
                "
              >
                Enter Valid Monitoring Users ID
              </Typography>
            </FormField>
          </Container>

          <Divider />

          <Container direction="column" padding="15px 0px 15px 0px" gap="20">
            <Typography type="h4" weight="medium" color="dark">
              Setup
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
                    Parent Folder (Optional)
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsPrntFld"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.ParentFolder"
                class="width-50-per"
                placeholder="Enter parent folder name"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  alphabetCheck(
                    VariablePageData.ParentFolder,
                    'ParentFolderFlag'
                  )
                "
              >
                Input must only be in alphabets
              </Typography>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Project Prefix
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsPrjPrefix"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.ProjPrefix"
                class="width-50-per"
                placeholder="Enter project prefix"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  alphabetCheck(VariablePageData.ProjPrefix, 'ProjPrefixFlag')
                "
              >
                Input must only be in alphabets
              </Typography>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Folder Prefix
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsFldPrefix"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.FolderPrefix"
                class="width-50-per"
                placeholder="Enter folder prefix"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  alphabetCheck(
                    VariablePageData.FolderPrefix,
                    'FolderPrefixFlag'
                  )
                "
              >
                Input must only be in alphabets
              </Typography>
            </FormField>
            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Bucket Prefix
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsBuckPrefix"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.BucketPrefix"
                class="width-50-per"
                placeholder="Enter bucket prefix"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  alphabetCheck(
                    VariablePageData.BucketPrefix,
                    'BucketPrefixFlag'
                  )
                "
              >
                Input must only be in alphabets
              </Typography>
            </FormField>
            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Log Sink Prefix
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsLogPrefix"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.LogSinkPrefix"
                class="width-50-per"
                placeholder="Enter log sink prefix"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  alphabetCheck(
                    VariablePageData.LogSinkPrefix,
                    'LogSinkPrefixFlag'
                  )
                "
              >
                Input must only be in alphabets
              </Typography>
            </FormField>
            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Project Name
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsPrjName"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.ProjName"
                class="width-50-per"
                placeholder="Enter project name"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="alphabetCheck(VariablePageData.ProjName, 'ProjNameFlag')"
              >
                Input must only be in alphabets
              </Typography>
            </FormField>
          </Container>

          <Divider />

          <Container direction="column" padding="15px 0px 15px 0px" gap="20">
            <Typography type="h4" weight="medium" color="dark">
              Contact
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
                    Primary Email Contact
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsPrmyContact"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.PrimaryEmail"
                class="width-50-per"
                placeholder="Enter email Ex:- some_text_at_<domain_name>_com"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  userEmailCheck(VariablePageData.PrimaryEmail, 'PrimaryEmailFlag')
                "
              >
                Enter Valid Email
              </Typography>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Secondary Email Contact
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsSecContact"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.SecEmail"
                class="width-50-per"
                placeholder="Enter email Ex:- some_text_at_<domain_name>_com"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="userEmailCheck(VariablePageData.SecEmail, 'SecEmailFlag')"
              >
                Enter Valid Email
              </Typography>
            </FormField>
          </Container>

          <Divider />

          <Container direction="column" padding="15px 0px 15px 0px" gap="20">
            <Typography type="h4" weight="medium" color="dark">
              {{ `Repo & Runner` }}
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
                    Repo Name
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsRepoName"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.RepoName"
                class="width-50-per"
                placeholder="Enter name Ex:- gcp_lz"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="gitRepoCheck(VariablePageData.RepoName, 'RepoNameFlag')"
              >
                Input must only be in alphabets
              </Typography>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Repo Owner
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsRepoOwner"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.RepoOwner"
                class="width-50-per"
                placeholder="Enter name Ex:- owner_name"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  alphabetCheck(VariablePageData.RepoOwner, 'RepoOwnerFlag')
                "
              >
                Input must only be in alphabets
              </Typography>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Machine Type (Optional)
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsMachineType"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.MachineType"
                class="width-50-per"
                placeholder="Enter Machine type Ex:- n1-standard-1"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  regionCheck(VariablePageData.MachineType, 'MachineTypeFlag')
                "
              >
                Enter valid Machine Type
              </Typography>
            </FormField>
            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    No. of Instances
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsNoInst"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>

              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.NoOfInst"
                class="width-50-per"
                :maxlength="1"
                placeholder="Enter number Ex:- 3"
              />

              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="numberCheck(VariablePageData.NoOfInst, 'NoOfInstFlag')"
              >
                Input must only be in number
              </Typography>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Artifact registry name
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsArtregName"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.ArifRegName"
                class="width-50-per"
                placeholder="Enter name Ex:- gcf-lz-image"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  gitRepoCheck(VariablePageData.ArifRegName, 'ArifRegNameFlag')
                "
              >
                Input must only be in alphabets
              </Typography>
            </FormField>
          </Container>

          <Divider />

          <Container direction="column" padding="15px 0px 15px 0px" gap="20">
            <Typography type="h4" weight="medium" color="dark">
              Others
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
                    Domain to allow in LZ environment
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsLzDomain"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.LzEnv"
                class="width-70-per"
                placeholder="Enter domain / URL Ex:- domain_name.com"
              />

              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="domainCheck(VariablePageData.LzEnv, 'LzEnvFlag')"
              >
                Enter valid Domain for LZ
              </Typography>
            </FormField>
            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Default Region
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsDefltReg"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.DefaultRegion"
                class="width-60-per"
                placeholder="Enter Region Ex:- asia-southeast1"
              />

              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  regionCheck(
                    VariablePageData.DefaultRegion,
                    'DefaultRegionFlag'
                  )
                "
              >
                Enter valid region
              </Typography>
            </FormField>
            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Default Region 2
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsDefltRegn2"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                @blur="checkError"
                :value.sync="VariablePageData.SecRegion"
                class="width-50-per"
                placeholder="Enter region Ex:- us-west1"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="regionCheck(VariablePageData.SecRegion, 'SecRegionFlag')"
              >
                Enter valid region
              </Typography>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    DNS name
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsDnsName"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                :value.sync="VariablePageData.DnsName"
                @blur="checkError"
                class="width-50-per"
                placeholder="Enter name Ex:- Example.com."
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="domainCheck(VariablePageData.DnsName, 'DnsNameFlag')"
              >
                Enter valid DNS Value
              </Typography>
            </FormField>
            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Subnet range
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsSubnetRange"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                :value.sync="VariablePageData.SubnetName"
                @blur="checkError"
                class="width-50-per"
                placeholder="Enter range Ex:- 192.168.0.0/24"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="ipCheck(VariablePageData.SubnetName, 'SubnetNameFlag')"
              >
                Enter Valid subnet range
              </Typography>
            </FormField>

            <FormField class="padding-0">
              <label for="">
                <Container class="padding-0" direction="row" :gap="4">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Private Key (Optional)
                  </Typography>
                  <Icon
                    color="gray-300"
                    name="i-info-fill"
                    v-tooltip="toolTip.toolTipsPvtKey"
                    size="x-small"
                    :effects="false"
                  />
                </Container>
              </label>
              <InputText
                :value.sync="VariablePageData.PrivateKey"
                @blur="checkError"
                class="width-50-per"
                placeholder="Enter private key Ex:- git-gcplz-ssh-pvt"
              />
              <Typography
                type="p2"
                weight="medium"
                color="error"
                v-if="
                  gitRepoCheck(VariablePageData.PrivateKey, 'PrivateKeyFlag')
                "
              >
                Enter valid private key
              </Typography>
            </FormField>
          </Container>

          <Divider />

          <Container direction="column" padding="15px 0px 15px 0px" gap="20">
            <Typography type="h4" weight="medium" color="dark">
              <Container direction="row" :gap="4" padding="0">
                Custom Labels

                <Icon
                  color="gray-300"
                  name="i-info-fill"
                  v-tooltip="toolTip.toolTipsCustLabel"
                  size="x-small"
                  :effects="false"
                />
              </Container>
            </Typography>

            <Container
              direction="row"
              padding="0"
              v-for="(item, index) in VariablePageData.customLabel"
              :key="item.id"
            >
              <FormField class="padding-0 width-30-per">
                <label for="">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Name
                  </Typography></label
                >
                <InputText
                  :value.sync="item.key"
                  class="width-100-per"
                  @blur="checkError"
                  id="item.key+index"
                  placeholder="Enter key"
                />
              </FormField>

              <FormField class="padding-0 width-30-per">
                <label for="">
                  <Typography
                    type="p3"
                    family="default"
                    weight="medium"
                    color="light"
                  >
                    Application Name
                  </Typography></label
                >
                <InputText
                  :value.sync="item.name"
                  id="item.name+index"
                  @blur="checkError"
                  class="width-100-per"
                  placeholder="Enter Name"
                />
              </FormField>
              <Container
                clickable="true"
                background="element"
                padding="7px 15px"
                class="bg margin-tp-18"
                :gap="0"
              >
                <p @click="add">+</p></Container
              >
              <Container
                clickable="true"
                background="element"
                padding="7px 15px"
                class="bg margin-tp-18"
                :gap="0"
                v-if="VariablePageData.customLabel.length > 1"
              >
                <p @click="remove(index)">x</p>
              </Container>
            </Container>
          </Container>
        </Container>
      </Container>
    </Wrapper>
    <Container padding="20px 0px 20px 0px" align="right">
      <Typography
        type="p2"
        weight="light"
        color="error"
        :class="{ invisible: showError }"
      >
        To proceed, all items’ mentioned above should be setup and status
        updated to “Complete”.
      </Typography>
    </Container>

    <Container padding="10px 0px 10px 0px" align="space-between">
      <Button state="outlined" @click="onCancel"> CANCEL </Button>
      <span v-if="Check"></span>
      <Container padding="0">
        <Button state="outlined" @click="onBack"> BACK </Button>
        <Button state="filled" @click="onNext"> NEXT </Button>
      </Container>
    </Container>
  </Wrapper>
</template>
<script>
import {
  Container,
  InputText,
  FormField,
  Checkbox,
  Button,
  Icon,
  Typography,
  Divider,
  Wrapper,
} from "@cldcvr/flow";
import Popup from "./Popup.vue";
import { mapState } from "vuex";
import * as ConstantData from "../../constants/constant.json";
export default {
  name: "Variable",
  components: {
    Container,
    InputText,
    FormField,
    Checkbox,
    Icon,
    Button,
    Typography,
    Popup,
    Divider,
    Wrapper,
  },
  data() {
    return {
      GrpAdmin: "hello",
      checkall: false,
      customLabel: [
        {
          id: 1,
          key: "",
          name: "",
        },
      ],
      iconname: "i-tree",
      VariablePageValidData: {
        GrpAdminFlag: false,
        BillAdminFlag: false,
        BillUserFlag: false,
        AuditUserFlag: false,
        MonitorUserFlag: false,
        ParentFolderFlag: false,
        ProjPrefixFlag: false,
        FolderPrefixFlag: false,
        BucketPrefixFlag: false,
        LogSinkPrefixFlag: false,
        ProjNameFlag: false,
        PrimaryEmailFlag: false,
        SecEmailFlag: false,
        RepoNameFlag: false,
        RepoOwnerFlag: false,
        MachineTypeFlag: false,
        NoOfInstFlag: 0,
        ArifRegNameFlag: false,
        LzEnvFlag: false,
        DefaultRegionFlag: false,
        SecRegionFlag: false,
        DnsNameFlag: false,
        SubnetNameFlag: false,
        PrivateKeyFlag: false,
      },
      VariablePageData: {
        //maintain the position of object attribute
        GrpAdmin: "",
        BillAdmin: "",
        BillUser: "",
        AuditUser: "",
        MonitorUser: "",
        ParentFolder: "",
        ProjPrefix: "",
        FolderPrefix: "",
        BucketPrefix: "",
        LogSinkPrefix: "",
        ProjName: "",
        PrimaryEmail: "",
        SecEmail: "",
        RepoName: "",
        RepoOwner: "",
        MachineType: "",
        NoOfInst: 0,
        ArifRegName: "",
        LzEnv: "",
        DefaultRegion: "",
        SecRegion: "",
        DnsName: "",
        SubnetName: "",
        PrivateKey: "", // add new attribute from here

        customLabel: [
          {
            id: 1,
            key: "",
            name: "",
          },
        ],
      },
      showError: true,
      toolTip: {
        content:
          "<span class='fa-dark fs-12 paragraph-1'>Add description text here. Add description text here. Add description text here. Add description text here. Add description text here. Add description text here. </span>",
        container: "div.flow-layout",
        classes: ["black"],
      },
      body: "By proceeding, you will lose all inputs and statuses and will need to re-setup the Landing Zone from start.",
      openModalFlag: false,
    };
  },
  computed: {
    ...mapState(["VarPageData"]),
    Check() {
      // this method will check that user has fill all the  require field or not
      const val = Object.values(this.VariablePageData);
      const val2 = Object.values(this.VariablePageValidData);

      val.splice(5, 1); //optional are removed
      val.splice(14, 1); //optional are removed
      val.splice(21, 1); //optional are removed
      val2.splice(5, 1); //optional are removed
      val2.splice(14, 1); //optional are removed
      val2.splice(21, 1); //optional are removed

      const findVal = val.indexOf("");
      const findval2 = val2.indexOf(false);
      const custval = val[val.length - 1].findIndex(
        (x) => x.name == "" || x.key == ""
      );
      if (findVal == -1 && custval == -1 && findval2 == -1) {
        return true;
      }
      return false;
    },
  },
  mounted() {
    this.toolTip = ConstantData.toolTips;
    this.VariablePageData.MachineType = "n1-standard-1";
    this.fetchVarData();
    if (this.VarPageData != undefined) this.VariablePageData = this.VarPageData;
  },
  methods: {
    copyAll() {
      if (this.checkall) {
        this.VariablePageData.BillAdmin = this.VariablePageData.GrpAdmin;
        this.VariablePageData.BillUser = this.VariablePageData.GrpAdmin;
        this.VariablePageData.AuditUser = this.VariablePageData.GrpAdmin;
        this.VariablePageData.MonitorUser = this.VariablePageData.GrpAdmin;
      } else {
        this.VariablePageData.BillAdmin = "";
        this.VariablePageData.BillUser = "";
        this.VariablePageData.AuditUser = "";
        this.VariablePageData.MonitorUser = "";
      }
    },
    onCancel() {
      this.openModalFlag = true;
    },
    onProceed() {
      this.$emit("cancel");
    },
    onPopupCancel() {
      this.openModalFlag = false;
    },
    onBack() {
      this.$emit("onback", 2);
    },
    onNext() {
      if (this.Check) {
        this.$emit("onNext", 4);
        this.$store.dispatch("setVarData", this.VariablePageData);
      } else {
        this.showError = this.Check;
      }
    },
    checkError() {
      if (this.Check) {
        this.showError = this.Check;
      }
    },
    fetchVarData() {
      this.$store.dispatch("getVarData");
    },
    alphabetCheck(data, validFlag) {
      // method for validating only alphabets field
      if (data != "") {
        const regex = /^[A-Za-z]+$/gm;
        const regFlag = regex.test(data);
        this.VariablePageValidData[validFlag] = regFlag;
        return !regFlag;
      } else {
        this.VariablePageValidData[validFlag] = false;
        return false;
      }
    },
    gitRepoCheck(data, validFlag) {
      // method for validating only alphabets field
      if (data != "") {
        const regex = /^[A-Za-z0-9-]+$/gm;
        const regFlag = regex.test(data);
        this.VariablePageValidData[validFlag] = regFlag;
        return !regFlag;
      } else {
        this.VariablePageValidData[validFlag] = false;
        return false;
      }
    },
    emailCheck(email, validFlag) {
      // method for validating emails
      if (email != "") {
        const regex =
          /^\w{1,20}(-?\.\w{1,10}){0,20}@\w{2,10}([-]?\w{1,10})*(\.\w{2,3})+$/g;
        const regFlag = regex.test(email);
        this.VariablePageValidData[validFlag] = regFlag;
        return !regFlag;
      } else {
        this.VariablePageValidData[validFlag] = false;
        return false;
      }
    },
    userEmailCheck(email, validFlag) {
      // method for validating emails
      if (email != "") {
        const regex =
          /^\w{1,20}(-?\.\w{1,10}){0,20}_at_\w{2,10}([-]?\w{1,10})*(_\w{2,3})+$/g;
        const regFlag = regex.test(email);
        this.VariablePageValidData[validFlag] = regFlag;
        return !regFlag;
      } else {
        this.VariablePageValidData[validFlag] = false;
        return false;
      }
    },
    ipCheck(ip, validFlag) {
      if (ip != "") {
        // Matches max values in 255.255.255.25/32
        // subnet range max value is 32
        // Ip segment max value is 255
        const regex =
          /^\b(1?[0-9]{1,2}|2[0-4][0-9]|25[0-5])\b.\b(1?[0-9]{1,2}|2[0-4][0-9]|25[0-5])\b.\b(1?[0-9]{1,2}|2[0-4][0-9]|25[0-5])\b.\b(1?[0-9]{1,2}|2[0-4][0-9]|25[0-5])\b\/\b(0?[1-9]|[1-2][0-9]|3[0-2])\b$/g;
        const regFlag = regex.test(ip);
        this.VariablePageValidData[validFlag] = regFlag;
        return !regFlag;
      } else {
        this.VariablePageValidData[validFlag] = false;
        return false;
      }
    },
    domainCheck(domain, validFlag) {
      if (domain != "") {
        let regex;
        if (validFlag == "LzEnvFlag") regex = /\w{1,10}(\.\w{2,3})+$/g;
        else regex = /^\w{1,10}(\.\w{2,3})\.$/g;

        const regFlag = regex.test(domain);
        this.VariablePageValidData[validFlag] = regFlag;
        return !regFlag;
      } else {
        this.VariablePageValidData[validFlag] = false;
        return false;
      }
    },
    regionCheck(data, validFlag) {
      if (data != "") {
        const regex = /^\w{1,10}-{1,10}\w{0,10}-{0,10}\w+$/gm;
        const regFlag = regex.test(data);
        this.VariablePageValidData[validFlag] = regFlag;
        return !regFlag;
      } else {
        this.VariablePageValidData[validFlag] = false;
        return false;
      }
    },
    numberCheck(data, validFlag) {
      if (data != "") {
        const regex = /^\d$/gm;
        const regFlag = regex.test(data);
        this.VariablePageValidData[validFlag] = regFlag;
        return !regFlag;
      } else {
        this.VariablePageValidData[validFlag] = false;
        return false;
      }
    },
    // add custom labels
    add() {
      this.VariablePageData.customLabel.push({
        id: this.VariablePageData.customLabel.length + 1,
        key: "",
        name: "",
      });
    },
    remove(i) {
      this.VariablePageData.customLabel.splice(i, 1);
    },
  },
};
</script>
<style scoped>
.invisible {
  visibility: hidden;
}
.bg {
  border-radius: 4px;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}
</style>
