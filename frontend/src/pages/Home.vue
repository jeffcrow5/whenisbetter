<template>
  <div id="home-page">
    <div class="groups">
      <b-form-radio-group
        v-model="selectedGroup"
        :options="groups.map(group => {
          return {text: group.groupname, value: group}
        })"
        buttons
        button-variant="outline-primary"
        stacked
      ></b-form-radio-group>
      <!-- FIXME: Make API call(s) to add group via invite code -->
      <b-button class="mt-auto">+ Join Group</b-button>
    </div>

    <div v-if="Object.keys(selectedEvent).length === 0" class="main-group-panel">
      <b-card class="event-card" v-for="(event, index) in groupEvents" :key="index" :title="event.eventname" border-variant="secondary" @click="setSelectedEvent(event)" role="button">
        <b-card-text class="text-secondary">
          {{event.eventdesc}} 
        </b-card-text>
        <b-card-text>
          {{`Start time: ${event.eventstarttime}`}}
        </b-card-text>
      </b-card>
    </div>

    <div v-else class="selected-event-panel">
      <b-jumbotron>
        <template #header>{{selectedEvent.eventname}}</template>

        <template #lead>
          {{selectedEvent.eventdesc}}
        </template>

        <hr class="my-4">

        <p>
          Start time: {{selectedEvent.eventstarttime}}
        </p>
        
        <div class="text-center">Going?<br>
        <b-button variant="success" @click="userAttendsEvent">Yes</b-button>
        <b-button variant="danger" @click="userUnattendsEvent">No</b-button>
        </div>
      </b-jumbotron>
      <b-button @click="clearSelectedEvent">Back</b-button>
    </div>

    <div class="group-info">
      <h3>Group Members</h3>
      <div v-for="(member, index) in groupMembers" :key="index">
        {{member}}
      </div>
    </div>
    
  </div>
</template>

<script>
import Api from "../api"

export default {
  name: "Home",
  data: function () {
    return {
      // FIXME: Remove these once proper API calls have been made
      groups: [{groupid: 1, groupname: 'Group 1'}, {groupid: 2, groupname: 'Group 2'}, {groupid: 3, groupname: 'Group 17'}],
      selectedGroup: {},
      groupMembers: [],
      groupEvents: [],
      selectedEvent: {}
    };
  },
  beforeCreated() {
    // If not logged in reroute to login page
    if (!localStorage.getItem('accessToken')) {
      this.$router.push({path: '/login'})
    }
  },
  created() {
    // FIXME: Set these to the stuff associated with the first group in the user's groups
    this.groupMembers = ['Jeffrey Crowley', 'Trevor McClellan']
    this.groupEvents = [{eventname: 'Event 1', eventdesc: 'This is a description', eventstarttime: 'March 17, 2022 at 3:30 PM'}, {eventname: 'Event 2', eventdesc: 'This is another description', eventstarttime: 'March 21, 2022 at 9:30 AM'}]
  },
  watch: {
    selectedGroup(newValue, oldValue) {
      if (newValue != oldValue) {
        // FIXME: Make API calls to set groupMembers and groupEvents
        this.groupMembers = ['Jeffrey Crowley', 'Trevor McClellan']
        this.groupEvents = [{eventname: 'Event 1', eventdesc: 'This is a description', eventstarttime: '10'}, {eventname: 'Event 2', eventdesc: 'This is another description', eventstarttime: '20'}]
      }
    }
  },
  methods: {
    setSelectedEvent(event) {
      this.selectedEvent = event
    },
    clearSelectedEvent() {
      this.selectedEvent = {}
    },
    userAttendsEvent() {
      Api.attendEvent(this.selectedEvent.eventid)
      // TODO: Add some visual feedback
    },
    userUnattendsEvent() {
      Api.unattendEvent(this.selectedEvent.eventid)
      // TODO: Add some visual feedback
    }
  }
};
</script>

<style scoped>
#home-page {
  display: grid;
  height: 100%;
  grid-template-areas:
    'groups main-panel group-info';
  grid-template-columns: 300px auto 300px; 
}
.groups {
  grid-area: groups;
  background-color: lightgray;
  padding: 20px;
  display: flex;
  flex-direction: column;

}
.main-group-panel {
  grid-area: main-panel;
  display: flex;
  justify-content: space-around;
  padding: 30px;
}
.selected-event-panel {
  grid-area: main-panel;
  display: flex;
  flex-direction: column;

}

.event-card {
  max-height: 200px;
  width: 300px;
}

.group-info {
  grid-area: group-info;
  background-color: lightgray;
  display: flex;
  flex-direction: column;
  padding: 20px;
}
</style>