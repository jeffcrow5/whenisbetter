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

      <b-button variant="primary" @click="openModal('join-group-modal')" class="mt-auto">+ Join Group</b-button>
      <b-button variant="success" @click="openModal('create-group-modal')" class="mt-2">+ Create Group</b-button>
      <b-modal
      size="md"
      title="Enter Group Invite Code"
      id="join-group-modal"
      @ok="joinGroup">
        <b-form
          @submit.prevent="
            joinGroup();
            $bvModal.hide('join-group-modal')
          "
        >
          <b-form-group label="Invite Code" label-for="invite-code-input">
            <b-form-input
              id="invite-code-input"
              v-model="groupInviteCode"
              autocomplete="off"
            />
          </b-form-group>
        </b-form>
      </b-modal>

      <b-modal
      size="xl"
      :title="newGroupTitle"
      id="group-times-modal"
      @ok="setGroupTimes">
        <b-form
          @submit.prevent="
            setGroupTimes();
            $bvModal.hide('group-times-modal')
          "
        >
          <b-form-group
            label="Monday Availability"
            v-slot="{ ariaDescribedby }"
          >
            <b-form-checkbox-group
              v-model="monday"
              :options="options"
              :aria-describedby="ariaDescribedby"
              name="buttons-1"
              buttons
              button-variant="info"
            ></b-form-checkbox-group>
          </b-form-group>
          <b-form-group
            label="Tuesday Availability"
            v-slot="{ ariaDescribedby }"
          >
            <b-form-checkbox-group
              v-model="tuesday"
              :options="options"
              :aria-describedby="ariaDescribedby"
              name="buttons-1"
              buttons
              button-variant="info"
            ></b-form-checkbox-group>
          </b-form-group>
          <b-form-group
            label="Wednesday Availability"
            v-slot="{ ariaDescribedby }"
          >
            <b-form-checkbox-group
              v-model="wednesday"
              :options="options"
              :aria-describedby="ariaDescribedby"
              name="buttons-1"
              buttons
              button-variant="info"
            ></b-form-checkbox-group>
          </b-form-group>
          <b-form-group
            label="Thursday Availability"
            v-slot="{ ariaDescribedby }"
          >
            <b-form-checkbox-group
              v-model="thursday"
              :options="options"
              :aria-describedby="ariaDescribedby"
              name="buttons-1"
              buttons
              button-variant="info"
            ></b-form-checkbox-group>
          </b-form-group>
          <b-form-group
            label="Friday Availability"
            v-slot="{ ariaDescribedby }"
          >
            <b-form-checkbox-group
              v-model="friday"
              :options="options"
              :aria-describedby="ariaDescribedby"
              name="buttons-1"
              buttons
              button-variant="info"
            ></b-form-checkbox-group>
          </b-form-group>
          <b-form-group
            label="Saturday Availability"
            v-slot="{ ariaDescribedby }"
          >
            <b-form-checkbox-group
              v-model="saturday"
              :options="options"
              :aria-describedby="ariaDescribedby"
              name="buttons-1"
              buttons
              button-variant="info"
            ></b-form-checkbox-group>
          </b-form-group>
          <b-form-group
            label="Sunday Availability"
            v-slot="{ ariaDescribedby }"
          >
            <b-form-checkbox-group
              v-model="sunday"
              :options="options"
              :aria-describedby="ariaDescribedby"
              name="buttons-1"
              buttons
              button-variant="info"
            ></b-form-checkbox-group>
          </b-form-group>
        </b-form>
      </b-modal>

      <b-modal
      size="md"
      title="Enter Group Info"
      id="create-group-modal"
      @ok="createGroup">
        <b-form
          @submit.prevent="
            createGroup();
            $bvModal.hide('create-group-modal')
          "
        >
          <b-form-group label="Group Name" label-for="group-name-input">
            <b-form-input
              id="group-name-input"
              v-model="createGroupForm.groupname"
              autocomplete="off"
              required
            />
          </b-form-group>

          <b-form-group label="Group Description" label-for="group-desc-input" description="Optional">
            <b-form-input
              id="group-desc-input"
              v-model="createGroupForm.groupdesc"
              autocomplete="off"
            />
          </b-form-group>

          <b-form-group label="Group Image URL" label-for="group-image-input" description="Optional">
            <b-form-input
              id="group-image-input"
              v-model="createGroupForm.groupimage"
              autocomplete="off"
            />
          </b-form-group>
        </b-form>
      </b-modal>
    </div>

    <div v-if="Object.keys(selectedEvent).length === 0" class="main-group-panel">
      <b-card class="event-card" v-for="(event, index) in groupEvents" :key="index" :title="event.eventname" border-variant="secondary" @click="setSelectedEvent(event)" role="button">
        <b-card-text class="text-secondary">
          {{event.eventdesc}} 
        </b-card-text>
        <b-card-text>
          {{new Date(event.eventstarttime).toLocaleDateString()}} <br>
          {{getTimeRange(event)}}
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
          {{new Date(selectedEvent.eventstarttime).toLocaleDateString()}} <br>
          {{getTimeRange(selectedEvent)}}
        </p>
        
        <div class="text-center">Going?<br>
        <b-button :variant="'success'" @click="userAttendsEvent" :disabled="userAttendingEvent">Yes</b-button>
        <b-button variant="danger" @click="userUnattendsEvent" :disabled="!userAttendingEvent">No</b-button>
        </div>
      </b-jumbotron>
      <b-button @click="clearSelectedEvent">Back</b-button>
    </div>

    <div class="group-info">
      <h3>Group Members</h3>
      <div v-for="(member, index) in groupMembers" :key="index">
        {{`${member.firstname} ${member.lastname}`}}
      </div>
      <b-button variant="success" @click="openModal('create-event-modal')">
        + Create Event
      </b-button>
      <b-modal
      size="md"
      title="Enter Event Info"
      id="create-event-modal"
      @ok="createEvent">
        <b-form
          @submit.prevent="
            createEvent();
            $bvModal.hide('create-event-modal')
          "
        >
          <b-form-group label="Event Name" label-for="event-name-input">
            <b-form-input
              id="event-name-input"
              v-model="createEventForm.eventname"
              autocomplete="off"
              required
            />
          </b-form-group>

          <b-form-group label="Event Description" label-for="event-desc-input" description="Optional">
            <b-form-input
              id="event-desc-input"
              v-model="createEventForm.eventdesc"
              autocomplete="off"
            />
          </b-form-group>

          <b-form-group label="Event Duration (hours)" label-for="event-duration-input">
            <b-form-input
              id="event-duration-input"
              v-model="createEventForm.eventduration"
              autocomplete="off"
              required
              type="number"
            />
          </b-form-group>

          <b-form-group label="Event Start Date" label-for="event-start-date-input">
            <b-form-datepicker 
              id="event-start-date-input" 
              v-model="createEventForm.eventstartdate" 
              class="mb-2"
              required></b-form-datepicker>
          </b-form-group>
          <b-form-group label="Event Start Time" label-for="event-start-time-input">
            <b-form-timepicker 
              id="event-start-time-input" 
              v-model="createEventForm.eventstarttime" 
              class="mb-2"
              required></b-form-timepicker>
          </b-form-group>
        </b-form>
      </b-modal>
      <b-button class="mt-auto" variant="danger" @click="leaveGroup()">
        Leave Group
      </b-button>
      <h3 class="text-center">
        Invite Code<br>
        {{selectedGroup.groupinvitecode}}
      </h3>

    </div>
    
  </div>
</template>

<script>
import Api from "../api"
import { getJwtToken, getUserIdFromToken } from "../auth"
import {v4 as uuidv4} from 'uuid'

export default {
  name: "Home",
  data: function () {
    return {
      // FIXME: Remove these once proper API calls have been made
      groups: [{groupid: 1, groupname: 'Group 1'}, {groupid: 2, groupname: 'Group 2'}, {groupid: 3, groupname: 'Group 17'}],
      selectedGroup: {
        groupname: '',
        groupdesc: '',
        groupinvitecode: '',
        groupadmin: '',
        groupimage: ''
      },
      groupMembers: [],
      groupEvents: [],
      selectedEvent: {},
      groupInviteCode: '',
      activeGroupInviteCode: '',
      createGroupForm: {
        groupname: '',
        groupdesc: '',
        groupinvitecode: '',
        groupadmin: '',
        groupimage: ''
      },
      createEventForm: {
        eventname: '',
        eventdesc: '',
        eventduration: '',
        eventstarttime: '',
        eventstartdate: ''
      },
      userAttendingEvent: false,
      newGroup: {},
      newGroupTitle: '',
      user: {},
      monday: [],
      tuesday: [],
      wednesday: [],
      thursday: [],
      friday: [],
      saturday: [],
      sunday: [],
      options: [
          { text: '6am', value: '6' },
          { text: '7am', value: '7' },
          { text: '8am', value: '8' },
          { text: '9am', value: '9' },
          { text: '10am', value: '10' },
          { text: '11am', value: '11' },
          { text: '12pm', value: '12' },
          { text: '1pm', value: '13' },
          { text: '2pm', value: '14' },
          { text: '3pm', value: '15' },
          { text: '4pm', value: '16' },
          { text: '5pm', value: '17' },
          { text: '6pm', value: '18' },
          { text: '7pm', value: '19' },
          { text: '8pm', value: '20' },
        ],
    };
  },
  created() {
    Api.getUserGroups().then(response => {
      this.groups = response.data
      this.selectedGroup = this.groups[0]
    })
    Api.getCurrentUser().then(response => {
      this.user = response.data[0]
      let defaulttimes = response.data[0].defaulttimes
      this.monday = defaulttimes.monday || []
      this.tuesday = defaulttimes.tuesday || []
      this.wednesday = defaulttimes.wednesday || []
      this.thursday = defaulttimes.thursday || []
      this.friday = defaulttimes.friday || []
      this.saturday = defaulttimes.saturday || []
      this.sunday = defaulttimes.sunday || []
    })
  },
  watch: {
    selectedGroup(newValue, oldValue) {
      if (newValue != oldValue) {
        this.getGroupMembers(newValue.groupid)
        this.getGroupEvents(newValue.groupid)
      }
    }
  },
  methods: {
    getTimeRange(event) {
      let startTime = new Date(event.eventstarttime)
      let endTime = new Date(event.eventstarttime)
      endTime.setHours( startTime.getHours() + event.eventduration );
      return `${startTime.toLocaleTimeString()} - ${endTime.toLocaleTimeString()}`
    },
    openModal(modal) {
      this.$bvModal.show(modal)
    },
    setSelectedEvent(event) {
      Api.isUserAttendingEvent(event.eventid).then(response => {
        if (response.data.length != 0) {
          this.userAttendingEvent = true
        }
        else {
          this.userAttendingEvent = false
        }
        this.selectedEvent = event
      })
    },
    clearSelectedEvent() {
      this.selectedEvent = {}
    },
    userAttendsEvent() {
      Api.attendEvent(this.selectedEvent.eventid)
      this.userAttendingEvent = true
    },
    userUnattendsEvent() {
      Api.unattendEvent(this.selectedEvent.eventid)
      this.userAttendingEvent = false
    },
    getUserGroups() {
      Api.getUserGroups().then(response => {
        this.groups = response.data
        if (this.groups.length) {
          this.selectedGroup = this.groups[0]
        }
      })
    },
    getGroupMembers(groupID) {
      Api.getGroupMembers(groupID).then(response => {
          this.groupMembers = response.data
        })
    },
    getGroupEvents(groupID) {
      Api.getGroupEvents(groupID).then(response => {
        this.groupEvents = response.data
      })
    },
    joinGroup() {
      Api.getGroupFromInviteCode(this.groupInviteCode).then(response => {
        let group = response.data[0]
        this.setGroupDefaultTimes(group)
      })
    },
    setGroupDefaultTimes(group) {
      this.newGroup = group
      this.newGroupTitle = `Welcome to ${group.groupname}!`
      this.$bvModal.show('group-times-modal')
    },
    setGroupTimes() {
      let grouptimes = {
        monday: this.monday,
        tuesday: this.tuesday,
        wednesday: this.wednesday,
        thursday: this.thursday,
        friday: this.friday,
        saturday: this.saturday,
        sunday: this.sunday
      }
      Api.addUserToGroup(this.user.userid, this.newGroup.groupid, grouptimes).then(() => {
        this.getUserGroups()
        this.newGroupTitle = ''
        this.newGroup = {}
        this.monday = []
        this.tuesday = []
        this.wednesday = []
        this.thursday = []
        this.friday = []
        this.saturday = []
        this.sunday = []
      })
    },
    leaveGroup() {
      let userid = getUserIdFromToken(getJwtToken())
      Api.removeUserFromGroup(userid, this.selectedGroup.groupid)
      .then(() => {
        this.getUserGroups()
      })
    },
    createGroup() {
      let userid = getUserIdFromToken(getJwtToken())
      // FIXME: Generate unique invite code 
      let groupinvitecode = uuidv4().slice(0, 12)
      console.log(groupinvitecode)

      Api.createGroup(this.createGroupForm.groupname, this.createGroupForm.groupdesc, groupinvitecode, userid, this.createGroupForm.groupimage)
      .then(() => {
        this.createGroupForm = {
          groupname: '',
          groupdesc: '',
          groupinvitecode: '',
          groupadmin: '',
          groupimage: ''
        }
        this.groupInviteCode = groupinvitecode
        this.joinGroup()
      })
    },
    createEvent() {
      let datetime = this.createEventForm.eventstartdate+'T'+this.createEventForm.eventstarttime
      Api.createEvent(this.createEventForm.eventname, this.createEventForm.eventdesc, this.createEventForm.eventduration, datetime, this.selectedGroup.groupid)
      .then(() => {
        this.createEventForm = {
          eventname: '',
          eventdesc: '',
          eventduration: '',
          eventstarttime: '',
          eventstartdate: ''
        }
        this.getGroupEvents(this.selectedGroup.groupid)
      })
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
  flex-wrap: wrap;
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