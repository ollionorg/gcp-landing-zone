import HTTP from "./api-service";
import reusableContent from "../utils/ReuseableContent";
// Get resource data using API call
const resouceUrl = "/resource";

const scriptApi = 'http://127.0.0.1:9000/modifyvariables'
const reportUrl = 'http://127.0.0.1:9000/summaryreport'
const evidenceUrl = 'http://127.0.0.1:9000/evidenceData'

// For third party APIs use full URL
// ex. HTTP.get("https://example.com/user")

export default {
  get() {
    return HTTP.get(resouceUrl);
  },
  getStatus(owner, repo, pr) {
    let auth = "token " + reusableContent.methods.getMetaValue('VUE_APP_GIT_TOKEN')
    const config = {
      headers: {
        Accept: "application/vnd.github.v3+json",
        "Content-Type": "application/json",
        "Authorization": auth
      }
    };

    return HTTP.get(`${owner}/${repo}/pulls/${pr}/merge`, config)
  },
  post(data) {
    let body = {
      "budata": data
    }
    return HTTP.post(scriptApi, body);
  },
  getReportData() {
    return HTTP.get(reportUrl);
  },
  getEvidenceData(){
    return HTTP.get(evidenceUrl);
  }
};
