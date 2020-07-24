let database;
let lines;
let errors;

function preload() {
    // Firebase
	var firebaseConfig = {
		apiKey: "AIzaSyAmxjDLZrtiWjQGkekCdTXKx5zCbLDJP28",
		authDomain: "machin-dev.firebaseapp.com",
		databaseURL: "https://machin-dev.firebaseio.com",
		projectId: "machin-dev",
		storageBucket: "machin-dev.appspot.com",
		messagingSenderId: "471389656934",
		appId: "1:471389656934:web:de807290048ad37fa91aa7",
		measurementId: "G-2LDMEXJL3N"
    };
    // Initialize lines
    lines = new Array;
    errors = new Array;
    //lines.push("[Browser/INFO]: Connecting to real-time database");
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
	firebase.analytics();
    database = firebase.database();
    // Auth
    firebase.auth().onAuthStateChanged(function(user) {
        if (user) {
            //firebase.auth().signOut() 
            tryUser();
        } else {
          // No user is signed in.
            showLogin();
        }
    });
	// Console event
	var ref = database.ref('edi/console/test');
    ref.on('value', gotConsoleData, errConsoleData);
	// Error event
	var ref = database.ref('edi/error');
    ref.on('value', gotErrorData, errErrorData);
    
}

function setup() {
    //
}

function gotConsoleData(data) {
    lines = data.val();
    let div = document.getElementById('console');
    if (div != null) {
        writeConsole();
    }
}

function errConsoleData(err) {

}

function gotErrorData(data) {
    errors = data.val();
}

function errErrorData(err) {

}

function writeConsole() {
    let div = document.getElementById('console');
    if (div != null) {
        div.innerHTML = '';
        for(var i = lines.length; i > -1; i--) {
            //console.log(data.val()[i]);
            let elt = createP(lines[i]);
            elt.parent(div);
        }
    }
}

function writeErrors() {
    let div = document.getElementById('errors');
    if (div != null && errors != null) {
        for (var i = 0; i < errors.length; i++) {
            let elt = createP(errors[i]);
            elt.class('error');
            elt.parent(div);
        }
    }
}

function testDashboard() {
    let div = document.getElementById('content');
    div.innerHTML = '';
    // Set title
    let title = document.getElementById('page-title');
    title.innerHTML = 'Dashboard <p style = "display: inline; font-weight: 400; font-size: 0.65em">/ Server address: vps.machin.dev';
    // Create errors wrapper
    let wrapper = createDiv();
    wrapper.id('errors');
    wrapper.parent(div);
    writeErrors();
    // Create console wrapper
    wrapper = createDiv();
    wrapper.id('console-wrapper');
    wrapper.parent(div);
    // Create console
    let elt = createDiv();
    elt.id('console');
    elt.parent(wrapper);
    writeConsole();
    // Create server controls
    div = document.getElementById('grid-sidebar');
    div.innerHTML = '';
    elt = createDiv();
    elt.id('server-controls');
    elt.parent(div);
    list = createElement('ul');
    list.parent(elt);
    btn = createElement('li');
    btn.html('<a href = ""><i class="fas fa-play"></i>&nbsp;&nbsp;Start</a>');
    btn.parent(list);
    btn = createElement('li');
    btn.html('<a href = ""><i class="fas fa-stop"></i>&nbsp;&nbsp;Stop</a>');
    btn.parent(list);
    btn = createElement('li');
    btn.html('<a href = ""><i class="fas fa-sync"></i>&nbsp;&nbsp;Restart</a>');
    btn.parent(list);
    btn = createElement('li');
    btn.html('<a href = ""><i class="fas fa-caret-down"></i></a>');
    btn.parent(list);
    // Create sidebar links
    elt = createDiv();
    elt.id('sidebar-links');
    elt.parent(div);
    list = createElement('ul');
    list.parent(elt);
    btn = createElement('li');
    btn.html('Console');
    btn.parent(list);
    btn = createElement('li');
    btn.html('<a href = "">Server manager</a>');    
    btn.parent(list);
    btn = createElement('li');
    btn.html('<a href = "">Archived messages</a>');   
    btn.parent(list);
    btn = createElement('li');
    btn.html('<a href = "">Reports</a>');
    btn.parent(list);
    btn = createElement('li');
    btn.html('<a href = "./public_docs.html">Public documentation</a>');
    btn.parent(list);
}