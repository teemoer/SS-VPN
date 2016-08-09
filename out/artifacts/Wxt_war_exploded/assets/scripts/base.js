$(function () {
    // 基础路径
    window.ctxPath = $("meta[name='ctx']").attr('content');
    // ajax基本配置
    $.ajaxSetup({
        error: function (jqXHR, textStatus, errorThrown) {
            if (jqXHR.status === 404) {
                Alert.error("请求的页面未找到");
            }
            if (jqXHR.status === 500) {
                Alert.error("请求的页面出现错误,请联系管理员");
            }
            if (jqXHR.status === 400) {
                Alert.error("参数错误,请重试");
            }
        }
    });
    // 日期选择器 语言设置
    // $.datetimepicker.setLocale('ch');
    //initModule($("[data-datetimepicker]"), "datetimepicker");
    initModule($("[data-select-search]"), "select2");
    // toast
    $("body").prepend("<div id='toast-content' style='top:12px;position: absolute !important;'></div>");
    $(window).scroll(function () {
        var headerHeight = $("header").height();
        var scrollTop = $(document).scrollTop();
        if (scrollTop >= headerHeight) {
            $("#toast-content").css("top", "32px");
        } else {
            $("#toast-content").css("top", 30 + 2 + "px");
        }
    });
    // 切换科室
    //$("#switchDept").on("click", "[data-event-type='switchDept']", function () {
    //    var deptId = $(this).parents("tr").find("td:first").text();
    //    $.ajax({
    //        url: ctxPath + "/common/get/dept/switch/" + deptId,
    //        method: "get",
    //        success: function () {
    //            window.location.reload();
    //        },
    //        error: function () {
    //
    //        }
    //    });
    //});

    // 异常捕捉
    window.onerror = function (errorMessage, scriptURI, lineNumber, columnNumber, error) {

        //没有URL不上报！上报也不知道错误
        if (errorMessage != "Script error." && !scriptURI) {
            return true;
        }
        //采用异步的方式
        //我遇到过在window.onunload进行ajax的堵塞上报
        //由于客户端强制关闭webview导致这次堵塞上报有Network Error
        //我猜测这里window.onerror的执行流在关闭前是必然执行的
        //而离开文章之后的上报对于业务来说是可丢失的
        //所以这里的执行流放到异步事件去执行
        setTimeout(function () {
            var data = {};
            //不一定所有浏览器都支持columnNumber参数
            columnNumber = columnNumber || (window.event && window.event.errorCharacter) || 0;
            data.scriptURI = scriptURI;
            data.lineNumber = lineNumber;
            data.columnNumber = columnNumber;
            if (!!error && !!error.stack) {
                //如果浏览器有堆栈信息
                //直接使用
                data.errorMessage = error.stack.toString();
            } else if (!!arguments.callee) {
                //尝试通过callee拿堆栈信息
                var ext = [];
                var f = arguments.callee.caller, c = 3;
                //这里只拿三层堆栈信息
                while (f && (--c > 0)) {
                    ext.push(f.toString());
                    if (f === f.caller) {
                        break;//如果有环
                    }
                    f = f.caller;
                }
                ext = ext.join(",");
                data.errorMessage = ext;
            }
            //把data上报到后台！
            //$.post("/common/log/js/error", data);
        }, 0);
        // return false 让控制台继续报错
        return false;
    };

    //// 隐藏菜单
    //$("[data-event-type='switch-menu']").on("click", function () {
    //    if ($("body").is(".sidebar-collapse")) {
    //        $.cookie('sidebarCollapse', false, {expires: 7, path: '/'});
    //        $("body").removeClass("sidebar-collapse");
    //        $(this).find(".iconfont").html("&#xe601;");
    //    } else {
    //        $.cookie('sidebarCollapse', true, {expires: 7, path: '/'});
    //        $("body").addClass("sidebar-collapse");
    //        $(this).find(".iconfont").html("&#xe600;");
    //    }
    //});
    //$(document).delegate("[data-select-linkage]", "select2:select", function (e) {
    //    var toSelectId = $(this).attr("data-select-linkage");
    //    var selectUrl = $(this).attr("data-select-linkage-url");
    //    var selectId = e.params.data.id;
    //    var $toSelect = $("#" + toSelectId);
    //    if (selectId) {
    //        $.ajax({
    //            url: selectUrl,
    //            data: {value: selectId},
    //            type: "post",
    //            success: function (info) {
    //                $toSelect.empty();
    //                $toSelect.select2({data: info, width: 'resolve'});
    //            }
    //        });
    //    }
    //});

    //$(document).delegate("[data-table-select] tbody tr", "click", function () {
    //    var $changeDisabledButton = $(this).parents("[id^='DataTables_Table']").parent().find("[data-change-disabled]");
    //    if ($(this).hasClass("row_selected")) {
    //        $(this).find("[data-table-checkbox]").prop("checked", false);
    //        $(this).removeAttr("data-table-row-selected");
    //        $(this).removeClass("row_selected");
    //    } else {
    //        $(this).find("[data-table-checkbox]").prop("checked", true);
    //        $(this).attr("data-table-row-selected", "");
    //        $(this).addClass("row_selected");
    //    }
    //    var $selectedTr = $(this).parents("table").find("[data-table-row-selected]");
    //    if ($selectedTr.length == 0) {
    //        $changeDisabledButton.attr("disabled", "");
    //        $changeDisabledButton.addClass("disabled")
    //    } else {
    //        $changeDisabledButton.removeAttr("disabled");
    //        $changeDisabledButton.removeClass("disabled")
    //    }
    //    $(this).trigger("tr-select");
    //});

    //对设置了data-table-single-select属性的table实现单选的效果
    //$(document).delegate("[data-table-single-select] tbody tr", "click",
    //    function () {
    //        var $changeDisabledButton = $(this).parents("[id^='DataTables_Table']").parent().find("[data-change-disabled]");
    //        if ($(this).hasClass('row_selected')) {
    //            $(this).find("[data-table-checkbox]").prop("checked", false);
    //            $(this).removeAttr("data-table-row-selected");
    //            $(this).removeClass('row_selected');
    //        } else {
    //            var target = $(this).closest('[data-table-name]').DataTable().$('tr.row_selected');
    //            target.removeClass('row_selected');
    //            target.removeAttr("data-table-row-selected");
    //            target.find("[data-table-checkbox]").prop("checked", false);
    //            $(this).find("[data-table-checkbox]").prop("checked", true);
    //            $(this).addClass('row_selected');
    //            $(this).attr("data-table-row-selected", "");
    //        }
    //        var $selectedTr = $(this).parents("table").find("[data-table-row-selected]");
    //        if ($selectedTr.length == 0) {
    //            $changeDisabledButton.attr("disabled", "");
    //            $changeDisabledButton.addClass("disabled")
    //        } else {
    //            $changeDisabledButton.removeAttr("disabled");
    //            $changeDisabledButton.removeClass("disabled")
    //        }
    //    });
    //
    ////对设置了data-table-single-select属性的table实现单选的效果
    //$(document).delegate("[data-table-single-disabled-select] tbody tr", "click",
    //    function () {
    //        var $changeDisabledButton = $(this).parents("[id^='DataTables_Table']").parent().find("[data-change-disabled]");
    //        if ($(this).hasClass('row_selected')) {
    //
    //        } else {
    //            var target = $(this).closest('[data-table-name]').DataTable().$('tr.row_selected');
    //            target.removeClass('row_selected');
    //            target.removeAttr("data-table-row-selected");
    //            target.find("[data-table-checkbox]").prop("checked", false);
    //            $(this).find("[data-table-checkbox]").prop("checked", true);
    //            $(this).addClass('row_selected');
    //            $(this).attr("data-table-row-selected", "");
    //        }
    //        var $selectedTr = $(this).parents("table").find("[data-table-row-selected]");
    //        if ($selectedTr.length == 0) {
    //            $changeDisabledButton.attr("disabled", "");
    //            $changeDisabledButton.addClass("disabled")
    //        } else {
    //            $changeDisabledButton.removeAttr("disabled");
    //            $changeDisabledButton.removeClass("disabled")
    //        }
    //    });
    //
    //$(document).delegate("[data-table-title-checkbox]", "change", function (e) {
    //    var $table = $(this).parents("table");
    //    var $tbody = $table.find("tbody");
    //    var isSelected = $(this).prop("checked");
    //    // 判断表格是否需要标志为选中状态
    //    var isAddClass = !(typeof $table.attr("data-table-select") === 'undefined');
    //    $tbody.find("[data-table-checkbox]").each(function () {
    //        if (isSelected) {
    //            $(this).prop("checked", true);
    //            if (isAddClass) {
    //                $(this).parents("tr").trigger("tr-select");
    //                $(this).parents("tr").attr("data-table-row-selected", "");
    //                $(this).parents("tr").addClass("row_selected");
    //            }
    //        } else {
    //            $(this).prop("checked", false);
    //            if (isAddClass) {
    //                $(this).parents("tr").trigger("tr-select");
    //                $(this).parents("tr").removeAttr("data-table-row-selected");
    //                $(this).parents("tr").removeClass("row_selected");
    //            }
    //        }
    //    });
    //});

});
//
///**
// * 初始化组建
// * @param obj    需要初始化的对象
// * @param type   对象类型
// */
window.initModule = function (obj, type) {
    //if (type == "datetimepicker") {
    //    $(obj).datetimepicker({
    //        timepicker: false,
    //        format: 'Y/m/d',
    //        scrollInput: false
    //    });
    //}
    //if (type == "select2") {
    //    var placeholder = $(obj).attr("[data-select-search-placeholder]");
    //    // 下拉选择框
    //    $(obj).select2({
    //        language: "zh-CN",
    //        placeholder: placeholder,
    //        width: 'resolve',
    //        matcher: function (params, data) {
    //            return $.fn.select2.extMather(params, data);
    //        }
    //    });
    //}
};
//
///**
// * 初始化dialog中的组建
// * @param dialogObj  dialog
// */
//window.initModuleForDialog = function (dialogObj) {
//    var $range = dialogObj.getModal();
//    //var $datetimepicker = $range.find("[data-datetimepicker]");
//    var $select2 = $range.find("[data-select-search]");
//    //initModule($datetimepicker, "datetimepicker");
//    initModule($select2, "select2");
//};
//
///**
// * reset表单
// * @param form 表单对象
// */
//window.resetForm = function (form) {
//    $(form)[0].reset();
//    // reset直接还原select的表单会有点问题,此处遍历将所有select2重置
//    $(form).find("[data-select-search]").each(function (i, e) {
//        $(e).val("").trigger("change");
//    });
//};

// alert 提示组件
window.Alert = {};
Alert.common = function () {
    if ($("#toast-content").length < 1) {
        alert("页面上未找到[id='toast-content']元素,无法弹出提示框");
    }
    var headerHeight = $("header").height();
    var nowHeight = $(window).scrollTop();
    if (nowHeight < headerHeight) {
        // 如果当前滚动的位置还没超过header的高度,就显示在header下面
        $("#toast-content").css("top", 30 + 2 + "px");
    } else {
        // 当前滚动的位置超过了header的高度,显示顶部
        $("#toast-content").css("top", "32px");
    }
};
Alert.error = function (message, title) {
    Alert.common();
    if (title == null) {
        title = '错误提示';
    }
    return toastr['error'](message, title);
};

Alert.warning = function (message, title) {
    Alert.common();
    if (title == null) {
        title = '警告提示';
    }
    return toastr['warning'](message, title);
};

Alert.success = function (message, title) {
    Alert.common();
    if (title == null) {
        title = '成功提示';
    }
    return toastr['success'](message, title);
};
Alert.info = function (message, title) {
    Alert.common();
    if (title == null) {
        title = '提示';
    }
    return toastr["info"](message, title);
};

///**
// * 字符串format
// * @returns {*}
// */
//String.prototype.format = function () {
//    var i, re, result;
//    result = this;
//    if (arguments.length === 0) {
//        return null;
//    }
//    i = 0;
//    while (i < arguments.length) {
//        re = new RegExp('\\{' + i + '\\}', 'gm');
//        result = result.replace(re, arguments[i]);
//        i++;
//    }
//    return result;
//};

//// bootstrapDialog
//window.Dialog = {};
///**
// * 生成关闭按钮
// * @param label 按钮上的文字 default:"关闭"
// * @param css 自定义css      default:"push-button stateless"
// */
//Dialog.generateCloseBtn = function (label, css) {
//    if (label == null) {
//        label = '关闭';
//    }
//    if (css == null) {
//        css = 'push-button stateless';
//    }
//    return {
//        label: label,
//        cssClass: css,
//        action: function (dialogRef) {
//            dialogRef.close();
//        }
//    };
//};
//
//
///**
// * 生成message
// * @param url 读取的url地址
// */
//Dialog.generateMessage = function (url) {
//    var $message = $('<div></div>');
//    $message.load(url);
//    return $message;
//};
//
///**
// * 生成保存按钮
// * @param actionCallback     callback执行函数
// * @param label              保存按钮上的文字
// * @param css                css
// * @returns {{label: *, cssClass: *, action: *}}
// */
//Dialog.generateSaveBtn = function (actionCallback, label, css) {
//    if (label == null) {
//        label = '保存';
//    }
//    if (css == null) {
//        css = 'push-button submit';
//    }
//    return {
//        label: label,
//        cssClass: css,
//        action: actionCallback
//    }
//};
//
///**
// * 生成提交表单保存按钮
// * @param formName           表单名称
// * @param label              保存按钮上的文字
// * @param css                css
// * @returns {{label: *, cssClass: *, action: *}}
// */
//Dialog.generateSubmitSaveBtn = function (formName, label, css) {
//    if (label == null) {
//        label = '保存';
//    }
//    if (css == null) {
//        css = 'push-button submit';
//    }
//    return {
//        label: label,
//        cssClass: css,
//        action: function () {
//            $("[data-form-name='" + formName + "']").submit();
//        }
//    }
//};
//
///**
// * 提交操作完成后 执行一些基本方法:
// * 1. 判断data中的result来提示信息
// * 2. 关闭dialog
// * 3. 刷新table
// */
//Dialog.basicSuccessOperate = function (data, param) {
//    if (data.result) {
//        if (param.defaultSuccessCallback) {
//            Alert.success(data.message);
//            if (param.dialog != null) {
//                param.dialog.close();
//            }
//            if (param.table != null) {
//                param.table.ajax.reload();
//            }
//        }
//        if (param.successCallback) {
//            param.successCallback(data);
//        }
//
//    } else {
//        if (param.defaultErrorCallback) {
//            Alert.error(data.message);
//        }
//        if (param.errorCallback) {
//            param.errorCallback(data);
//        }
//
//
//    }
//};
//
////table
//window.Table = {};
///**
// * 获取表格中选中的值
// * @param tableName 表格名(data-table-name)
// * @param errorMsg  没有选中的时候错误消息
// * @returns {*|{}|jQuery}
// */
//Table.getSelected = function (tableName, errorMsg) {
//    if (errorMsg == null) {
//        errorMsg = "请选择你要操作的信息";
//    }
//    var checkedCheckbox = $("[data-table-name='" + tableName + "']").find("[data-table-row-selected]");
//    if (checkedCheckbox.length == 0) {
//        Alert.error(errorMsg);
//        return null;
//    }
//    return checkedCheckbox;
//};
//
////ext
//window.Ext = {};
//Ext.defaultParam = {
//    dataType: "json",
//    type: "post",
//    defaultSuccessCallback: true,
//    defaultErrorCallback: true,
//    failCallback: function () {
//        Alert.error("服务器异常");
//    }
//};
///**
// * 基础的提交
// * @param obj
// * form  表单
// *               提交地址: $(form).attr("action")
// *               提交数据: $(form).serialize()
// *               提交方式: $(form).attr("method")
// * dialog 要处理的dialog
// * table  要刷新的table
// * successCallback 成功后执行
// * errorCallback 失败后执行
// * failCallback ajax error后执行
// * defaultSuccessCallback 是否执行默认的成功callback
// */
//Ext.submit = function (obj) {
//    var param = $.extend(obj, Ext.defaultParam);
//    $.ajax({
//        url: param.form.attr("action"),
//        data: param.form.serialize(),
//        type: param.form.attr("method"),
//        success: function (data) {
//            Dialog.basicSuccessOperate(data, param);
//        },
//        error: function () {
//            param.failCallback();
//        }
//    });
//};
//
//Ext.ajax = function (obj) {
//    var param = $.extend(obj, Ext.defaultParam);
//    $.ajax({
//        url: param.url,
//        data: param.data,
//        type: param.type,
//        success: function (data) {
//            Dialog.basicSuccessOperate(data, param);
//        },
//        error: function () {
//            param.failCallback();
//        }
//    });
//};
//
//
//// 对Date的扩展，将 Date 转化为指定格式的String
//// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
//// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
//// 例子：
//// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
//// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
//Date.prototype.Format = function (fmt) { //author: meizz
//    var o = {
//        "M+": this.getMonth() + 1,                 //月份
//        "d+": this.getDate(),                    //日
//        "h+": this.getHours(),                   //小时
//        "m+": this.getMinutes(),                 //分
//        "s+": this.getSeconds(),                 //秒
//        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
//        "S": this.getMilliseconds()             //毫秒
//    };
//    if (/(y+)/.test(fmt))
//        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
//    for (var k in o)
//        if (new RegExp("(" + k + ")").test(fmt))
//            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
//    return fmt;
//};