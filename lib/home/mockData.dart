
class Article {
  String headUrl;
  String user;
  String action;
  String time;
  String title;
  String synopsis;
  String imgUrl;
  int agreeNum;
  int commentNum;

  Article(this.headUrl, this.user, this.action, this.time, this.title, this.synopsis, this.agreeNum, this.commentNum, {this.imgUrl});
}

List<Article> articleList = [
  new Article(
      "https://pic3.zhimg.com/v2-f68c277743a6fa652f09b396298687b7_im.jpg",
      "learner",
      "赞同了回答",
      "2小时前",
      "在三体中，罗辑为什么会把控制权交给程心，难道他没有推测过后果吗？",
      "因为罗辑遵守了人类伦理。这个伦理大概就叫民主。 大刘其实是个典型的精英主义者，在他笔下...",
      32, 10,
      imgUrl: "https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg"
  ),
  new Article(
    "https://pic3.zhimg.com/v2-f68c277743a6fa652f09b396298687b7_im.jpg",
    "learner",
    "回答了问题",
    "5小时前",
    "我的手机系统是安卓。无意间发现自己的屏幕被人监控，请问怎样才能彻底摆脱被监控的处境呢？",
    "检查一下你手机里是不是被人装了什么软件，把你不认识的非系统软件删掉。不会删就去找手机店里的小哥，为什么这么多人...",
    38, 13,
  ),
  new Article(
      "https://pic3.zhimg.com/v2-f68c277743a6fa652f09b396298687b7_im.jpg",
      "learner",
      "回答了问题",
      "7小时前",
      "如何评价2018年安徽省程序设计竞赛？",
      "带着政治任务和压力去打了比赛，所幸最后被高中生抬了一手。榜可以见另外某回答。大概经历就是前...",
      38, 13,
      imgUrl: "https://pic4.zhimg.com/v2-a7493d69f0d8f849c6345f8f693454f3_200x112.jpg"
  ),
  new Article(
      "https://pic3.zhimg.com/v2-f68c277743a6fa652f09b396298687b7_im.jpg",
      "learner",
      "回答了问题",
      "7小时前",
      "我如果往猫砂里拉屎，猫会帮我埋起来吗？",
      "虽然没试过在猫砂盆里拉屎猫会不会帮我埋，我觉得我家猫大概是会帮我埋掉的，毕竟要知道，人屎在猫屎面前，简直就是大巫见小巫，不值一提! 因为猫屎嗨一大泡不说，那味道甚至可以臭到你怀疑人生!! 我家有只...",
      4800, 13,
      imgUrl: "https://pic4.zhimg.com/50/v2-726fc8e69ac8731306279f7920821f40_400x224.jpg"
  ),
  new Article(
    "https://pic3.zhimg.com/v2-f68c277743a6fa652f09b396298687b7_im.jpg",
    "learner",
    "回答了问题",
    "5小时前",
    "《哈利·波特》中最惊艳你的一处设定是什么？",
    "我来说一个，就是特里劳妮。 不过我不是像这个答案夸她神，（刚发现还不止一个答案这样了，你们至于吗）恰恰相反，我是要说作者讽刺的就是这种装神弄鬼再硬往上靠的现象。 首先这个答案有多处事实性错误。 这个...",
    38, 13,
  ),
  new Article(
    "https://pic3.zhimg.com/v2-f68c277743a6fa652f09b396298687b7_im.jpg",
    "learner",
    "回答了问题",
    "5小时前",
    "自学画画好几年了，请问接下来该如何进一步练习和提高画面完成度？这个水平能够和美院毕业的同学竞争吗？",
    "泻药 首先，比起最近经常邀请我的各种“画成这样能当插画师吗”，但画的和一坨屎一样且自我感觉良好的人来说，题主有一个非常大的优点。 那就是你意识到了，学医也好，画画也好，都是一样辛苦的，画画并不轻",
    38, 13,
    imgUrl: 'https://pic2.zhimg.com/50/v2-711bd1539a630a9abb99a02275f93f93_hd.jpg'
  )
];
class Question {
  String title;
  int sort;
  
}
List<Question> questionList = [

];