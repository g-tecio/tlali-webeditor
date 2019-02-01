import axios from 'axios';

const apiUrl = 'https://o2dstvq9sb.execute-api.us-west-2.amazonaws.com/dev/articles/';

export default {
  getStories() {
    return axios.get(apiUrl)
      .then(response => {
        console.log(response);
        return response.data;
      }).catch(error => {
        console.log(error);
      });
  },

  getStory(id) {
    return axios.get(apiUrl + id)
      .then(response => {
        console.log(response);
        return response.data;
      }).catch(error => {
        console.log(error);
      });
  },

  updateStory(id, payload) {
    return axios.put(apiUrl + id, payload)
      .then(response => {
        console.log(response);
        return response.data;
      }).catch(error => {
        console.log(error);
      });
  },

  createStory(payload) {
    return axios.post(apiUrl, payload)
      .then(response => {
        console.log(response);
      }).catch(error => {
        console.log(error);
      })
  },

  deleteStory(id, dt) {
    return axios.delete(apiUrl + id + '/' + dt)
      .then(response => {
        console.log(response);
      }).catch(error => {
        console.log(error);
      })
  }
};