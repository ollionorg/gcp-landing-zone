import HTTP from "./api-service";
import reusableContent from "../utils/ReuseableContent";
// Get resource data using API call
const resouceUrl = "/resource";

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
    return HTTP.post(process.env.VUE_APP_SCRIPT_URL, body);
  },
  getReportData() {
    return HTTP.get(process.env.VUE_APP_REPORT_URL);
  },
  getEvidenceData(){
    return HTTP.get(process.env.VUE_APP_EVIDENCE_URL);
  }
};
