// 新聊天信息触发器
// 聊天信息内容：(content)
// 发言人：(name)
// 如需更多信息，可以到论坛触发器版块发帖。
// 频道：世界
// 发言人：洪七公|灭绝|逍遥子|玄难|张三丰|岳不群
($time) = (:hour)*3600 + (:minute)*60 + (:second)
[if] (MPT1) != null 
    ($to) = (time) - (MPT1)
    @print MPT1 time out (to)
    [if] (to) >= 3600
        ($MPT1) = null
[if] (MPT2) != null
    ($to) = (time) - (MPT2)
    [if] (to) >= 3600
        ($MPT2) = null
[if] (MPT3) != null
    ($to) = (time) - (MPT3)
    [if] (to) >= 3600
        ($MPT3) = null
@js ($match) = var re=/格杀勿论/;var ta=re.exec('(content)');if(ta!=null){true}else{false}
@js ($mpb) = var re=/(少林|逍遥|峨眉|丐帮|武当|华山)/;var ta=re.exec('(content)');if(ta!=null){ta[0]}else{'null'}
@print (match) (mpb)
[if] (match) == true && (mpb) != null
    @print trigger
    [if] (name)== 洪七公
        ($mpa) = 丐帮
    [if] (name)== 灭绝
        ($mpa) = 峨眉
    [if] (name)== 玄难
        ($mpa) = 少林
    [if] (name)== 张三丰
        ($mpa) = 武当
    [if] (name)== 岳不群
        ($mpa) = 华山
    [if] (name)== 逍遥子
        ($mpa) = 逍遥
    [if] (MPT1) == null
        ($MPA1) = (mpa)
        ($MPB1) = (mpb)
        ($MPT1) = (time)
    [else if] (MPT2) == null
        ($MPA2) = (mpa)
        ($MPB2) = (mpb)
        ($MPT2) = (time)
    [else if] (MPT3) == null
        ($MPA3) = (mpa)
        ($MPB3) = (mpb)
        ($MPT3) = (time)
    @print (mpa) (mpb) (time)
