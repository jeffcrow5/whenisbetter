<template>
  <b-container class="container">
    <p>Welcome to ur heckin profile nerd</p>
    <b-form-group label="First Name" label-for="first-name-input">
      <b-form-input
        id="first-name-input"
        v-model="userInfo.firstname"
        autocomplete="off"
      />
    </b-form-group>

    <b-form-group label="Last Name" label-for="last-name-input">
      <b-form-input
        id="last-name-input"
        v-model="userInfo.lastname"
        autocomplete="off"
      />
    </b-form-group>

    <b-form-group label="Email Address" label-for="email-address-input">
      <b-form-input
        id="email-address-input"
        v-model="userInfo.emailaddress"
        autocomplete="off"
        required
      />
    </b-form-group>

    <table id="grid" style="cursor: default;">
      <tbody>
        <tr>
          <td rowspan="26" width="20">&nbsp;</td>
          
            <td class="dateHeader weekend" onclick="header(event,0,true);">
              <div class="gridText">Sun</div>
            </td>
          
            <td class="dateHeader weekday" onclick="header(event,1,true);">
              <div class="gridText">Mon</div>
            </td>
          
            <td class="dateHeader weekday" onclick="header(event,2,true);">
              <div class="gridText">Tue</div>
            </td>
          
            <td class="dateHeader weekday" onclick="header(event,3,true);">
              <div class="gridText">Wed</div>
            </td>
          
            <td class="dateHeader weekday" onclick="header(event,4,true);">
              <div class="gridText">Thu</div>
            </td>
          
            <td class="dateHeader weekday" onclick="header(event,5,true);">
              <div class="gridText">Fri</div>
            </td>
          
            <td class="dateHeader weekend" onclick="header(event,6,true);">
              <div class="gridText">Sat</div>
            </td>
          
          <td rowspan="26" width="20">&nbsp;</td>
        </tr>
        <tr>
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647734400000">
            <span class="gridText">12am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647820800000">
            <span class="gridText">12am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647907200000">
            <span class="gridText">12am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647993600000">
            <span class="gridText">12am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648080000000">
            <span class="gridText">12am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648166400000">
            <span class="gridText">12am</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648252800000">
            <span class="gridText">12am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647738000000">
            <span class="gridText">1am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647824400000">
            <span class="gridText">1am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647910800000">
            <span class="gridText">1am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647997200000">
            <span class="gridText">1am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648083600000">
            <span class="gridText">1am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648170000000">
            <span class="gridText">1am</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648256400000">
            <span class="gridText">1am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647741600000">
            <span class="gridText">2am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647828000000">
            <span class="gridText">2am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647914400000">
            <span class="gridText">2am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648000800000">
            <span class="gridText">2am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648087200000">
            <span class="gridText">2am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648173600000">
            <span class="gridText">2am</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648260000000">
            <span class="gridText">2am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647745200000">
            <span class="gridText">3am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647831600000">
            <span class="gridText">3am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647918000000">
            <span class="gridText">3am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648004400000">
            <span class="gridText">3am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648090800000">
            <span class="gridText">3am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648177200000">
            <span class="gridText">3am</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648263600000">
            <span class="gridText">3am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647748800000">
            <span class="gridText">4am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647835200000">
            <span class="gridText">4am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647921600000">
            <span class="gridText">4am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648008000000">
            <span class="gridText">4am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648094400000">
            <span class="gridText">4am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648180800000">
            <span class="gridText">4am</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648267200000">
            <span class="gridText">4am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647752400000">
            <span class="gridText">5am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647838800000">
            <span class="gridText">5am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647925200000">
            <span class="gridText">5am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648011600000">
            <span class="gridText">5am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648098000000">
            <span class="gridText">5am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648184400000">
            <span class="gridText">5am</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648270800000">
            <span class="gridText">5am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647756000000">
            <span class="gridText">6am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647842400000">
            <span class="gridText">6am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647928800000">
            <span class="gridText">6am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648015200000">
            <span class="gridText">6am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648101600000">
            <span class="gridText">6am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648188000000">
            <span class="gridText">6am</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648274400000">
            <span class="gridText">6am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647759600000">
            <span class="gridText">7am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647846000000">
            <span class="gridText">7am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647932400000">
            <span class="gridText">7am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648018800000">
            <span class="gridText">7am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648105200000">
            <span class="gridText">7am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648191600000">
            <span class="gridText">7am</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648278000000">
            <span class="gridText">7am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647763200000">
            <span class="gridText">8am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647849600000">
            <span class="gridText">8am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647936000000">
            <span class="gridText">8am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648022400000">
            <span class="gridText">8am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648108800000">
            <span class="gridText">8am</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648195200000">
            <span class="gridText">8am</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648281600000">
            <span class="gridText">8am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1647766800000">
            <span class="gridText">9am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647853200000">
            <span class="gridText">9am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647939600000">
            <span class="gridText">9am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648026000000">
            <span class="gridText">9am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648112400000">
            <span class="gridText">9am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648198800000">
            <span class="gridText">9am</span>
          </td>
        
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1648285200000">
            <span class="gridText">9am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1647770400000">
            <span class="gridText">10am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647856800000">
            <span class="gridText">10am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647943200000">
            <span class="gridText">10am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648029600000">
            <span class="gridText">10am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648116000000">
            <span class="gridText">10am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648202400000">
            <span class="gridText">10am</span>
          </td>
        
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1648288800000">
            <span class="gridText">10am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1647774000000">
            <span class="gridText">11am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647860400000">
            <span class="gridText">11am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647946800000">
            <span class="gridText">11am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648033200000">
            <span class="gridText">11am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648119600000">
            <span class="gridText">11am</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648206000000">
            <span class="gridText">11am</span>
          </td>
        
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1648292400000">
            <span class="gridText">11am</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1647777600000">
            <span class="gridText">12pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647864000000">
            <span class="gridText">12pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647950400000">
            <span class="gridText">12pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648036800000">
            <span class="gridText">12pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648123200000">
            <span class="gridText">12pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648209600000">
            <span class="gridText">12pm</span>
          </td>
        
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1648296000000">
            <span class="gridText">12pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1647781200000">
            <span class="gridText">1pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647867600000">
            <span class="gridText">1pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647954000000">
            <span class="gridText">1pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648040400000">
            <span class="gridText">1pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648126800000">
            <span class="gridText">1pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648213200000">
            <span class="gridText">1pm</span>
          </td>
        
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1648299600000">
            <span class="gridText">1pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1647784800000">
            <span class="gridText">2pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647871200000">
            <span class="gridText">2pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647957600000">
            <span class="gridText">2pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648044000000">
            <span class="gridText">2pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648130400000">
            <span class="gridText">2pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648216800000">
            <span class="gridText">2pm</span>
          </td>
        
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1648303200000">
            <span class="gridText">2pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1647788400000">
            <span class="gridText">3pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647874800000">
            <span class="gridText">3pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647961200000">
            <span class="gridText">3pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648047600000">
            <span class="gridText">3pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648134000000">
            <span class="gridText">3pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648220400000">
            <span class="gridText">3pm</span>
          </td>
        
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1648306800000">
            <span class="gridText">3pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1647792000000">
            <span class="gridText">4pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647878400000">
            <span class="gridText">4pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647964800000">
            <span class="gridText">4pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648051200000">
            <span class="gridText">4pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648137600000">
            <span class="gridText">4pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648224000000">
            <span class="gridText">4pm</span>
          </td>
        
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1648310400000">
            <span class="gridText">4pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1647795600000">
            <span class="gridText">5pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647882000000">
            <span class="gridText">5pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1647968400000">
            <span class="gridText">5pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648054800000">
            <span class="gridText">5pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648141200000">
            <span class="gridText">5pm</span>
          </td>
        
          <td nowrap class="slot weekday office" onmousedown="md(this);" id="1648227600000">
            <span class="gridText">5pm</span>
          </td>
        
          <td nowrap class="slot weekend office" onmousedown="md(this);" id="1648314000000">
            <span class="gridText">5pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647799200000">
            <span class="gridText">6pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647885600000">
            <span class="gridText">6pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647972000000">
            <span class="gridText">6pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648058400000">
            <span class="gridText">6pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648144800000">
            <span class="gridText">6pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648231200000">
            <span class="gridText">6pm</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648317600000">
            <span class="gridText">6pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647802800000">
            <span class="gridText">7pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647889200000">
            <span class="gridText">7pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647975600000">
            <span class="gridText">7pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648062000000">
            <span class="gridText">7pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648148400000">
            <span class="gridText">7pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648234800000">
            <span class="gridText">7pm</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648321200000">
            <span class="gridText">7pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647806400000">
            <span class="gridText">8pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647892800000">
            <span class="gridText">8pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647979200000">
            <span class="gridText">8pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648065600000">
            <span class="gridText">8pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648152000000">
            <span class="gridText">8pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648238400000">
            <span class="gridText">8pm</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648324800000">
            <span class="gridText">8pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647810000000">
            <span class="gridText">9pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647896400000">
            <span class="gridText">9pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647982800000">
            <span class="gridText">9pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648069200000">
            <span class="gridText">9pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648155600000">
            <span class="gridText">9pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648242000000">
            <span class="gridText">9pm</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648328400000">
            <span class="gridText">9pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647813600000">
            <span class="gridText">10pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647900000000">
            <span class="gridText">10pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647986400000">
            <span class="gridText">10pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648072800000">
            <span class="gridText">10pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648159200000">
            <span class="gridText">10pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648245600000">
            <span class="gridText">10pm</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648332000000">
            <span class="gridText">10pm</span>
          </td>
          
        </tr>
      
        <tr>
          
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1647817200000">
            <span class="gridText">11pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647903600000">
            <span class="gridText">11pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1647990000000">
            <span class="gridText">11pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648076400000">
            <span class="gridText">11pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648162800000">
            <span class="gridText">11pm</span>
          </td>
        
          <td nowrap class="slot weekday home" onmousedown="md(this);" id="1648249200000">
            <span class="gridText">11pm</span>
          </td>
        
          <td nowrap class="slot weekend home" onmousedown="md(this);" id="1648335600000">
            <span class="gridText">11pm</span>
          </td>
          
        </tr>
        
        <tr>
          <td colspan="7">&nbsp;</td>
        </tr>
      </tbody>
    </table>
    <b-button variant="primary" @click="''">
      Save
    </b-button>
  </b-container>
</template>

<script>
import Api from '../api'

export default {
  name: "Profile",
  data () {
    return {
      userInfo: {
        firstname: '',
        lastname: '',
        emailaddress: '',
        availabletimes: {}
      }
    }
  },
  created() {
    Api.getUserProfile().then((res) => {
      console.log(res.data[0])
      this.userInfo = res.data[0]
    })
  },
};
</script>

<style scoped>
.container {
  padding: 30px;
}
</style>