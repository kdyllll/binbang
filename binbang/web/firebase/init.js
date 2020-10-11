// Firebase 초기화
// 각 항목은 자신의 App의 정보로 바꾸어 넣습니다.
var config = {
    apiKey: "AIzaSyBWPafbWFda66a0jiJe9PQZZwLA_2_It24",
    authDomain: "semi-9c343.firebaseapp.com",
    databaseURL: "https://semi-9c343.firebaseio.com",
    projectId: "semi-9c343",
    storageBucket: "semi-9c343.appspot.com",
    messagingSenderId: "904220268983",
    appId: "1:904220268983:web:17827ced359f8660153032",
    measurementId: "G-ZQQXCVR9RV"
};
firebase.initializeApp(config);
 
// Sign out
function signOut() {
    if(!confirm("Do you really want to log out?")) {
        return;
    }
    
    firebase.auth().signOut().then(function() {
        location.reload();
    }, function(e) {
        lastWork = "authorized";
        $("#error #errmsg").html(e.message)
        $("#error").show();
        $("#authorized").hide();
    });
}