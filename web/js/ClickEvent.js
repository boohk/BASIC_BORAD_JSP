/**
 * Created by BooJing on 2016-12-28.
 */
function move(url) {
    location.href=url;
}

function UpdateCheck() {
    var form = document.UpdateForm;
    return true;
}

function WriteCheck() {
    var form = document.WriteForm;
    return true;
}

function returnlist(url) {
    alert("성공");
    move(url);
}

function backingPage() {
    history.go(-1);
}

function boardUpdateCheck() {
    var form = document.BoardUpdateForm;
    return true;
}