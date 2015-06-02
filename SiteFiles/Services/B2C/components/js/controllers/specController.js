var specController = {};

specController.itemIDs = [];
specController.itemIDCollection = '';
specController.goodsList = [];
specController.goods = {goodsID:0, itemIDCollection:'', priceMarket:0, priceSale:0, priceSaved:0};


specController.addItemID = function(specID, itemID){
  var isExists = false;
  $.each(specController.itemIDs, function(i, item){
      if (item.specID == specID){
          isExists = true;
      }
  });
  if (!isExists){
      specController.itemIDs.push({"specID": specID, "itemID": itemID});
  }
  specController.selectGoods();
};

specController.selectItemID = function(e){
  var span = $(e).find('span');
	var specID = span.attr('specID');
	var itemID = span.attr('itemID');
  $.each(specController.itemIDs, function(i, item){
      if (item.specID == specID){
          item.itemID = itemID;
      }
  });
  specController.selectGoods();
};

specController.selectGoods = function(){
  specController.itemIDCollection = '';
  $.each(specController.itemIDs, function(i, item){
      specController.itemIDCollection += ',' + item.itemID;
  });
  if (specController.itemIDCollection.length > 0){
      specController.itemIDCollection = specController.itemIDCollection.substring(1);
  }

  $.each(specController.goodsList, function(index, goods) {
       var array1 = goods.itemIDCollection.split(',');
       var array2 = specController.itemIDCollection.split(',');
       array1.sort();
       array2.sort();
       if (array1.join(',') == array2.join(',')){
          specController.goods = goods;
       }
  });
  specController.showPrice();
};

specController.buy = function(){
  specController.addToCart();
  location.href = $pageInfo.siteUrl + '/utils/order.html';
};

specController.addToCart = function () {
  var purchaseNum = $('#purchaseNum').val();
  var cart = {
      channelID : $pageInfo.channelID,
      contentID : $pageInfo.contentID,
      goodsID : specController.goods.goodsID,
      purchaseNum : purchaseNum
  };

  b2cService.addToCart(cart, function(data){
      if (data.isSuccess){
        notifyService.successAddCart();
        b2cController.getB2CParameter();
      }else{
        notifyService.error(data.errorMessage);
      }
  });
};

specController.addToFollow = function(){
  var follow = {
      channelID : $pageInfo.channelID,
      contentID : $pageInfo.contentID
  };

  b2cService.addToFollow(follow, function(data){
      if (data.isSuccess){
        notifyService.successAddFollow();
      }else{
        notifyService.error(data.errorMessage);
      }
  });
};

specController.showPrice = function(){
  if (specController.goods){
    $('#priceMarket').html(specController.goods.priceMarket);
    $('#priceSale').html(specController.goods.priceSale);
    $('#priceSaved').html(specController.goods.priceSaved);
  }
};

$(function(){
  specController.goods = specController.goodsList[0];
  $('.firstSpecItem').each(function(){
    specController.addItemID($(this).attr('specID'), $(this).attr('itemID'));
  });
  specController.showPrice();
});