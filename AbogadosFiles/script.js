
function toggleNotifications() {
    var notificationList = document.getElementById("notificationList");
    if (notificationList.style.display === "none" || notificationList.style.display === "") {
        notificationList.style.display = "block";
    } else {
        notificationList.style.display = "none";
    }
}
