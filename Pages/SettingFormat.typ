#let settingFormat(body) = {

set text(
  font: ("Consolas","Noto Sans KR"),
  fill:white
)

// 라인 세팅
set line(stroke: rgb(100,100,100))

// 종이 세팅
set page(
  fill: rgb(25,25,25),
  paper: "a4",
  footer: context {
    if counter(page).get().first() > 1 {
      align(right, counter(page).display("1페이지"))
    }
  }
)

// 단락 세팅
set par(
  justify: true,
  first-line-indent: 5pt
)

// 캡션 세팅
show figure.where(kind: image): set figure(supplement: [이미지])
show figure.where(kind: table): set figure(supplement: [표])

// body 표시
body
}

// subTitle (CustomElement)
#let subTitle(body) = {
  set text(size: 7pt)
  body
}

// 내 이름 적기도 귀찮은 나를 위한
#let myName() = {
  [김준석 aka.NeDuck56]
}

// 제목 만들기 귀찮을 때
#let Title(title,date_f,date_l) = {
  align(horizon + center)[
    #line(length: 70%)

    #heading(outlined: false)[#title]
    \
    #myName()
    #line(length: 70%)
  ]
  align(bottom + center)[
    최초 작성일 : #date_f.display()\
    문서 업데이트 : #date_l.display()
  ]
}

// 목차까지가 템플릿임
#let OutLine = [
  #counter(page).update(1)
  
  #heading(outlined: false)[목차] 
  #line(length: 100%)

  #outline(
    title: none,
  )
]

#let UpdatePage = [
  #pagebreak()
  = 문서 업데이트
  #subTitle[문서 업데이트 내용]
  #line(length: 100%)
]
