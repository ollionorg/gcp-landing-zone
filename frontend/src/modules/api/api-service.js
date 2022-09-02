import axios from "axios";
const  gitStatusApi = 'https://api.github.com/repos'
const axiosInstance = axios.create({
  baseURL: gitStatusApi,
  withCredentials: false,
  headers: {
    Accept: "application/json",
    "Content-Type": "application/json",

  },
});

axiosInstance.interceptors.request.use(

  function (config) {
    return config;
  },
  function (error) {
    return Promise.reject(error);
  }
);

axiosInstance.interceptors.response.use(
  function (response) {
    return response;
  },
  function (error) {

    return Promise.reject(error);
  }
);

export default axiosInstance;
