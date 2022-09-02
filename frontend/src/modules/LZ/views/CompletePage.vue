<template>
  <Container direction="column" class="width-100-per padding-50">
    <Popup
      :headerText="header"
      :headerBody="body"
      @proceed="onProceed"
      :OpenModelFlag="openModalFlag"
      :CancelFlag="false"
      IconColor="success-300"
      :IconName="iconname"
      :bodyTextFlag="false"
      ButtonText="Done"
    />
    <Container
      direction="row"
      background="element-light"
      class="width-100-per customBrd"
    >
      <Loader v-if="loadFlag" :position="'absolute'"
        ><p class="paragraph-2 fc-light">loading...</p></Loader
      >
      <Container direction="column" class="width-100-per padding-0" :gap="0">
        <Typography type="h2" weight="black" class="fc-dark">
          CLZ Name / Title / Info / serial no. etc
        </Typography>
        <Typography
          type="p3"
          family="default"
          weight="medium"
          color="light"
          class="padding-0"
        >
          Created on 21 may 2022, 04:40 pm
        </Typography>
      </Container>

      <Container direction="row" align="right center" class="width-100-per">
        <Button state="outlined" @click="downloadComplainceReport" halfwidth>
          COMPLIANCE REPORT
        </Button>
        <Button state="outlined" @click="downloadSummaryReport" halfwidth>
          SUMMARY REPORT
        </Button>
      </Container>
    </Container>

    <Container
      direction="column"
      class="width-100-per customBrd padding-4"
      background="element-light"
    >
      <Accordion :open="FlagAccordion.OpenFlag1">
        <template #header>
          <Slab size="medium" type="transparent">
            Standards
            <template #secondary-actions class="width-100-per">
              <Button
                size="x-small"
                type="success"
                state="filled"
                class="customBtn"
                :disabled="false"
                :fullWidth="false"
                :loading="false"
              >
                complete
              </Button>
              <Container padding="0px 0px 0px 50px"></Container>
              <Icon
                name="i-chevron-down"
                color="gray-300"
                size="small"
                @click="FlagAccordion.OpenFlag1 = !FlagAccordion.OpenFlag1"
                :rotate="FlagAccordion.OpenFlag1 ? 180 : 0"
              />
            </template>
          </Slab>
        </template>
        <Container direction="column">
          <Divider :size="1" state="gray-400" />
          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Acknowledged on
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ standardAckOn }}
              </Typography>
            </Container>
          </Container>
        </Container>
      </Accordion>
    </Container>

    <Container
      direction="column"
      class="width-100-per customBrd padding-4"
      background="element-light"
    >
      <Accordion :open="FlagAccordion.OpenFlag2">
        <template #header>
          <Slab size="medium" type="transparent">
            Best Practices
            <template #secondary-actions>
              <Button
                size="x-small"
                type="success"
                state="filled"
                class="customBtn"
                :disabled="false"
                :fullWidth="false"
                :loading="false"
              >
                complete
              </Button>
              <Container padding="0px 0px 0px 50px"></Container>
              <Icon
                name="i-chevron-down"
                color="gray-300"
                size="small"
                @click="FlagAccordion.OpenFlag2 = !FlagAccordion.OpenFlag2"
                :rotate="FlagAccordion.OpenFlag2 ? 180 : 0"
              />
            </template>
          </Slab>
        </template>
        <Container direction="column">
          <Divider :size="1" state="gray-400" />
          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Acknowledged on
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ bestpratAckOn }}
              </Typography>
            </Container>
          </Container>
        </Container>
      </Accordion>
    </Container>
    <Container
      direction="column"
      class="width-100-per customBrd padding-4"
      background="element-light"
    >
      <Accordion :open="FlagAccordion.OpenFlag4">
        <template #header>
          <Slab size="medium" type="transparent">
            Variables - Bootstrap
            <template #secondary-actions>
              <Button
                size="x-small"
                type="success"
                state="filled"
                class="customBtn"
                :disabled="false"
                :fullWidth="false"
                :loading="false"
              >
                complete
              </Button>
              <Container padding="0px 0px 0px 50px"></Container>
              <Icon
                name="i-chevron-down"
                color="gray-300"
                size="small"
                @click="FlagAccordion.OpenFlag4 = !FlagAccordion.OpenFlag4"
                :rotate="FlagAccordion.OpenFlag4 ? 180 : 0"
              />
            </template>
          </Slab>
        </template>
        <Container direction="column">
          <Divider :size="1" state="gray-400" />
          <Container direction="row" :gap="0" class="width-100-per">
            <Container class="width-50-per padding-0">
              <Typography
                type="h2"
                family="default"
                weight="medium"
                color="default"
              >
                Group Details
              </Typography>
            </Container>

            <Container class="width-50-per padding-0">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Group Admin
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.GrpAdmin }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Billing admin
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.BillAdmin }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Billing users
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.BillUser }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Audit users
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.AuditUser }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Monitoring users
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.MonitorUser }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per">
            <Container class="width-50-per padding-0">
              <Typography
                type="h2"
                family="default"
                weight="medium"
                color="default"
              >
                Setup
              </Typography>
            </Container>

            <Container class="width-50-per padding-0">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Parent folder
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.ParentFolder }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Project prefix
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.ProjPrefix }}
              </Typography>
            </Container> </Container
          ><Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Folder prefix
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.FolderPrefix }}
              </Typography>
            </Container> </Container
          ><Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Bucket prefix
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.BucketPrefix }}
              </Typography>
            </Container> </Container
          ><Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Log sink prefix
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.LogSinkPrefix }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Project Name
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.ProjName }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per">
            <Container class="width-50-per padding-0">
              <Typography
                type="h2"
                family="default"
                weight="medium"
                color="default"
              >
                Contact
              </Typography>
            </Container>

            <Container class="width-50-per padding-0">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Primary email contact
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.PrimaryEmail }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Secondary email contact
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.SecEmail }}
              </Typography>
            </Container>
          </Container>

          <Container direction="row" :gap="0" class="width-100-per">
            <Container class="width-50-per padding-0">
              <Typography
                type="h2"
                family="default"
                weight="medium"
                color="default"
              >
                Repo & Runner
              </Typography>
            </Container>

            <Container class="width-50-per padding-0">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Repo name
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.RepoName }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Repo owner
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.RepoOwner }}
              </Typography>
            </Container> </Container
          ><Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Machine type
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.MachineType }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                No. of instances
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.NoOfInst }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Artifact registry name
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.ArifRegName }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per">
            <Container class="width-50-per padding-0">
              <Typography
                type="h2"
                family="default"
                weight="medium"
                color="default"
              >
                Others
              </Typography>
            </Container>

            <Container class="width-50-per padding-0">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Domain to allow in LZ environment
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.LzEnv }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                2nd Region
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.SecRegion }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                DNS name
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.DnsName }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Subnet range
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.SubnetName }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Private Key
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ variablePageData.PrivateKey }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per">
            <Container class="width-50-per padding-0">
              <Typography
                type="h2"
                family="default"
                weight="medium"
                color="default"
              >
                Custom Label
              </Typography>
            </Container>

            <Container class="width-50-per padding-0">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
              </Typography>
            </Container>
          </Container>
          <Container
            class="padding-0"
            :gap="0"
            direction="column"
            v-for="(item, index) in variablePageData.customLabel"
            :key="item.id"
          >
            <Container direction="row" :gap="0" class="width-100-per padding-0">
              <Container class="width-50-per">
                <Typography
                  type="p1"
                  family="default"
                  weight="light"
                  color="light"
                >
                  {{ index + 1 }}. Name
                </Typography>
              </Container>

              <Container class="width-50-per">
                <Typography
                  type="p1"
                  family="default"
                  weight="light"
                  color="dark"
                >
                  {{ item.key }}
                </Typography>
              </Container>
            </Container>
            <Container direction="row" :gap="0" class="width-100-per padding-0">
              <Container class="width-50-per">
                <Typography
                  type="p1"
                  family="default"
                  weight="light"
                  color="light"
                >
                  {{ index + 1 }}. Application
                </Typography>
              </Container>

              <Container class="width-50-per">
                <Typography
                  type="p1"
                  family="default"
                  weight="light"
                  color="dark"
                >
                  {{ item.name }}
                </Typography>
              </Container>
            </Container>
          </Container>
        </Container>
      </Accordion>
    </Container>
    <Container
      direction="column"
      class="width-100-per customBrd padding-4"
      background="element-light"
    >
      <Accordion :open="FlagAccordion.OpenFlag3">
        <template #header>
          <Slab size="medium" type="transparent">
            Prerequisities
            <template #secondary-actions>
              <Button
                size="x-small"
                type="success"
                state="filled"
                class="customBtn"
                :disabled="false"
                :fullWidth="false"
                :loading="false"
              >
                complete
              </Button>
              <Container padding="0px 0px 0px 50px"></Container>
              <Icon
                name="i-chevron-down"
                color="gray-300"
                size="small"
                @click="FlagAccordion.OpenFlag3 = !FlagAccordion.OpenFlag3"
                :rotate="FlagAccordion.OpenFlag3 ? 180 : 0"
              />
            </template>
          </Slab>
        </template>
        <Container direction="column" :gap="0">
          <Divider :size="1" state="gray-400" />
          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Google Cloud Organization ID
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqData.GcpId }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Google Cloud Billing Account ID
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqData.BillActId }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Configure Authentication - Cloud Identity or workspace (G Suite)
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqChecks.switch3 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Quotes for associating projects with billing accounts increased
                to 50
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqChecks.switch4 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Create Cloud identity or Google Workspace (formerly G Suite)
                groups
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqChecks.switch5 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per" align="top">
            <Container direction="column" :gap="4" class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                The group_org_admins group must also have the below permissions:
              </Typography>
              <Typography
                type="p3"
                family="default"
                weight="light"
                color="light"
              >
                roles/resourcemanager.projectCreator
              </Typography>
              <Typography
                type="p3"
                family="default"
                weight="light"
                color="light"
              >
                roles/resourcemanager.organizationAdmin
              </Typography>
              <Typography
                type="p3"
                family="default"
                weight="light"
                color="light"
              >
                roles/billing.admin
              </Typography>
              <Typography
                type="p3"
                family="default"
                weight="light"
                color="light"
              >
                roles/resourcemanager.folderCreator
              </Typography>
            </Container>

            <Container class="width-50-per" direction="column">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqChecks.switch6 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Ensure the user deploying the initial code should be present in
                the group_org_admins group.
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqChecks.switch7 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" align="top" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Create a new branch from the main branch which will be in
                template form, New branch name should be ${bu_name}-init
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqChecks.switch8 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per" align="top">
            <Container direction="column" :gap="4" class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Create bot machine user and a GitHub Token with repo read:org
                and read:discussions
              </Typography>
            </Container>

            <Container class="width-50-per" direction="column">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqChecks.switch9 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            class="width-100-per"
            v-if="prereqChecks.switch10"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Create Slack WebHook Secret in GitHub GCF_SLACK_WEBHOOK , GitHub
                Token Secret in GitHub as GH_TOKEN
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ prereqChecks.switch10 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
        </Container>
      </Accordion>
    </Container>

    <Container
      direction="column"
      class="width-100-per customBrd padding-4"
      background="element-light"
    >
      <Accordion :open="FlagAccordion.OpenFlag5">
        <template #header>
          <Slab size="medium" type="transparent">
            Review
            <template #secondary-actions>
              <Button
                size="x-small"
                type="success"
                state="filled"
                class="customBtn"
                :disabled="false"
                :fullWidth="false"
                :loading="false"
              >
                complete
              </Button>
              <Container padding="0px 0px 0px 50px"></Container>
              <Icon
                name="i-chevron-down"
                color="gray-300"
                size="small"
                @click="FlagAccordion.OpenFlag5 = !FlagAccordion.OpenFlag5"
                :rotate="FlagAccordion.OpenFlag5 ? 180 : 0"
              />
            </template>
          </Slab>
        </template>
        <Container direction="column">
          <Divider :size="1" state="gray-400" />
          <Container direction="row" :gap="0" class="width-100-per">
            <Container class="width-50-per padding-0">
              <Typography
                type="h2"
                family="default"
                weight="medium"
                color="default"
              >
                Group Details
              </Typography>
            </Container>

            <Container class="width-50-per padding-0">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                File download and send to Superadmin for review and approval
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ downloadedOn }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            :gap="0"
            align="top"
            class="width-100-per padding-0"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Screenshot of SuperAdmin’s approval mail or message (Evidence)
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Container
                v-for="item in reviewedFiles"
                :key="item.id"
                :gap="0"
                class="max-width-150 height-100 padding-0"
              >
                <img
                  class="img-custom"
                  :src="item.fileData"
                  @click="openImage(item.fileData)"
                  alt=""
                  width="auto"
                  height="auto"
                />
              </Container>
            </Container>
          </Container>
        </Container>
      </Accordion>
    </Container>

    <Container
      direction="column"
      class="width-100-per customBrd padding-4"
      background="element-light"
    >
      <Accordion :open="FlagAccordion.OpenFlag6">
        <template #header>
          <Slab size="medium" type="transparent">
            Execution of Wrapper Scripts
            <template #secondary-actions>
              <Button
                size="x-small"
                type="success"
                state="filled"
                class="customBtn"
                :disabled="false"
                :fullWidth="false"
                :loading="false"
              >
                complete
              </Button>
              <Container padding="0px 0px 0px 50px"></Container>
              <Icon
                name="i-chevron-down"
                color="gray-300"
                size="small"
                @click="FlagAccordion.OpenFlag6 = !FlagAccordion.OpenFlag6"
                :rotate="FlagAccordion.OpenFlag6 ? 180 : 0"
              />
            </template>
          </Slab>
        </template>
        <Container direction="column" :gap="0">
          <Divider :size="1" state="gray-400" />
          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Add relevant values to the terraform.tfvars of 0-bootstrap in
                the new branch.
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ executionSwitch.switch1 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>

          <Container direction="row" class="width-100-per">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Add correct billing ID in the terraform.tfvars file for the
                initial deployment of the 0-bootstrap stage.
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ executionSwitch.switch2 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>

          <Container direction="row" class="width-100-per" align="top left">
            <Container class="width-50-per" direction="column" :gap="4">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Setup GH_TOKEN as $GITHUB_PAT environment variable and execute
                the wrapper script using below commands (Ensure .terraform
                directories created locally from previous runs are deleted):
              </Typography>
              <Logs
                class="height-50-per"
                content="$ cd ./prerequisites/scripts
$ read -s token
<enter_github_token_obtained_in_step_9>
$ export GITHUB_PAT=$token
$ chmod +x wrapper.sh ; ./wrapper.sh"
                :showSearch="false"
                background="element"
                contentType="shell"
              />
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ executionSwitch.switch3 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per" align="top left">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                After execution of wrapper script, add cloudbuild service
                account from cicd project as a principal in the billing account
                with billing.administrator and billing.user
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ executionSwitch.switch4 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per" align="top left">
            <Container class="width-50-per" direction="column" :gap="4">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Wrapper script will create following branch protection rules for
                branch ${bu_name}-main
              </Typography>
              <Logs
                class="height-50-per"
                content="Require a pull request before merging. 
Required two number of approvals before merging 
Dismiss stale pull request approvals when new commits are pushed 
Require review from Code Owners 
Require status checks to pass before merging 
Require branches to be up to date before merging 
Require conversation resolution before merging. 
Require signed commits. 
Requires administrator 
Allow auto-merge and allow auto-deletion of branches"
                :showSearch="false"
                background="element"
                contentType="string"
              />
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ executionSwitch.switch5 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per" align="top left">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Commit and push changes from .github/workflows , build ,
                0-bootstrap , README.md to ${bu_name}-init and ensure everything
                gets successfully applied.
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ executionSwitch.switch6 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per" align="top left">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                On GitHub, create a new branch ${bu_name}-main from the main
                branch and create a pull request to merge the changes from step
                14 into ${bu_name}-main from ${bu_name}-init .
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ executionSwitch.switch7 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" class="width-100-per" align="top left">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Start deployment by raising PRs for subsequent stages by pushing
                the backend.tf changes made by wrapper script for each stage in
                ${bu_name}-init .
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ executionSwitch.switch8 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
        </Container>
      </Accordion>
    </Container>

    <Container
      direction="column"
      class="width-100-per customBrd padding-4"
      background="element-light"
    >
      <Accordion :open="FlagAccordion.OpenFlag7">
        <template #header>
          <Slab size="medium" type="transparent">
            Deployment
            <template #secondary-actions>
              <Button
                size="x-small"
                type="success"
                state="filled"
                class="customBtn"
                :disabled="false"
                :fullWidth="false"
                :loading="false"
              >
                complete
              </Button>
              <Container padding="0px 0px 0px 50px"></Container>
              <Icon
                name="i-chevron-down"
                color="gray-300"
                size="small"
                @click="FlagAccordion.OpenFlag7 = !FlagAccordion.OpenFlag7"
                :rotate="FlagAccordion.OpenFlag7 ? 180 : 0"
              />
            </template>
          </Slab>
        </template>
        <Container direction="column">
          <Divider :size="1" state="gray-400" />

          <Container direction="row" :gap="0" class="width-100-per">
            <Container class="width-50-per padding-0">
              <Typography
                type="h2"
                family="default"
                weight="medium"
                color="default"
              >
                Group Details
              </Typography>
            </Container>

            <Container class="width-50-per padding-0">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Acknowleged on
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ deployAckOn }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            :gap="0"
            align="top"
            class="width-100-per padding-0"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Deployment of Wrapper script (Evidence)
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Container
                v-for="item in deployData.fileArray"
                :key="item.id"
                :gap="0"
                class="max-width-150 height-100 padding-0"
              >
                <img
                  class="img-custom"
                  :src="item.fileData"
                  alt=""
                  @click="openImage(item.fileData)"
                  width="auto"
                  height="auto"
                />
              </Container>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Deployment of Bootstrap: Pull Request URL
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="deployData.gitAllowPr"
              >
                {{ deployData.Boostrap }}
              </Typography>
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="!deployData.gitAllowPr"
              >
                {{ deployChecks.switch2 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container direction="row" :gap="0" class="width-100-per padding-0">
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Deployment of Org Setup: Pull Request URL
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="deployData.gitAllowPr"
              >
                {{ deployData.OrgSetup }}
              </Typography>
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="!deployData.gitAllowPr"
              >
                {{ deployChecks.switch3 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            :gap="0"
            class="width-100-per padding-0"
            align="top left"
          >
            <Container class="width-50-per" align="top left">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Deployment of Environment Setup: Pull Request URL
              </Typography>
            </Container>

            <Container class="width-50-per" direction="column" align="top left">
              <Container
                v-if="deployData.gitAllowPr"
                direction="column"
                class="padding-0"
                :gap="0"
              >
                <Container
                  direction="row"
                  v-for="(item, index) in deployData.EnvSetup"
                  :key="index"
                  class="padding-0"
                >
                  <Typography
                    type="p1"
                    family="default"
                    weight="light"
                    color="dark"
                  >
                    {{ item.type }}:{{ item.envSetupPrUrl }}
                  </Typography>
                </Container>
              </Container>
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="!deployData.gitAllowPr"
              >
                {{ deployChecks.switch4 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            :gap="0"
            class="width-100-per padding-0"
            align="top left"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                Deployment of Network Setup: Pull Request
              </Typography>
            </Container>

            <Container class="width-50-per" direction="column">
              <Container
                v-if="deployData.gitAllowPr"
                direction="column"
                class="padding-0"
                :gap="0"
              >
                <Container
                  direction="row"
                  v-for="(item, index) in deployData.NetworkSetup"
                  :key="index"
                  class="padding-0"
                >
                  <Typography
                    type="p1"
                    family="default"
                    weight="light"
                    color="dark"
                  >
                    {{ item.type }}:{{ item.networkSetupPrUrl }}
                  </Typography>
                </Container>
              </Container>
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="!deployData.gitAllowPr"
              >
                {{ deployChecks.switch5 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            :gap="0"
            v-for="(item, index) in deployData.BUArray"
            :key="item.id"
            class="width-100-per padding-0"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
                v-if="index == 0"
              >
                Business Unit Name and Code
              </Typography>
            </Container>

            <Container class="width-50-per" direction="row">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="deployData.gitAllowPr"
              >
                Business Name :{{ item.buName }} Business Code:{{ item.buCode }}
              </Typography>

              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="!deployData.gitAllowPr"
              >
                {{ deployChecks.switch6 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            :gap="0"
            class="width-100-per padding-0"
            align="top left"
            v-for="(item, index) in deployData.BUArray"
            :key="item.id"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
                v-if="index == 0"
              >
                Deployment of Project Setup: Pull Request URL
              </Typography>
            </Container>

            <Container class="width-50-per" direction="column">
              <Container
                v-if="deployData.gitAllowPr"
                direction="column"
                class="padding-0"
                :gap="0"
              >
                <Container
                  direction="row"
                  v-for="(innerItem, index) in item.ProjectSetup"
                  :key="index"
                  class="padding-0"
                >
                  <Typography
                    type="p1"
                    family="default"
                    weight="light"
                    color="dark"
                  >
                    {{ item.buName }}:({{ innerItem.type }}):{{
                      innerItem.projectSetupPrUrl
                        ? innerItem.projectSetupPrUrl
                        : "No data found"
                    }}
                  </Typography>
                </Container>
              </Container>
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="!deployData.gitAllowPr"
              >
                {{ deployChecks.switch7 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>

          <Container
            direction="row"
            :gap="0"
            align="top left"
            class="width-100-per padding-0"
            v-for="(item, index) in deployData.BUArray"
            :key="item.id"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
                v-if="index == 0"
              >
                Deployment of Application Infrastructure Setup: Pull Request URL
              </Typography>
            </Container>

            <Container class="width-50-per" direction="column">
              <Container
                v-if="deployData.gitAllowPr"
                direction="column"
                class="padding-0"
                :gap="0"
              >
                <Container
                  direction="row"
                  v-for="(innerItem, index) in item.instruSetup"
                  :key="index"
                  class="padding-0"
                >
                  <Typography
                    type="p1"
                    family="default"
                    weight="light"
                    color="dark"
                  >
                    {{ item.buName }}:({{ innerItem.type }}):{{
                      innerItem.instruSetupPrUrl
                        ? innerItem.instruSetupPrUrl
                        : "No data found"
                    }}
                  </Typography>
                </Container>
              </Container>
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
                v-if="!deployData.gitAllowPr"
              >
                {{ deployChecks.switch8 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            :gap="0"
            class="width-100-per padding-0"
            v-if="deployData.kccScript"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                KCC - Kubernetes Config Controller: Pull Request URL
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ deployData.kccScript }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            :gap="0"
            class="width-100-per padding-0"
            v-if="deployData.kccScript"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                KCC - Execute Scripts to Import Required Resources into KCC.
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                Script Executed
              </Typography>
            </Container>
          </Container>

          <Container
            direction="row"
            :gap="0"
            class="width-100-per padding-0"
            v-if="!deployData.gitAllowPr"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                KCC - Kubernetes Config Controller: Pull Request URL
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ deployChecks.switch9 ? "Completed" : "Not Completed" }}
              </Typography>
            </Container>
          </Container>
          <Container
            direction="row"
            :gap="0"
            class="width-100-per padding-0"
            v-if="!deployData.gitAllowPr"
          >
            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="light"
              >
                KCC - Execute Scripts to Import Required Resources into KCC.
              </Typography>
            </Container>

            <Container class="width-50-per">
              <Typography
                type="p1"
                family="default"
                weight="light"
                color="dark"
              >
                {{ deployChecks.switch10 ? "Script Executed" : "Not Executed" }}
              </Typography>
            </Container>
          </Container>
        </Container>
      </Accordion>
    </Container>
  </Container>
</template>
<script>
import {
  Container,
  Typography,
  Button,
  Accordion,
  Slab,
  Icon,
  Logs,
  Divider,
  Loader,
} from "@cldcvr/flow";
import Popup from "../components/Popup.vue";
import { mapState } from "vuex";
import reusableContent from "../../utils/ReuseableContent";
import Service from "../../api/lz-service";
import * as ExcelData from "../../constants/constant.json";
export default {
  name: "CompletePage",
  components: {
    Popup,
    Container,
    Logs,
    Typography,
    Button,
    Accordion,
    Slab,
    Icon,
    Divider,
    Loader,
  },
  data() {
    return {
      header: "Successfully Setup Landing Zone",
      openAccordion: false,
      body: "Your organization is all set and ready to govern a secure, compliant mulit-account environment.",
      openModalFlag: true,
      iconname: "i-tick-2",
      ImageUrl: "",
      loadFlag: false,
      FlagAccordion: {
        OpenFlag1: false,
        OpenFlag2: false,
        OpenFlag3: false,
        OpenFlag4: false,
        OpenFlag5: false,
        OpenFlag6: false,
        OpenFlag7: false,
      },
      standardAckOn: "",
      bestpratAckOn: "",
      variablePageData: {},
      prereqData: {},
      prereqChecks: {},
      downloadedOn: "",
      reviewedFiles: [],
      deployData: {},
      deployAckOn: "",
      executionSwitch: {},
      deployChecks: {},
    };
  },
  computed: {
    ...mapState([
      "StandardAckOn",
      "BestPracticesAckOn",
      "VarPageData",
      "PrerequisticsData",
      "PrerequisticsCheck",
      "DownloadedOn",
      "ReviewFileData",
      "DeployData",
      "DeployAckOn",
      "ExecutionSwitch",
      "DeployChecks",
    ]),
  },
  mounted() {
    this.fetchAllData();
  },
  methods: {
    onProceed() {
      this.openModalFlag = false;
    },
    // below method is for  creating summary report and  making it downlaodable
    async downloadSummaryReport() {
      this.loadFlag = true;
      let excelData = ExcelData.summaryData;
      try {
        let reportResp = await Service.getReportData();
        if (reportResp.status == 200) {
          const resourceData = reportResp.data.body;
          let key = Object.keys(resourceData);
          let dataToPush;
          let splitData2 = excelData.slice(8, 16);
          let splitData1 = excelData.slice(0, 8);
          for (let item of key) {
            dataToPush = {
              head1: "",
              head2: this.capitalizeFirstLetter(item),
              head3: resourceData[item],
            };
            splitData1.push(dataToPush);
          }

          let allExcelData = splitData1.concat(splitData2);
          try {
            let evidenceResp = await Service.getEvidenceData();
            if (evidenceResp.status == 200) {
              let evidenceUrl = evidenceResp.data.body;
              dataToPush = {
                head1: "",
                head2: "Envidence bucket",
                head3: evidenceUrl,
              };
              allExcelData.push(dataToPush);
            }
          } catch (error) {
            alert("File doesn't Exist");
          }
          dataToPush = {
            head1: "",
            head2: "Compliance board",
            head3: `https://console.cloud.google.com/security/command-center/overview?organizationId=${this.prereqData.GcpId}&orgonly=true&supportedpurview=organizationId`,
          };
          allExcelData.push(dataToPush);
          this.loadFlag = false;
          reusableContent.methods.downloadCsv(allExcelData, "Summary Report");
        }
      } catch (error) {
        this.loadFlag = false;
        alert("Make Sure backend server is running");
      }
    },
    capitalizeFirstLetter(string) {
      return string.charAt(0).toUpperCase() + string.slice(1);
    },
    // below method is for  creating complaince report and  making it downlaodable
    downloadComplainceReport() {
      let excelData = ExcelData.excelData;
      reusableContent.methods.downloadCsv(excelData, "Complaince Report");
    },
    // below mehtods for open image in new tab
    openImage(ImgData) {
      let image = new Image();
      image.src = ImgData;

      let w = window.open("");
      w.document.write(image.outerHTML);
    },
    // fetch all require data for current page from state
    fetchAllData() {
      this.$store.dispatch("getBestPracticeAck");
      this.$store.dispatch("getStandardAck");
      this.$store.dispatch("getReviewFileData");
      this.$store.dispatch("getDownloadOn");
      this.$store.dispatch("getVarData");
      this.$store.dispatch("getPrData");
      this.$store.dispatch("getPrChecks");
      this.$store.dispatch("getDeployData");
      this.$store.dispatch("getDeployCheck");
      this.$store.dispatch("getDeployAckOn");
      this.$store.dispatch("getExecutionData");
      if (this.StandardAckOn) {
        this.standardAckOn = this.StandardAckOn;
      } else {
        this.standardAckOn = "No data found";
      }
      if (this.DownloadedOn) {
        this.downloadedOn = this.DownloadedOn;
      } else {
        this.downloadedOn = "No data found";
      }
      if (this.DeployAckOn) {
        this.deployAckOn = this.DeployAckOn;
      } else {
        this.deployAckOn = "No data found";
      }

      if (this.BestPracticesAckOn) {
        this.bestpratAckOn = this.BestPracticesAckOn;
      } else {
        this.bestpratAckOn = "No data found";
      }
      if (this.ReviewFileData) {
        this.reviewedFiles = this.ReviewFileData;
      } else {
        this.reviewedFiles = [];
      }
      
      if (this.ExecutionSwitch) {
        this.executionSwitch = this.ExecutionSwitch;
      } else {
        this.executionSwitch = {
          switch1: false,
          switch2: false,
          switch3: false,
          switch4: false,
          switch5: false,
          switch6: false,
          switch7: false,
          switch8: false,
        };
      }
      if (
        this.DeployData !== undefined &&
        this.DeployData &&
        this.DeployData.gitAllowPr
      ) {
        this.deployData = this.DeployData;
      } else if (
        this.DeployData !== undefined &&
        this.DeployChecks !== undefined &&
        !this.DeployData.gitAllowPr &&
        this.DeployChecks
      ) {
        this.deployData.fileArray = this.DeployData.fileArray;
        this.deployChecks = this.DeployChecks;
      } 
      else {
        this.deployChecks = {
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

        this.deployData = {
          gitAllowPr: false,
          wrapperFile: "No data found",
          Boostrap: "No data found",
          OrgSetup: "No data found",
          EnvSetup: [
            {
              id: 1,
              envSetupPrUrl: "No data found",
              type: "dev",
              gitResp: false,
            },
            {
              id: 2,
              envSetupPrUrl: "No data found",
              type: "stage",
              gitResp: false,
            },
            {
              id: 3,
              envSetupPrUrl: "No data found",
              type: "prod",
              gitResp: false,
            },
          ],
          NetworkSetup: [
            {
              id: 1,
              networkSetupPrUrl: "No data found",
              type: "shared",
              gitResp: false,
            },
            {
              id: 2,
              networkSetupPrUrl: "No data found",
              type: "dev",
              gitResp: false,
            },
            {
              id: 3,
              networkSetupPrUrl: "No data found",
              type: "stage",
              gitResp: false,
            },
            {
              id: 4,
              networkSetupPrUrl: "No data found",
              type: "prod",
              gitResp: false,
            },
          ],
          ProjectSetup: [
            { id: 1, projectSetupPrUrl: "No data found", gitResp: false },
            { id: 2, projectSetupPrUrl: "No data found", gitResp: false },
            { id: 3, projectSetupPrUrl: "No data found", gitResp: false },
          ],

          BUArray: [
            {
              id: 1,
              buName: "No data found",
              buCode: "No data found",
              isValidCode: false,
              isValidName: false,
              buprFlag: false,
              submitFlag: false,
              editFlag: true,
              ProjectSetup: [
                {
                  id: 1,
                  projectSetupPrUrl: "No data found",
                  type: "dev",
                  gitResp: false,
                },
                {
                  id: 2,
                  projectSetupPrUrl: "No data found",
                  type: "stage",
                  gitResp: false,
                },
                {
                  id: 3,
                  projectSetupPrUrl: "No data found",
                  type: "prod",
                  gitResp: false,
                },
              ],
              instruSetup: [
                {
                  id: 1,
                  instruSetupPrUrl: "No data found",
                  type: "dev",
                  gitResp: false,
                },
                {
                  id: 2,
                  instruSetupPrUrl: "No data found",
                  type: "stage",
                  gitResp: false,
                },
                {
                  id: 3,
                  instruSetupPrUrl: "No data found",
                  type: "prod",
                  gitResp: false,
                },
              ],
            },
          ],
        }
      }
    
        if (this.PrerequisticsCheck) {
          this.prereqChecks = this.PrerequisticsCheck;
        } else {
          this.prereqChecks = {
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
        }
        if (this.PrerequisticsData) {
          this.prereqData = this.PrerequisticsData;
        } else {
          this.prereqData = {
            GcpId: "No data found",
            BillActId: "No data found",
          };
        }
        if (this.VarPageData) {
          this.variablePageData = this.VarPageData;
        } else {
          this.variablePageData = {
            GrpAdmin: "No data found",
            BillAdmin: "No data found",
            BillUser: "No data found",
            AuditUser: "No data found",
            MonitorUser: "No data found",
            ParentFolder: "No data found",
            ProjPrefix: "No data found",
            FolderPrefix: "No data found",
            BucketPrefix: "No data found",
            LogSinkPrefix: "No data found",
            ProjName: "No data found",
            PrimaryEmail: "No data found",
            SecEmail: "No data found",
            RepoName: "No data found",
            RepoOwner: "No data found",
            MachineType: "No data found",
            NoOfInst: "No data found",
            ArifRegName: "No data found",
            LzEnv: "No data found",
            DefaultRegion: "No data found",
            SecRegion: "No data found",
            DnsName: "No data found",
            SubnetName: "No data found",
            PrivateKey: "No data found",
            customLabel: [
              {
                id: 1,
                key: "No data found",
                name: "No data found",
              },
            ],
          };
        }

    },
  },
};
</script>
<style scoped>
.customBrd {
  border-radius: 4px !important;
}
.customBtn {
  background: #0fbd35 !important;
  border-radius: 7px !important;
  color: #ffffff !important;
  padding: 14px 4px !important;
}
.img-custom {
  border: 2px solid #3a4d64;
  padding: 5px;
  border-radius: 4px;
  max-width: 100%;
  height: auto;
}
</style>