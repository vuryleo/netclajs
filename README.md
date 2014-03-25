# NetClajs

NetClajs is aimed to wrap [web learning of Tsinghua University](http://learn.cic.tsinghua.edu.cn/) in well formed API.

## Features

* Auto cookie management and re-login.
* Auto detect current semester

## Usage

### Create a Instance
`NetClajs` is a class that can create an `Object` for each account.
```coffeescript
NetClajs = require 'netclajs'

config = 
  username: 'johndoe'
  password: 'helloworld'

netclajs = new NetClajs config
netclajs.login (err) ->
```

### Get Course List
`NetClajs.prototype.courselist` will fetch the course list of that user.

```coffeescript
netclajs.courselist (err, list) ->
  console.log list
```

The list is an array that contains several courses, which looks like
```json
{
  "course_id": "2013-2014-2-00050021-90",
  "course_no": "00050021",
  "course_seq": "90",
  "course_name": "工业生态学",
  "teacherInfo": {
    "id": "2001990195",
    "name": "石磊",
    "email": "slone@mail.tsinghua.edu.cn",
    "phone": "62796955",
    "address": null,
    "zipCode": null,
    "gender": "男",
    "position": null,
    "title": "副研究员",
    "status": "在职",
    "note": "石磊，清华大学环境学院副研究员，国家环境保护生态工业重点实验室副主任，清华大学绿色跨越研究中心副主任。\r\n研究兴趣包括：1）工业生态系统复杂性，解析区域产业共生体系、环保产业和化工产业的复杂性，服务于生态工业园区规划和产业技术政策制定；2）物质代谢，解析特定元素、物质和社会经济系统的物质代谢过程，服务于循环经济规划；3）生态创新。\r\n中国生态经济学会工业生态经济与技术专业委员会常务理事；国际工业生态学学会物质流分会委员；第四届工业生态学国际大会共同主席（多伦多，2007）；第三届工业生态学亚太会议共同主席（北京，2012）；《生态学报》编委（2013-）\r\n\r\n重点项目包括：\r\n1. 基于复杂网络的工业生态化演进机制解析与系统模拟（41071352），国家自然科学基金，2011-2013\r\n2. 基于复杂网络的产业共生交叉研究平台及产业生态系统数据库构建，清华大学学科交叉专项基金，2012-2015\r\n3. 生态工业园区规划：衢州化工园区（2000）；福州经济技术开发区（2005，2013）；河南安阳高新区（2006）；珠海高栏港经济区（2010）；江苏宜兴经济开发区（2012）；西安高新区产业共生规划（2013）\r\n4. 循环经济发展规划：贵阳市（2002）；江苏省（2003）；义马市（2004）；巩义市（2005）；辽宁省（2006）；邯郸市（2009）；宁夏自治区（2010）\r\n5. 节能环保产业发展规划：中国宜兴环保科技工业园（2011）；江苏海安（2012）；安徽芜湖（2012）\r\n",
    "departmentId": "005"
  },
  "codeDepartmentInfo": {
    "dwnm": "005",
    "dwmc": "环境学院",
    "dwjc": "环境学院"
  },
  "semesterInfo": {
    "id": "2013-2014-2",
    "semesterName": "2013-2014-春季学期",
    "startDate": "2014-02-24",
    "endDate": "2014-06-15"
  },
  "detail_c": "   “工业生态系统与生物生态系统概念之间的类比不一定完美，但如果工业体系模仿生物界的运行规则，人类将受益无穷”。师法自然，是工业生态化的现实需要，也是工业生态学思想的由来。本课程主要讲述工业发展及其生态后果、工业发展与生态系统互动模式以及指导工业系统演进所需要的理论框架、方法工具和政策体系等。课程包括大量的生态工业园区和产业案例。本课程旨在有限的时间介绍工业生态学这门前沿学科的全貌，为可持续发展提供一个概念性的整体框架和系统思路。",
  "detail_e": null,
  "credit": 1,
  "course_time": 16,
  "exam_type": "考查，分为优秀（给分数）、通过与不通过三档；\r\n课程论文（两个）：80％\r\n课堂表现：20％\r\n",
  "course_type": "全校性选修课",
  "teaching_type": null,
  "ref_book_c": "自编阅读材料（电子版和纸版）\r\n主要参考书：\r\n1. 《产业生态学》（第二版）Graedel和Allenby主编，施涵翻译\r\n2. 《清洁生产导论》张天柱，石磊，贾小平主编",
  "ref_book_e": null,
  "text_book": null,
  "courseoverview": null,
  "teachingoutline": null,
  "teachingteam": null,
  "teachingcalendar": null,
  "thumbnail": null,
  "tBrowseNum": 1,
  "sBrowseNum": 21,
  "courseSource": "0",
  "examinationCritique": null,
  "teacherName": "石磊"
}
```

