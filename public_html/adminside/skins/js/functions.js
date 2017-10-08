function SendPost(func_name, vars_array, call_back) {
    $.post(ADM_SRV + "bin/jquery.php", {
        func: func_name,
        data: vars_array
    }).done(function(data) {
        call_back(data);
    });
}

function PostData(data){ }

/* --- SET STATUS --- */
function setStatus(id, val, table, elem, call_back){
    $.post(ADM_SRV + "bin/jquery.php", {
        func: "set_check",
        table: table,
        id: id,
        val: val
    }).done(function(data) {
        call_back(elem);
    });
}

function setDisable(elem){
    elem.addClass('disable');
    elem.removeClass('active');
}

function setActive(elem){
    elem.addClass('active');
    elem.removeClass('disable');
}

function setStatusSelect(id, val, table){
    $.post(ADM_SRV + "bin/jquery.php", {
        func: "set_check",
        table: table,
        id: id,
        val: val
    }).done(function(data) { });
}

/* --- END SET STATUS --- */

/* --- DELETE CHECKED --- */
function deleteChecked(ids, table){
    $.post(ADM_SRV + "bin/jquery.php", {
        func: "delete_checked",
        table: table,
        ids: ids
    }).done(function(data) {
        location.reload();
    });
}
/* --- END DELETE CHECKED --- */

/* --- DELETE IMG --- */
function deleteImg(link, pic){
    $.post(ADM_SRV + "bin/jquery.php", {
        func: "delete_img",
        link: link
    }).done(function(data) {
        pic.attr('src', ADM_SRV+'skins/image/nophoto.jpg');
    });
}

function deleteImgWater(link, pic){
    $.post(ADM_SRV + "bin/jquery.php", {
        func: "delete_img_water",
        link: link
    }).done(function(data) {
        pic.attr('src', ADM_SRV+'skins/image/nophoto.jpg');
    });
}
/* --- END DELETE IMG --- */

function pInt(string){
    var integer = string.match(/\d+/);
    return integer[0];
}

function escapeHtml(text) {
    return text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#039;");
}

function ajaxSendPost(_data){
    var _Result;
    $.ajax({
        url: ADM_SRV + "bin/ajax.php",
        type: "POST",
        data: _data,
        async: false,
        processData: false,
        contentType: false,
        success: function(msg){
            _Result = msg;
        }
    });
    return _Result;
}

function ajaxSendPostAsync(_data, callback){
    $.ajax({
        url: ADM_SRV + "bin/ajax.php",
        type: "POST",
        data: _data,
        async: true,
        processData: false,
        contentType: false,
        success: function(msg){
            callback(msg);
        }
    });
}