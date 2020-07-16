function tryUser() {
    var user = firebase.auth().currentUser;
    if (user) {
        showContent();
    }
}

function signIn() {
    var email = document.getElementById("email-field").value;
    var password = document.getElementById("password-field").value;
    firebase.auth().setPersistence(firebase.auth.Auth.Persistence.SESSION).then(function() {
        // Existing and future Auth states are now persisted in the current session only.
        // Closing the window would clear any existing state even if a user forgets to sign out.
        // ...
        // New sign-in will be persisted with session persistence.
        return firebase.auth().signInWithEmailAndPassword(email, password);
    })
    .catch(function(error) {
        document.getElementById("email-field").classList.add("failed-attempt");
        document.getElementById("password-field").classList.add("failed-attempt");
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
    });
    tryUser();
}

// Get the input field
var input = document.getElementById("password-field");
// Execute a function when the user releases a key on the keyboard
input.addEventListener("keyup", function(event) {
  // Number 13 is the "Enter" key on the keyboard
  if (event.keyCode === 13) {
    signIn();
  }
});

function showContent() {
    var element = document.getElementById("login-grid");
    element.style.display = "none";
    element = document.getElementById("grid");
    element.style.display = "grid";
}

function showLogin() {
    var element = document.getElementById("login-grid");
    element.style.display = "grid";
}