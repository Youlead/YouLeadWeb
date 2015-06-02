var changePwdController = {};

changePwdController.isAnonymous = true;
changePwdController.user = {};
changePwdController.oldPwd = "";
changePwdController.newPwd = "";


changePwdController.submitchangePwd = function(){
    if (changePwdController.isAnonymous){
      changePwdController.login();
      return;
    }
    var content = $('.changePwd_textarea').val();
    if (content){
      changePwdService.submitchangePwd(content, function(data) {
        if (data.isSuccess){
          changePwdController.totalNum += 1;
          data.changePwd.floor = changePwdController.totalNum;
          changePwdController.changePwds.splice(0, 0, data.changePwd);
          notifyService.success(data.successMessage);
          utilService.render('changePwdController', changePwdController);
        }else{
          notifyService.error(data.errorMessage);
        }
      });
    }else{
      $('.changePwd_textarea').focus();
    }
};

changePwdController.getchangePwdParameter = function () {
  changePwdService.getchangePwdParameter(function (data) {
      if (data.isSuccess) {     
      changePwdController.user = data.user;
      changePwdController.isAnonymous = data.isAnonymous;
      changePwdController.oldPwd = data.oldPwd;
      utilService.render('changePwdController', changePwdController);
    }
    
  });
};

$(function(){
  changePwdController.getchangePwdParameter();
});