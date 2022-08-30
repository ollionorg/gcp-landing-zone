
export default {
  methods: {
    timeStamp() {
      const today = new Date();
      const date = today.getDate() + '-' + (today.getMonth() + 1) + '-' + today.getFullYear();
      const time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
      const timestamp = date + ' ' + time;
      return timestamp;
    },
    jsonToCSV(data) {
      if (!data || data.length === 0) {
        return;
      }
      let csv = [Object.keys(data[0]).slice(0).join(",")];
      data.forEach((item) =>
        csv.push(
          Object.values(item)
            .map((val) => (isNaN(val) ? '"' + val + '"' : val))
            .join(",")
        )
      );
      csv = csv.join("\n");
      return csv;
    },
    getMetaValue(key) {
      let value = '';
      const node = document.querySelector(`meta[property=${key}]`);
      if (node !== null) {
        value = node.getAttribute('content');
      }
      return value;
    },
    downloadCsv(ExcelData, reportName) {
      const csv = this.jsonToCSV(ExcelData);
      let blob
      if (reportName == "Summary Report") {
        let csvdata = csv.replace('head1,', '').replace('head2,', '').replace('head3', '')
        blob = new Blob([csvdata], {
          type: "text/csv;charset=utf-8;",
        });

      }
      else {
        blob = new Blob([csv], {
          type: "text/csv;charset=utf-8;",
        });
      }


      let link = document.createElement("a");
      let url = URL.createObjectURL(blob);
      link.setAttribute("href", url);

      link.setAttribute("download", `${reportName}.csv`);
      link.style.visibility = "hidden";
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }
  }
}