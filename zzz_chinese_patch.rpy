# Dark Nights 1.1 中文汉化补丁
# - 启动时默认使用中文语言包
# - 汉化角色名（说话人标签）
# - Shift+L 可随时切换 中/英 显示

define config.language = "chinese"

init 1000 python:

    _cn_names = {
        "Jace": "杰斯",
        "Blace": "布雷斯",
        "Chain": "切恩",
        "Zeikun": "泽昆",
        "Roya": "罗亚",
        "Lioji": "洛吉",
        "Kaichi": "海一",
        "Tenshi": "天司",
        "Mr Shinen": "深渊先生",
        "Junoru": "朱诺鲁",
        "Sachiro": "幸路",
        "Ikuya": "育也",
        "Rasumi": "拉苏米",
        "Yokishi": "夜岸",
        "Yuudai": "雄大",
        "Teacher": "老师",
        "Me": "我",
        "Father": "父亲",
        "Mother": "母亲",
        "Man": "男人",
        "Woman": "女人",
        "Girl": "女孩",
        "Boy": "男孩",
    }

    for _k in dir(store):
        try:
            _v = getattr(store, _k)
        except Exception:
            continue
        if isinstance(_v, renpy.character.ADVCharacter):
            try:
                if _v.name in _cn_names:
                    _v.name = _cn_names[_v.name]
            except Exception:
                pass

    def _cn_toggle_language():
        if _preferences.language == "chinese":
            renpy.change_language(None)
        else:
            renpy.change_language("chinese")

    config.keymap["cn_toggle_language"] = ["shift_K_l"]
    config.underlay.append(renpy.display.behavior.Keymap(cn_toggle_language=_cn_toggle_language))
