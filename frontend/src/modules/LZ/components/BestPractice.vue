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
      @cancelPopup="onPopupCancel"
      ButtonText="YES, PROCEED"
    />

    <Wrapper borderRadius="4px" background="border">
      <Container
        :padding="20"
        direction="column"
        :gap="10"
        class="width-100-per"
        align="top"
      >
        <Typography type="h3" weight="medium" color="dark">
          Best Practices
        </Typography>
        <Container direction="column" padding="10px 0px 10px 0px" overflow="scroll">
          <Markdown
            content="# Purpose

The **Google Compliant Infrastructure for Financial Institutions Landing Zone (GCIFI LZ)** is intended to create automatically deployable and secure cloud application infrastructure through approved deployment pipelines.  This infrastructure will be able to demonstrate compliance to predetermined Standards and Regulatory Policies and will be ready to deploy your applications and services into. It gives you a compliant base infrastructure on top of which you can build your trust and compliance model through the use of complementary application infrastructure patterns.

The GCIFI LZ is designed to be compliant to security and architecture best practices and to show through these best practices the fulfilment of:
- Monetary Authority of Singapore Technology Risk Management Guidelines January 2021
- Association of Banks of Singapore Cloud Computing Implementation Guide 2.0

The compliance shown within the GCIFI LZ is contextless from a business perspective as the GCIFI LZ has no idea about the workloads and data types you will deploy, compliance for these will be handled in application patterns. The GCIFI LZ provides specific functionality to meet best practices for Financial Services technology and implements:

- Customer onboarding in a controlled and auditable manner that provides a structured Genesis of Trust.
- Auditable Continuous Deployment Chains for GCP Products and Services
- Patterns of GCP Products and Services
- Security, Operational Tooling and Customer workload segmentation
- Logging and Observability.




# The Basics
The Landing Zone is built using components and patterns designed and engineered to best practices described in the Google Cloud Security Foundation Guide. The guides main focus is security and the landing zone is designed and built to layer defence in depth across the deployment using the following best practices for products and services covering:

- Google Cloud organization structure and policy
- Authentication and authorization
- Resource hierarchy and deployment
- Networking (segmentation and security)
- Key and secret management
- Logging
- Detective controls
- Billing setup
- General security guidance


# The Details
The GCIFI LZ Landing Zone is a configurable standard infrastructure that can be configured to a your needs (in particular to meet their organisational structure and needs but with guardrails to ensure compliance with pre agreed compliance regulations and policies detailed in the Purpose Section.

# Google Cloud products and Services:
The Landing Zone uses only GCP products and services, no outside dependencies are introduced for you to manage. All of these products and services are created and managed by Google as detailed in the BeyondProd white paper. This is a no-trust model with mutually authenticated service endpoints, transport security, edge termination with global load balancing and denial of service protection, end-to-end code provenance, and runtime sandboxing.

# Security Foundation Blueprints
All GCP products and services within the Landing Zone have each been built and reviewed by Google to the best practices of the Google security foundations blueprint. This security foundations blueprint covers points 1 - 10 in the Basics.

in GCIFI LZ we show you that this has happened and provide you with a compliance report for each service and component mapped to our target regulations showing the fulfilment of obligations from the inside out.

# Landing Zone Infrastructure
The foundation of the Landing Zone is the use of these GCP products and services in specific arrangements called Compartments, these Compartments are protected from outside interference and each other through IAM groups and network segmentation, both of these methods are created and controlled during your onboarding process and are fully auditable.

In order to provide best practice for your security the the Compartments within the GCIFI LZ are arranged together into the patterned GCIFI LZ Architecture:
"
            flavor="github"
            :options="{ emoji: true, metadata: true }"
          />
          <Container class="height-100-per padding-28" direction="column">
            <img
              src="../../../assets/GCP LZ_ Final Architecture.png"
              width="auto"
              height="auto"
              class="width-100-per height-100-per"
              alt=""
            />
            <Typography
              type="h2"
              class="text-align-center"
              family="default"
              weight="medium"
              color="light"
              transform="none"
            >
              The GCIFI Landing Zone high level architecture
            </Typography>
          </Container>
          <Markdown
            content="

For a detailed description of compartments, their setup and ongoing maintenance please refer below description .

# Genesis Of Trust
The Genesis of Trust (GoT) is a separate software module that runs on the user's machine and orchestrates the installation process of the Google Compliant Infrastructure for Financial Institutions Landing Zone (GCIFI LZ). The services comprise the set of installation instructions and acknowledgments. If the user follows installation instructions, the result of the installation process is a secure and compliant landing zone.

# Common Folder
The separation between Common and Application specific folders is driven by Hub-and-Spoke network architecture. The Hub, encapsulated in the Common Folder, is the VPC with shared resources among various projects. Individual VPCs are connected to the Hub VPC through VPC peering. The Hub VPC is a set of shared services that are used across all projects in the Landing Zone.

# CICD project
The CICD project is a tightly controlled project within the organization hierarchy that's used to host the CloudBuild deployment pipeline. It also hosts a service account that's used to run the CloudBuild agents’ Compute Engine instances. The CloudBuild service account can impersonate the Terraform service account, which is located in the seed project, and which has permissions to deploy the foundation structures within the organization.

This project is created by the GoT at the initial step during the LZ installation.

# Seed project
The seed project contains the Terraform state of the foundation infrastructure, a highly privileged service account that's able to create new infrastructure, and the encryption configuration to protect that state. When the CI/CD pipeline runs, it impersonates this service account. The reason for having independent CICD and Terraform seed projects is due to the separation of concerns. While Terraform is used as the IaC tool and has its own requirements, the deployment of that IaC is the responsibility of the CI/CD pipeline.

This project is created by the GoT at the initial step during the LZ installation.

# Interconnect
To establish connectivity between the on-premises environment and Google Cloud, the landing zone reference architecture uses Dedicated Interconnect to maximize security and reliability. A Dedicated Interconnect connection is a direct link between your enterprise’s network and Google Cloud. If there is no dedicated interconnect in your location, the landing zone offers a partner interconnect option as well.

# Base Network Hub
The base network hub contains shared network configuration among projects, various environments, and business units such as project factory, shared VPC access, billing budget, quotas, etc.

# DNS Hub
Cloud DNS requires the 35.199.192.0/19 address space to be advertised to the on-premises network in order to pass DNS information between Google Cloud and on-premises. To accommodate multiple DNS instances, Cloud DNS has native peering functionality that can be used to create a central hub DNS instance with other DNS instances that are peered to the hub. Cloud DNS peering is a logical construct and doesn't require network connectivity between projects.

# Restricted Network Hub
Provides the project for the Shared VPC network that will host the organization’s workloads that run within a perimeter controlled by VPC Service Controls.

# Monitoring Logging Project
Logging provides important functionality to development organisations, audit organisations, and security organisations, as well as helping to satisfy regulatory compliance. Within the created organisation, logging functions are split into two project:

- A standalone logging project named Logging. This project contains Pub/Sub topics, Cloud Functions and a BigQuery instance used for collecting and processing logs generated by the organization.
- A SCC Alert Center project named SCC. This project contains the notification Pub/Sub topics from the Security Command Center. It's separate from the logging project so that you have a clear separation of duties between operations teams that might need general log access and the security team that needs access to specific security information and events.

To ensure that the Landing Zone is build based on stated set of best practices, there is a set of detective controls are implemented across the Landing Zone. Detective controls use platform telemetry to detect misconfigurations, vulnerabilities, and potentially malicious activity in the cloud environment. The organisation architecture includes the following detective controls:

- Google security sources through Security Command Center, including security misconfiguration information and vulnerability changes. (For details, see the next section.)
- Asset changes and policy compliance notifications from Cloud Asset Inventory.
- Logs from Google Cloud Logging (including Google Workspace Audit logs) that can be send to the
SIEM tool.
- Custom findings from a serverless BigQuery-based tool.

# Keys and Secrets Management
Secrets in your organization encompass cryptographic keys, credential sets, API keys, OAuth tokens, and other sensitive data that's needed in order to run your applications. The LZ uses Cloud KMS to store your secrets and the Secret manager to keep and rotate secrets. Cloud KMS is a unified API for performing cryptographic operations and managing cryptographic keys. The keys can be backed by software, hardware (HSM), or external systems (EKM). Secret Manager is a secure and convenient storage system for API keys, passwords, certificates, and other sensitive data. Secret Manager provides a central place and single source of truth to manage, access, and audit secrets across Google Cloud. Secret Manager lets you set access policies for each secret and to configure audit logs for each secret access.

# Application Folders
Application folders have been created to host actual business workloads, i.e. business applications. There are three types of folders: production, non-production, and development. The folder structure reflects the standard Software Delivery Lifecycle (SDLC) where the software code should go through different environments (dev and non-prod folders) before the production release (production folder). The different environments have various levels of security, compliance, and monitoring established.

Each folder has a dedicated set of sub-projects to fulfils deployed application needs in security, monitoring, and networking services. The sub-projects are consist of monitoring, secrets, logging, networking (base and restricted), and billing and operations. The folders serve the same function as per above for a deployed application.

# Organisational Structure
A single organization is used for all environments and services for user’s domain to manage all resources and policies in one place. The folder hierarchy has a single layer, consisting of bootstrap, common, production, non-production, and development folders to allow for segregation of policies, privileges, and access. Google Cloud organization policies are used to augment the organization's security posture by allowing you to define resource configuration constraints that apply consistently across all projects.

The organisational structure is described to the user in the above sections and will be approved on the “Review“ step by the business owner. The decision results will be logged into the evidence bucket, and the decision log will be available for download at the end of the installation process.

# CICD pipeline and project deployment
Foundation resources are deployed through a deployment pipeline to enable automated and standardised review, approval, and rollback. Terraform is used as the infrastructure as code (IaC) tool. An approval stage in the pipeline that is controlled by a customer nominated approver is required to deploy resources. A log of this decision and the subsequent workflow is retained for your audit purposes.

The organisational structure is described to the user in the above sections and will be approved on the “Review“ step by the business owner. The decision results will be logged into the evidence bucket, and the decision log will be available for download at the end of the installation process.

# Workloads, and applications:
As an extension of the compliance you will achieve with the Landing Zone workload and application infrastructure deployment patterns used to support the deployment of your application code are optional extras and will be made available through an extended agreement should you chose to use them.

# Security
**Authentication and authorisation**
Single sign-on (SSO) is used to control users access to the Google Cloud Console. Groups are used for assigning Cloud IAM permissions.

The users can be added to the organisation either by the organisation administrator role or by the super administrator role. The usage of the landing zone authentication and authorisation mechanisms will be approved on the business owner. The decision results will be logged into the evidence bucket, and the decision log will be available for download at the end of the installation process.

# Key and secret management
Cloud KMS is used for cryptographic keys. Secret manager is used to store secrets. Lastly, separate secret manager instances are used to store organisation-level and folder-level secrets.
The users can be added to the organisation either by the secrets admin or the super administrator role. The usage of the landing zone authentication and authorisation mechanisms will be approved on the business owner. The decision results will be logged into the evidence bucket, and the decision log will be available for download at the end of the installation process.

# Networking
Shared VPCs are used as the primary network topology. Hub-and-Spot network model has been implemented as a part of the Landing Zone. RFC 1918 / 16 IP address space is used for the subnets.

# Logging and monitoring
Organisation-level log sinks are used to aggregate logs. Logs are sent to Cloud Storage, BigQuery, and Cloud Pub/Sub for further analysis. An on-premises SIEM could be connected to Pub/Sub for logs analysis.

# Billing
Billing alerts are used on a per-project basis with thresholds set at 50%, 75%, 90%, and 95%.
"
            flavor="github"
            :options="{ emoji: true, metadata: true }"
          />
        </Container>
      </Container>
    </Wrapper>
    <Container padding="20px 0px 10px 0px" direction="row" :gap="15">
      <Checkbox
        :size="size"
        :state="state"
        :checked.sync="BstPracticesCheck"
        @click="onBstPractices"
        :disabled="disabled"
      >
      </Checkbox>
      <Typography type="p2">
        I Acknowledge and agree to the Best Practices shared above.
      </Typography>
    </Container>
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
        <Button state="outlined" v-on:click="onBack"> BACK </Button>
        <Button @click="onNext"> NEXT </Button>
      </Container>
    </Container>
  </Wrapper>
</template>

<script>
import {
  Wrapper,
  Typography,
  Container,
  Checkbox,
  Button,
  Markdown,
} from "@cldcvr/flow";
import Popup from "./Popup.vue";
import { mapState } from "vuex";
export default {
  name: "BestPractice",
  components: {
    Wrapper,
    Typography,
    Container,
    Checkbox,
    Button,
    Popup,
    Markdown,
  },
  data() {
    return {
      openSlideout: false,
      iconname: "i-tree",
      showError: true,
      BstPracticesCheck: false,
      timer: null,
      errorText: "To proceed, please tick the acknowledgement",
      body: "By proceeding, you will lose all inputs and statuses and will need to re-setup the Landing Zone from start.",
      openModalFlag: false,
    };
  },
  computed: {
    ...mapState(["BestPracticesAck"]),
  },
  mounted() {
    this.fetchBstPracticesAck();
    this.BstPracticesCheck = this.BestPracticesAck;
  },
  methods: {
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
      this.$emit("onback", 1);
    },
    onNext() {
      if (this.BstPracticesCheck) {
        this.showError = true;
        this.$emit("onNext", 3);
      } else this.showError = false;
    },
    onBstPractices() {
      this.showError = this.BstPracticesCheck;
      this.$store.dispatch("setBestPracticeAck", this.BstPracticesCheck);
    },
    fetchBstPracticesAck() {
      this.$store.dispatch("getBestPracticeAck");
    },
  },
};
</script>

<style lang="less" scoped>
.standard-text {
  padding: 21px 12px 15px 19px;
  background-color: #2b394a;
}
.over-flow {
  overflow: scroll;
}
.invisible {
  visibility: hidden;
}
.clear {
  clear: both;
}
</style>
