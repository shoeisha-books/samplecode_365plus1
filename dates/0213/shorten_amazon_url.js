javascript:
navigator.clipboard.writeText(
    location.href.replace(/^(https:\/\/www\.amazon\.co\.jp\/)([^/]+\/)?(dp|gp\/product|exec\/obidos\/asin|o\/ASIN)(\/\w+).*$/, %27$1dp$4%27)
)
.then((_)=>{alert(`短縮したURLをコピーしました。`)})
.catch((e)=>{alert(`URLの短縮に失敗しました。\n${e}`)})
;