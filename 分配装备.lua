//raid.flow
[if] (playerName) == null
    ($playerName) = null
#input ($playerName)=请输入参与分配的玩家名字,(playerName)
#config
@cmdDelay 300
[while] true
    alloc
    @tip 请选择对|目前没有可用的($finish)|不要急
    [if] (finish)!=null
        [break]
    //点击分配按钮
    @js $(".content-message").find(".item-commands").last().children("span:contains('分配给参与战斗的玩家')").click()
    //检查是否存在指定玩家
    $wait 500
    @js ($playerList) = $(".content-message").find(".item-commands").last().children().text()
    @js ($playerYes) = "(playerList)".indexOf('(playerName)')
    //分配或扩充
    [if] (playerYes) != -1
        @js ($playlist) = $(".content-message").find(".item-commands").last().children("span:contains('(playerName)')").click()
    [else]
        alloc
        @js $(".content-message").find(".item-commands").last().children(":first").click()