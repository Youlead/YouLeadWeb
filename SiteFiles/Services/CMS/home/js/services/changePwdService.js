var changePwdService = {};
changePwdService.baseUrl = $pageInfo.rootUrl + '/api/home/';

changePwdService.getUrl = function(action, id){
  if (id){
    return changePwdService.baseUrl + action + '/' + id + '?publishmentSystemID=' + $pageInfo.publishmentSystemID + '&channelID=' + $pageInfo.channelID + '&contentID=' + $pageInfo.contentID + '&callback=?';
  }
  return changePwdService.baseUrl + action + '?publishmentSystemID=' + $pageInfo.publishmentSystemID + '&channelID=' + $pageInfo.channelID + '&contentID=' + $pageInfo.contentID + '&callback=?';
}

changePwdService.getchangePwdParameter = function(success){
  $.getJSON(changePwdService.getUrl('GetChangePwdParameter'), null, success);
};

changePwdService.good = function(id){
  $.getJSON(changePwdService.getUrl('Good', id), null, notifyService.successCallback);
};

changePwdService.submitchangePwd = function(content, success){
  var data = {content : content};
  $.getJSON(changePwdService.getUrl('SubmitchangePwd'), data, success);
};