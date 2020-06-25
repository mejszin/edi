let database;

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
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
	firebase.analytics();
    database = firebase.database();
	// Console event
	var ref = database.ref('edi/console');
    ref.on('value', gotConsoleData, errConsoleData);
}

function setup() {
    // Setup
    noCanvas();
    let div = document.getElementById('console');
    
    let elt = createP("[Browser/INFO]: Connecting to real-time database");
    elt.parent(div);
    elt = createP("[Browser/INFO]: Connecting to real-time database");
    elt.parent(div);
    elt = createP("[Browser/INFO]: Connecting to real-time database");
    elt.parent(div);
}

function gotConsoleData(data) {
    let div = document.getElementById('console');
    div.innerHTML = '';
    for(var i = 0; i < data.val().length; i++) {
        //console.log(data.val()[i]);
        let elt = createP(data.val()[i]);
        elt.parent(div);
    }
}

function errConsoleData(err) {

}