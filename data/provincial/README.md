# 省级数据（L2）

十个省级单元，一省一个文件夹。合计独立 A/B 政策 3,090 份（A 级 685、B 级 2,405）。全部为智能体初判，**人工核验 0 条**，没有一个单元验收。各省数量差别主要来自检索覆盖，不能当作各省政策量的比较。

| 省份 | 文件夹 | 快照 | 独立政策 | A / B | 来源记录正文 | 现状说明 | 原件 |
|---|---|---|---:|---|---:|---|---|
| 浙江省 | [zhejiang/](zhejiang/) | 2026-11-16 第二轮 | 397 | 60 / 337 | 559 | [PDF](../../docs/reports/zhejiang_report_20261116.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-zhejiang-20261116) |
| 上海市 | [shanghai/](shanghai/) | 2026-11-23 | 278 | 66 / 212 | 281 | [PDF](../../docs/reports/shanghai_report_20261123.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-shanghai-20261123) |
| 江苏省 | [jiangsu/](jiangsu/) | 2026-11-16 第二轮 | 199 | 63 / 136 | 207 | [PDF](../../docs/reports/jiangsu_report_20261116.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-jiangsu-20261116) |
| 安徽省 | [anhui/](anhui/) | 2026-11-23 | 320 | 57 / 263 | 342 | [PDF](../../docs/reports/anhui_report_20261123.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-anhui-20261123) |
| 福建省 | [fujian/](fujian/) | 2026-11-23 第二轮 | 471 | 109 / 362 | 665 | [PDF](../../docs/reports/fujian_report_20261123.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-fujian-20261123-r2) |
| 江西省 | [jiangxi/](jiangxi/) | 2026-11-24 第二轮 | 312 | 53 / 259 | 479 | [PDF](../../docs/reports/jiangxi_report_20261124.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-jiangxi-20261124) |
| 山东省 | [shandong/](shandong/) | 2026-11-16 第二轮 | 254 | 60 / 194 | 299 | [PDF](../../docs/reports/shandong_report_20261116.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-shandong-20261123) |
| 湖南省 | [hunan/](hunan/) | 2026-11-16 | 370 | 70 / 300 | 370 | [PDF](../../docs/reports/hunan_report_20261116.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-hunan-20261123) |
| 广东省 | [guangdong/](guangdong/) | 2026-11-26 | 323 | 108 / 215 | 447 | [PDF](../../docs/reports/guangdong_report_20261126.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-guangdong-20261126) |
| 陕西省 | [shaanxi/](shaanxi/) | 2026-11-24 | 166 | 39 / 127 | 223 | [PDF](../../docs/reports/shaanxi_report_20261125.pdf) | [Release](https://github.com/XuYiheng-code/AI--policy-in-China/releases/tag/data-shaanxi-20261125) |

## 每个文件夹里有什么

| 文件 | 内容 |
|---|---|
| `policies.csv` | 独立政策清单，一行一份，研究分析用这个 |
| `source_records.csv` | 全部来源记录（同一文件在不同网站各一条），含 `policy_id` 对照 |
| `texts/{doc_id}.txt` | 每条来源记录的正文 |
| `route_status.csv` | R1—R7 检索状态与卡点 |
| `search_log.csv` | 检索日志（山东暂缺） |
| `agency_coverage.csv` | 机关覆盖 |
| `qc_*.csv` | 去重、日期补充、相似文件对等核查结果；江西的 `qc_unregistered_candidates.csv` 是第二轮发现、尚未登记的 A/B 候选及查重分流 |

浙江、江苏另有 B 级复核、待裁决、影子清单、待人工清单等文件，说明见 [`data/README.md`](../README.md)。原件（官网 HTML、PDF、附件）在各省 Release 的 zip 里，按 `{省}/originals/{doc_id}/` 存放。
