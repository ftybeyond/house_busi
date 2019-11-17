/*! Select2 4.0.5 | https://github.com/select2/select2/blob/master/LICENSE.md */

(function(){if(jQuery&&jQuery.fn&&jQuery.fn.select2&&jQuery.fn.select2.amd)var e=jQuery.fn.select2.amd;return e.define("select2/i18n/zh-CN",[],function(){return{errorLoading:function(){return"无法载入结果。"},inputTooLong:function(e){var t=e.input.length-e.maximum,n="请删除"+t+"个字符";return n},inputTooShort:function(e){var t=e.minimum-e.input.length,n="请再输入至少"+t+"个字符";return n},loadingMore:function(){return"载入更多结果…"},maximumSelected:function(e){var t="最多只能选择"+e.maximum+"个项目";return t},noResults:function(){return"未找到结果"},searching:function(){return"搜索中…"}}}),{define:e.define,require:e.require}})();
;(function(){
    jQuery.fn.OnceLoadSelect2=function(url,param,settings,callback){
        var baseOpt = {
            language: "zh-CN",
            placeholder: '--请选择--',
            width: "100%",
            allowClear: true
        };
        var _this = $(this);
        if (settings) {
            $.extend(true, settings, baseOpt);
        }
        var select;
        $.post(url,param,null,"json").done(function(data){
            settings.data=data;
            select = _this.select2(settings);
            select.val(null).trigger("change");
            return select;
            if(callback){
                callback(data);
            }
        });
        return select;
    };
    jQuery.fn.SimpleSelect2 = function(settings){
        var baseOpt = {
            language: "zh-CN",
            placeholder: '--请选择--',
            width: "100%",
            allowClear: true
        };
        if (settings) {
            $.extend(true, settings, baseOpt);
        }
        $(this).select2(settings)
        $(this).val(null).trigger("change");
    }
})(jQuery)