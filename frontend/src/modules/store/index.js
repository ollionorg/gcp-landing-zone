import Vue from "vue";
import Vuex from "vuex";
import CommanStorage from "../utils/CommanStorage"
import TimeStamp from "../utils/ReuseableContent"

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    StandardAck: false,
    StandardAckOn: '',
    BestPracticesAck: false,
    BestPracticesAckOn: '',
    DeployAckOn: '',
    StepperNo: 1,
    StepperPosition: {},
    PrerequisticsData: {},
    PrerequisticsCheck: {},
    preReqallowCheck: {},
    VarPageData: {},
    DeployChecks: {},
    ExecutionSwitch: {},
    executionAllowCheck: {},
    DeployData: {},
    ReviewFileData: [],
    DownloadedOn: ''
  },
  mutations: {
    SET_DOWNLOAD_ON(state, stamp) {
      state.DownloadedOn = stamp
    },
    SET_STANDARD_ACK(state, Detail) {
      state.StandardAck = Detail.ack
      state.StandardAckOn = Detail.timeDetail
    },
    SET_BESTPRACTICES_ACK(state, Detail) {
      state.BestPracticesAck = Detail.ack
      state.BestPracticesAckOn = Detail.timeDetail
    },
    SET_DEPLOYACK_ON(state, stamp) {
      state.DeployAckOn = stamp
    },
    SET_STEPPER(state, no) {
      state.StepperNo = no
    },
    SET_STEPPER_POSITION(state, position) {
      state.StepperPosition = position
    },
    SET_PREREREQUISICS_DATA(state, prData) {
      state.PrerequisticsData = prData
    },
    SET_PREREREQUISICS_CHECKS(state, prChecks) {
      state.PrerequisticsCheck = prChecks
    },
    SET_PREREQ_ALLOW_CHECKS(state, allowCheck) {
      state.preReqallowCheck = allowCheck
    },
    SET_VARIBALEPAGE_DATA(state, varData) {
      state.VarPageData = varData
    },
    SET_DEPLOYMENT_CHECKS(state, checks) {
      state.DeployChecks = checks
    },
    SET_DEPLOYMENT_DATA(state, data) {
      state.DeployData = data
    },
    SET_REVIEW_FILE_DATA(state, fileData) {
      state.ReviewFileData = fileData
    },
    SET_EXECUTION_SWITCH_DATA(state, exSwitch) {
      state.ExecutionSwitch = exSwitch
    },
    SET_EXECUTION_ALLOW_CHECK(state, allowCheck) {
      state.executionAllowCheck = allowCheck
    }
  },
  actions: {

    async setDownloadOn({ commit }) {
      const TimeDetail = TimeStamp.methods.timeStamp()
      commit("SET_DOWNLOAD_ON", TimeDetail);
      CommanStorage.methods.setStorage('Downloadnon', TimeDetail)
    },
    async getDeployAckOn({ commit }) {
      const TimeDetail = CommanStorage.methods.getStorage('DeployAckOn')
      commit("SET_DEPLOYACK_ON", TimeDetail);
    },
    async setDeployAckOn({ commit }) {
      const TimeDetail = TimeStamp.methods.timeStamp()
      commit("SET_DEPLOYACK_ON", TimeDetail);
      CommanStorage.methods.setStorage('DeployAckOn', TimeDetail)
    },
    async getDownloadOn({ commit }) {
      const TimeDetail = CommanStorage.methods.getStorage('Downloadnon')
      commit("SET_DOWNLOAD_ON", TimeDetail);
    },
    async setStandardAck({ commit }, Ack) {
      const TimeDetail = TimeStamp.methods.timeStamp()
      var detail = {
        ack: Ack,
        timeDetail: TimeDetail
      }
      commit("SET_STANDARD_ACK", detail);
      CommanStorage.methods.setStorage('StandardAck', Ack)
      CommanStorage.methods.setStorage('StandardAckOn', TimeDetail)
    },
    async getStandardAck({ commit }) {
      const TimeDetail = CommanStorage.methods.getStorage('StandardAckOn')
      const Ack = CommanStorage.methods.getStorage('StandardAck')
      var detail = {
        ack: Ack,
        timeDetail: TimeDetail
      }
      commit("SET_STANDARD_ACK", detail);
    },
    async setBestPracticeAck({ commit }, Ack) {

      const TimeDetail = TimeStamp.methods.timeStamp()
      var detail = {
        ack: Ack,
        timeDetail: TimeDetail
      }
      commit("SET_BESTPRACTICES_ACK", detail);
      CommanStorage.methods.setStorage('BestPracticesAck', Ack)
      CommanStorage.methods.setStorage('BestPracticesAckOn', TimeDetail)
    },
    async getBestPracticeAck({ commit }) {

      const Ack = CommanStorage.methods.getStorage('BestPracticesAck')
      const TimeDetail = CommanStorage.methods.getStorage('BestPracticesAckOn')
      var detail = {
        ack: Ack,
        timeDetail: TimeDetail
      }
      commit("SET_BESTPRACTICES_ACK", detail);
    },
    async setStepperNo({ commit }, No) {
      commit("SET_STEPPER", No);
      CommanStorage.methods.setStorage('StepperNo', No)
    },

    async setStepperPosition({ commit }, Pos) {
      commit("SET_STEPPER_POSITION", Pos);
      CommanStorage.methods.setStorage('StepperPos', Pos)
    },
    async getStepperPosition({ commit }) {
      const pos = CommanStorage.methods.getStorage('StepperPos')
      commit("SET_STEPPER_POSITION", pos);
    },
    async setPrData({ commit }, prData) {
      commit("SET_PREREREQUISICS_DATA", prData);
      CommanStorage.methods.setStorage('PrData', prData);
    },
    async getPrData({ commit }) {
      const prData = CommanStorage.methods.getStorage('PrData')
      commit("SET_PREREREQUISICS_DATA", prData);

    },
    async setPrChecks({ commit }, prChecks) {
      commit("SET_PREREREQUISICS_CHECKS", prChecks);
      CommanStorage.methods.setStorage('PrChecks', prChecks)
    },
    async setPrAllowCheck({ commit }, allowCheck) {
      commit("SET_PREREQ_ALLOW_CHECKS", allowCheck);
      CommanStorage.methods.setStorage('prAllowCheck', allowCheck)
    },
    async getPrAllowCheck({ commit }) {
      const allowCheck = CommanStorage.methods.getStorage('prAllowCheck')
      commit("SET_PREREQ_ALLOW_CHECKS", allowCheck);
    },
    async getPrChecks({ commit }) {
      const PrChecks = CommanStorage.methods.getStorage('PrChecks')
      commit("SET_PREREREQUISICS_CHECKS", PrChecks);
    },
    async setVarData({ commit }, varData) {
      commit("SET_VARIBALEPAGE_DATA", varData);
      CommanStorage.methods.setStorage('VarData', varData)
    },
    async getVarData({ commit }) {
      const varData = CommanStorage.methods.getStorage('VarData')
      commit("SET_VARIBALEPAGE_DATA", varData);
    },
    async getStepper({ commit }) {
      const No = CommanStorage.methods.getStorage('StepperNo')
      if (No != undefined)
        commit("SET_STEPPER", No);
      else
        commit("SET_STEPPER", 1);
    },
    async setDeployData({ commit }, Data) {
      commit("SET_DEPLOYMENT_DATA", Data);
      CommanStorage.methods.setStorage('deployData', Data)
    },
    async getDeployData({ commit }) {
      const Data = CommanStorage.methods.getStorage('deployData')
      commit("SET_DEPLOYMENT_DATA", Data);
    },
    async setDeployCheck({ commit }, Check) {
      commit("SET_DEPLOYMENT_CHECKS", Check);
      CommanStorage.methods.setStorage('deployCheck', Check)
    },
    async getDeployCheck({ commit }) {
      const Data = CommanStorage.methods.getStorage('deployCheck')
      commit("SET_DEPLOYMENT_CHECKS", Data);
    },
    async setReviewFileData({ commit }, FileData) {
      commit("SET_REVIEW_FILE_DATA", FileData);
      CommanStorage.methods.setStorage('reviewFileData', FileData)
    },
    async getReviewFileData({ commit }) {
      const Data = CommanStorage.methods.getStorage('reviewFileData')
      commit("SET_REVIEW_FILE_DATA", Data);
    },
    async setExecutionData({ commit }, switchData) {
      commit("SET_EXECUTION_SWITCH_DATA", switchData);
      CommanStorage.methods.setStorage('executionSwitch', switchData)
    },
    async getExecutionData({ commit }) {
      const Data = CommanStorage.methods.getStorage('executionSwitch')
      commit("SET_EXECUTION_SWITCH_DATA", Data);
    },
    async setExecutionAllowCheck({ commit }, allowCheck) {
      commit("SET_EXECUTION_ALLOW_CHECK", allowCheck);
      CommanStorage.methods.setStorage('executionAllowChecks', allowCheck)
    },
    async getExecutionAllowCheck({ commit }) {
      const Data = CommanStorage.methods.getStorage('executionAllowChecks')
      commit("SET_EXECUTION_ALLOW_CHECK", Data);
    },
    async DeteleAll({ commit }) {
      CommanStorage.methods.DeleteStorage()
      commit("SET_STEPPER", 1);
      commit("SET_PREREREQUISICS_CHECKS", {});
      commit("SET_PREREREQUISICS_DATA", {});
      commit("SET_VARIBALEPAGE_DATA", {});
      commit("SET_DEPLOYMENT_CHECKS", {});
      commit("SET_DEPLOYMENT_DATA", {});
      commit("SET_REVIEW_FILE_DATA", []);
      commit("SET_EXECUTION_ALLOW_CHECK", {});
      commit("SET_PREREQ_ALLOW_CHECKS", {});
    },

  },
  modules: {},
});
