//
//  News.swift
//  EarthValley80
//
//  Created by LeeJiSoo on 2022/10/27.
//

import UIKit

struct News {
    let title: String?
    let content: String?
    let category: String?
    let image: UIImage?
}

//TODO: - 더미 데이터, 나중에 지우겠습니다.
var yomojomoViewDummyData: [News] = [
    News(title: "‘마약 ○○’ 상품명 못 쓴다… 표시 금지 추진",
         content: """
                   '중독될 만큼 좋다'는 것을 강조하기 위해 특정 단어 앞에 '마약'을 붙이는 경우가 있어요. 그런데 앞으로는 '마약 김밥' '마약 베개' '마약 떡볶이'와 같이 식품이나 물건 앞에 마약이라는 용어를 사용하기 어려울 것으로 보입니다.

                    최근 식품의약품안전처가 이와 관련한 개정* 안건이 국회에서 발의*돼 논의 중에 있다고 밝혔거든요. 상품명에 마약이라는 단어를 붙이는 행위가 어린이와 청소년에게 부정적인 영향을 미친다는 거예요. 마약을 기초식품이나 제품으로 여길 수 있다는 거죠.

                    현재 시행되고 있는 법은 사행심*을 조장하거나 음란한 표현을 사용해 도덕과 사회윤리를 해치는 상품 표시나 광고를 할 수 없도록 하고 있는데요. 앞으로는 유해 약물이나 유해 물건과 관련된 표현까지 사용할 수 없도록 정하자는 거예요. 우리도 일상생활에서 마약이라는 단어를 함부로 사용하지 않도록 노력해봅시다.
         """, category: "시사", image: ImageLiteral.imgSisa1),
    News(title: "대한민국 최동단 지키는 ‘독도경비대’를 아시나요?",
         content: """
                    독도지킴이 '독도경비대'를 아시나요? 예전에는 '독도의용수비대'라고 불렸답니다. 1945년 광복 이후 일본은 본격적으로 독도에 간섭하기 시작했어요. 심지어 독도가 시마네현에 속한다며, 일본 정부의 허가 없이 독도에 접근하는 것을 금지한다는 팻말을 독도에 설치했습니다. 또한 독도 주변 해역에서 어업 활동을 하는 한국인을 위협하기도 했죠. 참다 못한 울릉도 청년들이 모여 독도의용수비대를 만든 거예요.

                    이들은 독도에 상주하면서 독도에 찾아오는 일본 사람들과 배를 쫓아냈답니다. 1954년 7월 정식으로 독도경비대가 창설되면서 국가 정책적으로 독도 상주 경비를 시작하게 됩니다. 현재 독도경비대는 군인이 아닌 경찰이 맡고 있습니다. 독도는 대한민국 영토이자, 우리나라 시민이 거주하는 지역이므로 경찰이 치안을 담당하고 있답니다.
         """, category: "시사", image: ImageLiteral.imgSisa2),
    News(title: "“어? 초록색 아니네” 노르웨이에 나타난 핑크빛 오로라",
         content: """
                   11월 3일(현지 시각), 노르웨이 하늘에 분홍색으로 빛나는 희귀 오로라가 나타났어요. 이 오로라는 약 2분간 환상적이고 신비로운 모습으로 하늘을 물들였죠. 바로 태양과 지구가 만든 현상이랍니다.

                   오로라는 태양에서 날아온 입자가 지구 자기장과 상호작용해 극지방 대기에서 일어나요. 쉽게 말해 태양 표면의 폭발로 지구 자기장에 균열이 일어나고, 태양 입자가 지구 고층 대기에 있는 산소나 질소와 부딪히며 빛을 내는 거랍니다. 주로 북극·남극과 같은 극지방에서 볼 수 있는데요. 태양에서 방출되는 입자는 지구 북극과 남극에 해당하는 N극과 S극으로 각각 모이게 돼요. 이 근처에서 태양 입자와 지구 대기가 마찰했을 때 오로라가 생기죠. 이번에 나타난 분홍색 오로라는 태양 폭풍이 지구를 평소보다 더 세게 강타했고 이로 인해 태양 입자가 지구 대기에 더 깊게 침투해 발생한 거랍니다.

                   일반적으로 오로라는 산소와 만나며 초록색을 띠는데요. 이번 오로라는 태양 입자가 지구에서 질소가 풍부한 고도 100㎞로 침투해 질소와 더 많이 만나며 분홍색을 띤 거예요. 천문학자들은 "이번처럼 오로라가 완전한 핑크빛을 띠는 것은 드문 현상"이라고 했어요.
         """, category: "과학", image: ImageLiteral.imgSci1),
    News(title: "지구 온난화가 불러온 대재앙… 빙하 속 ‘고대 바이러스’가 깨어난다",
         content: """
                   최근 지구 온난화로 인해 빙하가 녹는 속도가 점점 빨라지고 있어요. 문제는 빙하 속에 갇혀 있던 고대 바이러스가 세상 밖으로 나와 감염병을 일으킬 수 있다는 거예요. 해당 분야의 과학자들은 "빙하가 녹은 물이 많이 유입되는 곳일수록 바이러스에 감염될 위험이 크다"고 분석하고 있죠.

                   '백신을 만들어 예방하면 되잖아?'라고 생각할 수 있지만, 쉽지 않아요. 백신과 약은 지금까지 축척된 바이러스 정보를 바탕으로 실험과 연구 과정을 거쳐 만들어집니다. 하지만 고대 바이러스는 수억 년 또는 훨씬 이전에 만들어진 존재예요. 바이러스에 대한 지식이 전혀 없죠. 발견되는 순간 처음 연구가 시작되는 셈입니다. 약이 만들어져도 이미 많은 사람이 피해를 입은 뒤일 거예요. 고대 바이러스가 어떻게 진화하고 어떤 방식으로 피해를 줄지도 예측하기 어렵습니다. 조금이나마 바이러스에 대한 자료를 얻기 위해 빙하와 영구동토층을 연구하고 있는 거랍니다.

                    사실 고대 바이러스는 이미 여러 번 등장했어요. 2020년 1월 티베트고원의 빙하를 뚫고 표본을 채취하는 과정에서 1만5000년 전에 존재한 것으로 추정되는 '고대 바이러스'를 발견했습니다.

                    2016년에는 시베리아 동토가 녹아 약 75년 전에 죽은 사슴의 사체가 발견됐는데요. 이때 바이러스는 아니지만, 순록에서 나온 탄저균이 현지 유목민을 감염시킨 적도 있습니다.

                    2015년 프랑스의 과학자 장 미셸 클라베리는 시베리아 영구동토층에서 고대 바이러스를 발견했어요. 시베리아에서 온 부드러운 바이러스라는 뜻을 담아 '몰리바이러스 시베리(Molivirus Sibericurm·①)'라는 이름으로 명명됐답니다. 이전에 발견한 '메가 바이러스(MegaVirus·②)' '피토 바이러스(PithoVirus·③)' '판도라 바이러스(PandoraVirus·④)' '미미 바이러스(Mimi Virus)'도 있어요.
         """, category: "과학", image: ImageLiteral.imgSci2),
    News(title: "불황 깊어지면 여성 구두 굽 높아진다",
         content: """
                   세상에는 재밌는 경제 지표가 다앙하게 존재합니다. 전 세계에서 널리 잘 팔리는 패스트푸드의 메뉴 값을 기준으로 삼거나, 사람들의 패션을 통해 경제가 호황인지 불황인지 판단하는 거예요.

                   그중에서 '하이힐 지표'가 있습니다. 경제가 어려워지면 여성 구두 굽이 높아진다는 건데요. 미국의 다국적 기술 및 컨설팅 전문 기업 IBM의 소비재 전문가인 트레버 데이비스가 2011년 발표한 이론이죠. 그는 1920년 당시 굽이 낮은 구두가 유행이었지만, 1930년 대공황, 1973년 석유 파동 시기 대부분의 여성이 높은 하이힐을 신고 다녔다고 설명했어요. 2009년 경기 침체 때는 굽 높이가 최고 18㎝까지 올라갔다고 해요. '경제가 나빠지는데 굽 높이가 무슨 상관이지?' 하는 생각이 들 수 있는데요. 학자들은 "소비자들이 불안한 현실 속 위안을 얻고자 화려한 패션을 추구하는 것"이라고 분석했답니다.

                   실제로 경제가 어려운지 파악하는 '해피밀 지수'도 있답니다. 경제가 어려워지면 햄버거와 함께 나눠 주는 장난감을 줄이거나 일시적으로 장난감을 나눠 주지 않는 현상을 바탕으로 만들어진 지표랍니다. 그 외에도 햄버거로 경제 상황을 파악하는 '빅맥 지수', 경제가 어려워지면 영화 산업이 발전한다는 '버터 팝콘 지수'와 경제 상황에 따라 택배 주문 수가 달라진다는 '골판지 상자 지수' 등도 존재한답니다.
         """, category: "경제", image: ImageLiteral.imgEco1),
    News(title: "세계적 에너지 위기 속… 한국 전력 소비 성적표는?",
         content: """
                   "처음으로 전 세계적인 에너지 위기가 왔다."

                   최근 싱가포르에서 열린 국제 에너지 주간 행사에서 파티 비롤 국제에너지기구(IEA) 사무총장이 한 말이에요. 현재 에너지 위기에 대한 각국의 방안이 마련되고 있습니다. 러시아가 천연가스 공급을 중단하면서 전 세계 에너지 위기가 심화하고 있거든요. 이에 각국은 에너지 사용을 줄이려 노력하고 있어요. 독일 쾰른 대성당, 프랑스 에펠탑, 벨기에 왕궁 등 유명 관광지는 야간 조명 사용량도 줄이고 있죠. 이처럼 에너지 절약을 실현한 유럽연합(EU) 27국의 올해 상반기 전력 소비는 지난해와 비교해 0.51% 줄었어요.

                   반면 우리나라는 8월까지의 전력 소비가 작년보다 4% 늘어났습니다. 또 10년 동안 경제협력개발기구(OECD) 회원국의 에너지 소비가 연평균 0.2% 감소한 반면 우리나라는 연 0.9%씩 증가했죠. 전력 사용량만 봤을 때 한국은 OECD 회원국에서 전체 소비 4위, 1인당 소비 5위를 차지하고 있습니다. 제조업 중심의 경제 규모가 점점 커지고 생활 수준이 좋아지고 있기 때문이에요. 하지만 독일과 일본의 경우, 우리와 비슷한 제조업 위주의 경제 구조이지만 에너지 소비는 감소하고 있습니다. 경제 수준은 계속 높아지고 있지만 에너지 소비를 줄이기 위한 노력 때문인데요.

                   우리나라는 다른 나라보다 전기 요금이 저렴해요. 그래서인지 비효율적으로 전기를 소비하고 에너지를 수입해 무역 적자를 심화하는 악순환을 반복하고 있죠. 원자력 발전을 제외하고 에너지 수입 의존도가 90%를 넘는 우리나라에서 에너지 효율화는 필수적입니다. 앞에 닥친 에너지 위기를 해결하려면 필요 없는 전등을 끄는 것처럼 일상에서부터 에너지 소비에 대한 인식을 바꿀 필요가 있어 보여요.
         """, category: "경제", image: ImageLiteral.imgEco2),
    News(title: "손흥민 부상당한 안와골은 어디?",
         content: """
                   최근 손흥민 선수의 부상 소식이 전해졌어요. 이어 손 선수의 월드컵 출전 여부가 화두에 올랐습니다.

                   토트넘 소속인 손흥민 선수는 11월 1일(현지 시각) 프랑스 마르세유의 스타드 벨로드롬에서 열린 2022-23 유럽축구연맹 챔피언스리그 마르세유와의 경기에서 부상을 당했어요. 상대 팀 수비 어깨에 얼굴을 부딪혀 쓰러진 후 부상으로 교체 아웃됐죠. 이후 병원으로 옮겨져 얼굴 골절 수술을 받았답니다.

                   손흥민 선수가 다친 부위는 머리뼈 속 안구가 들어가는 공간인 안와예요. 안와골절은 안구를 둘러싸고 있는 뼈인 안와골이 부러지는 거죠. 안와골은 다른 뼈와는 달리 표면이 넓고 얇아서 충격에 약해요.

                   축구 경기에서 헤딩을 할 때 해당 눈 쪽으로 축구공을 맞으면 안와골이 부러질 수 있어요. 그래서 축구 선수들에게 자주 발생하는 부상 중 하나입니다. 대표적인 증상은 안구가 심하게 부어오르는 거예요. 손 선수도 부상 당시 안구를 포함해 얼굴 전체가 부어올랐답니다.

                   현재 손 선수는 수술을 잘 마치고 회복 중이랍니다. 손흥민 선수는 축구 국가대표팀 주장으로 20일 개막하는 카타르 월드컵에서 팀을 이끌 예정이었어요. 대한축구협회는 지속적으로 토트넘과 소통하며 손흥민 선수의 상태를 확인하고 있어요. 손흥민 선수의 완쾌와 축구 국가대표팀의 승리를 위해 함께 응원합시다.
         """, category: "문화", image: ImageLiteral.imgMunhwa1),
    News(title: "블랙핑크, 英 이어 美서도 앨범 순위 ‘1위’",
         content: """
                   블랙핑크가 앨범 순위에서 영국에 이어 미국에서도 1위를 차지하는 대(大)기록을 세웠다. 두 나라에서 동시에 이 같은 성적을 낸 여성 그룹은 2001년 비욘세가 팀원이었던 '데스티니스 차일드(Destiny's Child)' 이후 21년 만이다.

                   블랙핑크는 최근 미국 빌보드 메인 앨범 순위인 '빌보드 200'에서 1위를 달성했다. 여성 그룹 앨범이 이 순위에 1위를 기록한 것은 2008년 미국의 여성 그룹 '대니티 케인(Danity Kane)' 이후 14년 만이다. 최근 공개된 빌보드 순위 예고 기사에 따르면, 블랙핑크의 '본 핑크(BORN PINK)'는 약 10만2000장의 앨범 판매량을 기록했다. 해당 앨범은 정규 2집으로 지난 16일 발매됐다. 앞서 블랙핑크는 영국 오피셜 앨범 순위에서도 '본 핑크'로 1위에 올랐다.

                   한편 지난 16일 유튜브에 공개된 타이틀곡 '셧 다운(Shut Down)'의 뮤직비디오 조회 수는 26일 기준 1억2000만 회를 넘어섰다. 이 곡은 19세기에 활약한 이탈리아 천재 바이올린 연주가 파가니니의 '라 캄파넬라(La campanella)'를 배경으로 해 공개 당시 세계의 주목을 받았다.
         """, category: "문화", image: ImageLiteral.imgMunhwa2),
    News(title: "인류의 조상을 찾아서… 우린 과연 어디에서 왔을까?",
         content: """
                   인간은 지구상에서 가장 지능이 높은 존재예요. 동식물을 포함해 다양한 지구 자원을 활용하고, 문명을 발전시켰죠. 인간의 조상은 도대체 어떤 종이길래 이렇게까지 발전할 수 있었을까요? 인류의 조상을 찾아봅시다.

                   인간은 '영장목(Primates) 사람과(Hominidae) 사람속(Homo)'에 해당하는 종입니다. 사람과를 뜻하는 '호미니데'에는 두 발로 서서 걷는 인간과 지금은 멸종한 대형 유인원 일부가 이 분류에 속해요. 인류는 약 500만 년 전에 아프리카 대륙에서 등장한 오스트랄로피테쿠스(Australopithecus)에서 시작했습니다. 약 200만~300만 년 사이, 일부 오스트랄로피테쿠스는 큰 두뇌, 작은 치아, 직립보행, 도구 사용 같은 행동과 신체적 특징을 발달시켜요. 찰스 다윈은 진화론에 대해 이야기하면서 인류의 4가지 특징을 말했는데요. 바로 이때 이 특징이 드러나기 시작한 거죠.

                   오스트랄로피테쿠스 이후엔 호모 하빌리스(Homo habilis)와 호모 에렉투스(Homo erectus)가 연달아 등장해요. 이들은 불을 사용하고 장례를 치르는 등 이전보다 훨씬 진화한 모습을 보이죠. 약 30만 년 전엔 현생 인류의 직계 조상인 호모 사피엔스(Homo sapiens)가 등장합니다. 호모 에렉투스보다 현생인류와 닮았고, 지능이 더 뛰어났습니다. 현생인류는 호모 사피엔스에서 그대로 진화한 것이라고 여겨져 왔죠. 그런데 1856년, 독일 네안데르 계곡에서 호모 에렉투스나 호모 사피엔스와 다른 '네안데르탈인(호모 네안데르탈렌시스·Homo neanderthalensis)' 화석이 발견돼요. 과학자들은 네안데르탈인이 호모 사피엔스가 나타나기 전에 이미 멸종된 종이라고 여겼죠.

                   인류의 조상에 대한 연구가 활발해지면서 다양한 내용이 드러났습니다. 진화생물학자인 스반테 페보 독일 막스플랑크 진화인류학 연구소장은 현생 유럽 인구 중에 네안데르탈인의 유전자가 남아 있다는 것을 밝혀 2022년 노벨 생리의학상을 받았습니다. 호모 사피엔스가 순수한 인류의 조상이었다는 기존 가설을 완전히 뒤집는 연구였죠. 그는 네안데르탈인이 현생인류와 비슷한 언어 능력을 가졌을 가능성도 제기했어요. 최근에는 코로나19에 걸렸을 때 증상이 심한 사람은 네안데르탈인에게서 특정 유전자를 물려받은 것이라고 밝히기도 했죠. 페보 연구소장은 현생인류에게 남아 있는 특징을 분석해 네안데르탈인과 호모 사피엔스 간 혼혈의 가능성을 제기했답니다.

                   2022년 10월 네덜란드 레이던대 연구진은 네안데르탈인이 멸종하기 전까지 호모 사피엔스와 꽤 오랫동안 공존했다는 결과를 발표했는데요. 유럽에서 발견한 고인류 유물을 분석해 네안데르탈인의 멸종 시기를 4만870~4만457년 전으로 추정했죠. 호모 사피엔스가 이 지역에 출현한 시기와 비교하면 두 인류의 조상은 1400~2900년 동안 공존했다는 결론이 나옵니다.
         """, category: "과학", image: UIImage(named: "homo_article")),
    News(title: "공룡왕 ‘티렉스’, 한 가지 種 아니다?",
         content: """
                   티라노사우루스 렉스(Tyrannosaurus rex ·티렉스) 무게가 최대 15t(톤)까지 나갔을 것이라는 연구 결과가 나왔어요. 기존에 알려진 무게보다 70% 무거운 수치예요. 캐나다 자연사 박물관 연구진이 선사시대 짐승의 크기를 예측하는 프로그램을 통해 추정한 값이랍니다.

                   공룡에 대한 다양한 연구가 진행되면서 티라노사우루스에 대한 새로운 내용들이 밝혀지고 있는데요. 특히 티라노사우루스류 공룡 중 가장 덩치가 큰 티렉스에 대한 논의가 활발해요. 올해 2월 국제 학술지 '진화생물학(Evolutionary Biology)'엔 티렉스를 한 가지 종이 아닌 세 가지 종으로 분류해야 한다는 논문이 실렸어요. 티라노사우루스 화석 40개를 재분석해 보니 대퇴골과 치아 구조 등에서 각각 큰 차이를 발견했다고 밝혔죠.

                   연구를 이끈 미국 고생물학자 그레고리 폴은 성별에 따른 차이가 아니라 종 자체가 다른 것이라고 했어요. 티렉스를 포함해 티레지나(T. regina)와 티임페라토(T. imperator)에 대한 가능성을 제시했죠. 하지만 7월, 미국 자연사 박물관 연구진은 티렉스 종을 분리할 만한 증거가 충분하지 않다고 반박했어요. 티렉스는 한 가지 종이며, 다른 수각류 공룡보다 표본 간의 변이가 적다고 했죠.

                   한편, 11월 20일(현지 시각) 아시아 최초 티렉스 화석 경매가 예정일을 열흘 앞두고 전격 취소됐어요. 티렉스 화석 '셴(Shen)'에 가짜 뼈가 섞여 있었기 때문이죠. 과학자들이 분석한 결과, 셴의 진짜 뼈는 79개에 불과했어요. 원래 티렉스의 뼈는 총 300~ 380개인데 말이죠. 아울러 미국 화석 전문 업체 블랙힐스가 "셴의 현재 주인이 이미 2020년에 팔린 티렉스 화석 '스탠'의 뼈를 복제해 붙였다"고 밝혔답니다.
         """, category: "과학", image: UIImage(named: "trex_article")),
    News(title: "우리나라는 저출산 심각한데 세계 인구 ‘80억 명’ 돌파",
         content: """
                   우리나라를 비롯해 여러 나라에서 출산율이 낮아져 인구가 줄고 있다는 소식이 이어지는데요. 이게 어떻게 된 일일까요? 바로 가난한 국가의 출산율이 높아졌기 때문이에요. 유엔은 2050년까지 인도와 필리핀, 에티오피아, 탄자니아 등이 지구 인구 증가에 큰 역할을 할 것이라고 예측했어요. 증가한 인구 중 절반은 이 나라 출신이라고 한 것이지요.

                   11월 15일, 전 세계 인구가 80억 명을 넘어섰어요. 이날 안토니우 구테흐스 유엔(UN) 사무총장은 "인류 다양성과 발전을 축하하기 위한 기회"라고 했습니다. 인구가 늘어난 것은 전 세계적으로 영양 상태와 개인위생에 대한 인식이 좋아지고 의학이 발전한 결과라고 설명했죠.

                   이번에 발표한 세계 인구 수는 1974년 40억 명을 달성한 데 이어 48년 동안 두 배로 뛴 것이랍니다. 유엔은 2080년엔 약 104억 명에 도달할 것이라고 내다봤어요. 또 중국은 올해 약 14억 2600만 명 인구를 기록해 최대 인구국 자리를 지켰지만 심각한 출생률 저하를 겪고 있는데요. 2023년에는 인도에 최대 인구국 지위를 내줄 것으로 전망돼요.

                   존 윌모스 유엔 인구국(UNPD) 국장은 "전 세계 인구가 80억 명에 달한 것은 인류 성공의 징표인 동시에 미래를 향한 위험일 수도 있다"고 했어요. 인구가 계속 늘어나면 대규모 민족 이주와 그로 인한 국가 간 충돌이 불가피하다는 겁니다. 특정 국가에서만 인구가 많이 증가하는 것을 걱정하는 목소리도 있어요. 한 나라에서만 인구가 과하게 늘어나면 해당 지역은 식량과 물, 에너지 등이 부족할 수 있기 때문입니다.
         """, category: "시사", image: UIImage(named: "world_article")),
    News(title: "게임 보며 치킨? 프랜차이즈 ‘카멜레온 생존 전략’",
         content: """
                   '색다른 재미'를 추구하는 소비자들이 많아졌습니다. 익숙한 제품보다 새로운 디자인 또는 기술이 적용된 제품을 찾고 있죠. 이러다 보니 전국에 여러 매장이 있는 프랜차이즈 업계는 소비자의 눈길을 끌기 위해 고군분투 중입니다.

                   전국 모든 매장의 인테리어와 제품 메뉴가 비슷하다 보니 소비자의 '흥미'도가 떨어지고 있거든요. 이에 프랜차이즈 업계는 생존 전략으로 '카멜레온 전략'을 선택하고 있습니다. 카멜레온은 자유자재로 몸의 색을 바꿔 위기를 이겨내는데요. 카멜레온처럼 변화를 통해 기회를 노리는 마케팅 전략입니다.

                   아이스크림 전문 기업 배스킨라빈스는 개성 있는 매장 콘셉트를 정해 그와 어울리는 시그니처 메뉴를 선보이고 있습니다. 여름에만 손님이 몰리는 가게가 아니라, 사계절 내내 손님들이 찾는 매장이 되도록 분위기를 바꿔가고 있죠. 치킨 브랜드 BBQ는 게임을 보며 치킨을 먹을 수 있는 종로 빌지타워점을 열었는데요. 적은 금액으로 창업할 수 있는 배달 전문 매장 'BSK(BBQ Smart Kitchen)'도 선보이고 있답니다.
         """, category: "시사", image: UIImage(named: "baskin_article")),
    News(title: "하나 풀면 나머지 두 개 꼬인다… ‘트릴레마’ 빠진 세계 경제",
         content: """
                   인플레이션(물가 상승) 상황이 이어지면서 세계 경제는 '트릴레마(Trilemma)'에 빠졌어요. 트릴레마는 해결해야 하는 세 가지 문제가 있지만, 한 개를 해결하려고 하면 나머지 두 개가 나빠져 이러지도 저러지도 못하는 상황을 말해요. 경제학에서는 '삼중고' 또는 '세 가지 딜레마'라고도 한답니다.

                   주로 물가 안정, 경기 부양, 국제수지를 중심으로 딜레마가 생기는데요. 계속 오르는 물건 값을 강제로 낮춰 물가를 안정시키면 경제 성장이 어려워집니다. 그렇다고 경기 부양책으로 통화량(돈의 양)을 늘려 경제 순환을 도우면 인플레이션 현상은 더 심해질 수 있어요. 국가의 '용돈 기입장'인 국제수지 역시 경제 상황에 따라 외화 거래량이 천차만별로 달라집니다.

                   국내 외화량이 많아지면 기업의 생산과 국민 소득이 증가해요. 하지만 이에 따라 물가 상승이 나타나게 됩니다. 반면 벌어들이는 외화가 줄어들면 외화를 빌리기 위해 다른 나라에 빚을 지게 되겠죠. 국제수지는 적정 균형을 이루는 것이 바람직합니다. 그래야 사회가 안정될 수 있거든요.

                   하지만 지금도 여전히 경제가 더 나빠지는 것을 막기 위해 많은 양의 외환 보유액이 사용되고 있습니다. 10월 말 우리나라 외환 보유액은 4140억1000만 달러로, 한 달 새 27억6000만 달러가 줄었죠. 걱정할 만큼 외환보유액이 줄어든 것은 아니지만, 외환 보유액이 더 줄어들기 전에 시장 안정 대책 마련이 돼야 할 것 같습니다.
         """, category: "경제", image: UIImage(named: "trilemma_article")),
    News(title: "“10代 소비자 잡자” 젊어진 금융 광고",
         content: """
                   은행, 저축, 예금 등 금융과 관련된 이야기를 들을 때면 어렵고 왠지 어른들과 관련된 이야기처럼 느껴졌는데요. 최근 젊은 세대와 거리감을 줄이기 위해 금융 기업들이 '빅스타 마케팅(Bigstar Marketing)'을 펼치며 노력하고 있습니다.

                   빅스타 마케팅이란 대중적 인지도가 높은 스타를 내세워 기업 이미지 또는 상품을 홍보하는 광고 전략인데요. 단시간에 제품 및 브랜드 인지도를 높일 수 있고 판매 증가 효과를 낼 수 있어요. 해외 진출 및 시장 확보를 위해 활용하기도 한답니다. 예전부터 꾸준히 사용되고 있는 가운데 경기 침체 상황에서 소비자의 시선을 끌고자 빅스타 마케팅 경쟁이 뜨거워지고 있습니다. 기존 매체인 TV나 신문 말고 소셜미디어(SNS)에서도 다양하게 스타 마케팅을 활용하고 있어요.

                   금융 기업에서도 빅스타 마케팅을 적극 활용하고 있어요. 금융권 광고 모델은 '신뢰'를 줄 수 있는 대중적인 이미지의 모델을 주로 선정해 왔는데요. 젊은 20~30대뿐만 아니라 체크카드로 용돈을 관리하는 10대 청소년 소비자층을 확대하기 위해 인기 아이돌 그룹을 모델로 발탁하고 있습니다. 금융가에서 10~20대 등 일부 세대에서 인기 있는 아이돌 그룹을 모델로 내세운 것은 정말 이례적인 일이랍니다.

                   10월 11일 신한은행은 오는 20일 공개되는 모바일 뱅킹 앱 '뉴 쏠(New SOL)' 모델로 신인 걸그룹 '뉴진스'를 선정했다고 전했습니다. 모두에게 사랑받는 시대 아이콘이 되겠다는 뉴진스 이미지가 쉽고 빠르게 이용할 수 있는 금융 아이콘인 쏠 앱 이미지와 부합하다고 설명했어요. 앞서 우리은행은 모바일 뱅킹 모델로 가수 '아이유'를 앞세워 '월 활성 이용자 수'가 급증하는 등 빅스타 효과를 확실하게 보고 있습니다. 아이돌 그룹 '에스파'가 모델로 활동하는 KB국민은행 역시 젊은 층 공략에 집중하고 있답니다.
         """, category: "경제", image: UIImage(named: "advertise_article")),
    News(title: "기기마다 다른 충전기 살 필요 없어지겠네",
         content: """
                  전자기기 배터리가 부족할 때 충전 단자가 맞지 않아 난감했던 적이 있을 거예요. 무선 이어폰 충전 단자와 휴대전화의 단자가 달라 충전기를 두 개나 사야 하는 경우도 있죠. 대표적으로 삼성과 애플에서 출시된 스마트폰 충전단자가 달라요.

                  10월 4일(현지 시각) 유럽연합(EU) 의회가 모든 휴대전화와 태블릿, 카메라 충전 단자를 하나로 표준화한다는 법안을 통과시켰어요. 2024년까지 'USB-C 타입'으로 통일한다는 거죠. USB-C 타입은 안드로이드용 기기 충전기에 적용되고 있어요. 모바일 충전기 표준화법이 유럽 이사회 승인을 받고, 실효성을 갖는다면 각국의 제조사들은 USB-C타입 단자로 바꿔야 합니다. 고유 충전 단자를 사용하는 애플도 포함되죠.

                  의회는 이번 결정에 대해 전자기기 관련 폐기물을 줄이면서 소비자들의 지속 가능한 선택권을 보장하기 위한 것이라고 설명했어요. 2026년부터는 의무화 적용 대상을 노트북으로도 확대할 계획이라고 밝혔죠. EU 집행위원회 마르그레테 베스타게르 부위원장은 "각 기기마다 다른 충전기를 살 필요가 없어 소비자들이 1년에 2억5000만 유로(약 3500억 원)를 아낄 수 있다"고 전했답니다.
         """, category: "시사", image: UIImage(named: "usb_article")),
    News(title: "로봇 개발, ‘이족보행’에 몰두하는 까닭?",
         content: """
                  세계에서 가장 빨리 달리는 이족보행 로봇이 등장했어요. 미국 오리건 주립대 연구진이 만든 '캐시'가 그 주인공입니다. 캐시는 두 발로 100m를 24.73초에 뛰어 기네스북에 올랐지요. 안정적인 자세로 중심을 잡으며 빠르게 달렸답니다.

                  전문가들은 앞으로 배달·배송 분야와 같은 다양한 실생활에서 이족보행 로봇이 활약할 날이 머지않았다고 전망해요. 앞서 알려진 이족보행 로봇으로는 미국 기업 보스턴 다이내믹스에서 제작한 '아틀라스', 일본의 '아시모'가 있는데요. 국내에는 '휴보' '알버트 휴보'가 있답니다.

                  인류는 왜 이족보행 로봇에 주목하고 있을까요? 가장 큰 이유는 해당 로봇을 활용해 사람과 연관된 일을 쉽게 수행하기 위해서예요. 예컨대 로봇이 학교나 회사, 도서관, 수퍼마켓과 같은 공간에서 원활하게 작업하고 움직이기 위해선 두 발로 걷는 인간과 비슷해야 편리하다는 거죠. 또 이족보행 로봇은 다리가 많은 로봇과 비교했을 때 순발력과 방향 전환 능력이 더 뛰어나요. 한마디로 가장 에너지 효율이 높답니다. 사람처럼 안정적으로 서 있는 것이 가능해 땅이 울퉁불퉁해도 잘 걸을 수 있어요. 움직이는 다리 각도를 조절하면 사다리를 이용하거나 계단을 오르내릴 수도 있죠.

                  물론 단점도 있어요. 몸체가 구조적으로 복잡해 제작 과정이 다소 어렵다는 거예요. 또 이족보행을 하기 위해선 균형을 잘 잡아야 하는데요. 이를 위해선 인간 뇌와 비슷할 정도로 뛰어난 인공지능(AI)과 민감한 센서가 필요하답니다. 이런 이유로 인해 가격도 비싸요. 약 50㎝ 크기의 이족 로봇을 제작하려면 최대 2000만 원이 들기도 하죠. 규모가 커질수록 비용은 더 든답니다.

                  하지만 세계적으로 많은 대학과 연구소가 이족보행 로봇 개발에 집중하고 있는데요. 정리하면 인간과 유사한 로봇이 사람들에게 인기도 좋고, 가장 실용적으로 사용할 수 있어서예요. 앞으로 인간의 편리한 생활을 위해 또 어떤 로봇이 탄생할지 기대됩니다.
         """, category: "과학", image: UIImage(named: "robot_article")),
    News(title: "자녀 同意<동의> 받고 부모가 계정 관리… 인스타그램, ‘가족 센터’ 기능 만들어",
         content: """
                   현대사회에서 빼놓을 수 없는 '소셜미디어(SNS)'. 세상의 소식을 빠르게 알려주고 타인(他人)과의 소통을 돕는 도구죠. 한국청소년정책연구원이 작년 전국 학생(중 1~고 3) 2000여 명을 대상으로 실시한 설문 조사에서 하루 평균 3시간 동안 스마트폰을 사용한다는 응답자가 61.5%에 달했는데요. 주로 유튜브나 각종 SNS 등을 이용하며 시간을 보내는 것으로 조사됐습니다.

                   SNS 앱 중 청소년에게 가장 인기가 많은 것으로 '틱톡'이 꼽혀요. 미국 경제 매체 블룸버그에 따르면, 틱톡의 올해 매출액은 120억 달러(약 17조2000억 원)에 달할 것으로 예상됩니다. 매출 규모에선 인스타그램과 페이스북의 모회사(母會社)인 '메타'가 훨씬 커요. 이 회사의 작년 매출액은 1179억2900만 달러(약 170조 원)였죠. 이처럼 첨단 기술을 바탕으로 플랫폼 사업을 하는 '빅테크(Big Tech) 기업'의 경제적 영향력은 계속 증가하고 있어요. 하지만 SNS를 통해 유통되는 비정상적 콘텐츠로 인해 이용자가 정신적인 피해를 입거나, '중독'에 빠지는 등 부정적인 문제도 발생하고 있답니다.

                   이에 인스타그램과 틱톡이 '청소년 이용자'의 정신 건강을 지키기 위한 새로운 방안을 최근 발표했어요. 먼저, 인스타그램은 청소년의 긍정적인 온라인 습관 형성을 돕기 위해 '가족 센터' 기능을 만들었어요. 보호자가 청소년에게 '관리 감독 계정' 초대를 보내 이를 수락하면, 보호자 계정에서 청소년의 인스타그램 시간을 확인하거나 일일 시간 제한을 설정할 수 있답니다.

                   틱톡은 지난 4월부터 6월까지 업로드된 동영상 약 1억1300만 개를 삭제했다고 발표했는데요. 지워진 동영상 중 가장 큰 비중을 차지한 것은 '미성년자 안전'에 위반된 영상이었어요. 이 밖에도 불법행위를 담았거나 폭력성이 드러나는 영상을 삭제했다고 전했습니다.

                   한편 정신건강의학 전문의 오은영 박사는 지난 28일 기자간담회에서 "부모가 SNS 유해(有害) 콘텐츠를 우려하는 것은 당연하지만 자녀가 이를 사용할 수 없도록 무조건 금지하는 건 옳지 않다"며 "아이가 좋아하는 관심사를 발전시키고 친구와 교류하며 성장할 수 있는 수단으로 SNS를 사용하도록 보호자가 지도하는 것이 중요하다"고 강조했답니다.
         """, category: "시사", image: UIImage(named: "insta_article")),
    News(title: "바다 건너간 ‘K과자’엔 특별한 이름 있다고?",
         content: """
                   'K과자'에 대한 세계인의 관심이 높아지고 있습니다. K드라마, K영화 등에 자주 등장하면서 외국인의 호기심을 자극한 것으로 보입니다. 최근 농림축산식품부와 해양수산부는 "2022년 상반기 농수산 식품 수출액이 역대(歷代) 최고치를 경신했다"고 밝혔습니다. 지난해 같은 기간보다 14.6% 증가한 62억1000만 달러(약 8조 6344억 원)를 달성했죠. 그중 '과자류'는 3억1460만 달러(약 4375억4568만 원)를 기록했습니다.

                   국내 제과업계는 K과자를 향한 외국인의 관심을 지속하기 위해 '이색 네이밍(Naming) 전략'을 펼치고 있습니다. 현지 분위기에 맞는 이름을 기존 제품에 새로 붙여 소비자와의 '친밀감'을 바탕으로 판매량을 늘리고 있답니다.

                   해외 매출 비율이 60％가 넘는 '오리온'의 경우, 현지식 이름으로 바꿔 수출하는 제품이 다양합니다. 소셜미디어(SNS)를 통해 중국과 미국 등 해외에서 큰 인기를 끈 '꼬북칩'이 대표적인 상품이죠. 이 과자는 중국에 '룰루랄라'라는 의미인 '랑리거랑(浪里個浪)'이라는 이름으로 수출됩니다. 꼬북칩을 먹을 때 절로 흥이 나는 식감을 표현한 이름이에요. 미국·호주에서는 이름만 들어도 제품의 모양을 떠올릴 수 있는 '터틀칩스(TURTLE CHIPS)'라는 상품명으로 판매된답니다. 오리온이 만드는 '젤리'도 해외에서 큰 인기를 끌고 있는데요. 지렁이 모양의 '왕꿈틀이'는 중국에서 '뉴뉴따왕(扭扭大王)'으로 팔려요. 몸이 비틀어진 대왕이라는 뜻이죠. 과일 모양과 맛을 가진 '마이구미'는 '궈즈궈신(果滋果心)'이라는 이름으로 판매되고 있답니다.

                   롯데제과는 지난달 처음으로 우유 아이스크림 '설레임'을 현지식 이름 '시퍼블스(Sippables)'로 바꿔 인도에 선보였습니다. 영어 단어 'Sip(홀짝이다)'과 'Able(할 수 있는)'의 파생어로, 설레임을 홀짝거리며 먹는 모습을 표현한 이름이죠. '설레임'을 단순히 영어로 번역할 경우 인도인에게 제품을 알리기 힘들 것 같다는 판단에 따라 제품명을 바꿨다고 해요.

                   이처럼 현지 정서를 고려한 네이밍 전략으로 국내 제과업계의 해외 판매 실적이 늘고 있는데요. 앞으로 또 어떤 제품이 얼마나 재밌는 이름으로 수출될지 기대됩니다.
         """, category: "시사", image: UIImage(named: "kfood_article")),
    News(title: "산업 전반 영향 주는 油價<유가>, 오를 때마다 세계 경제 ‘휘청’",
         content: """
                   세계 주요 산유국(産油國)이 오는 10월부터 하루 원유(原油) 생산량을 이달보다 10만 배럴 줄인다고 최근 밝혔어요. 이에 기름값이 다시 뛸 것이라는 전망이 나오고 있습니다.

                   앞서 국제 유가(油價)는 러시아의 우크라이나 침공 이후 크게 올랐어요. 러시아가 유럽에 가스 공급을 중단하면서 에너지 대란(大亂) 조짐까지 보였죠. 국가 경제에서 수출입이 차지하는 비율이 큰 우리나라는 기름값의 영향을 많이 받아요. 유가가 오르면 국내 물가(物價)도 상승하죠.

                   지난 7일 한국석유공사가 운영하는 유가 정보 사이트 오피넷에 따르면, 휘발유 가격은 1700원대를 기록하고 있습니다. 이런 상황에서 국제 유가가 또다시 상승한다면 국내 경제는 적지 않은 타격을 받을 거예요. 원자재, 에너지 공급 등에 차질이 생겨 기업들이 상품을 생산하기 어려워질 수도 있어요. 수요는 그대로인데 생산량이 줄면 가격은 올라가죠. 이는 산업 전체를 위축하는 결과를 초래해요.

                   경제에 지대한 영향을 주는 유가를 이해하려면 '원유'부터 알아야 해요. 먼저 원유는 땅속에서 뽑아낸, 가공하지 않은 기름을 말해요. 석유(石油)는 원유와 석유제품을 통칭합니다. 원유를 가공해 만든 공산품을 '석유제품'이라고 해요. 석유제품은 원유를 가열한 후, 끓는점이 낮은 것부터 높은 것 순으로 분류되죠.

                   끓는점이 가장 낮은 'LPG'는 가정 난방용으로 사용됩니다. 다음으로 30~120도에서 나오는 '휘발유'는 자동차나 항공기 연료로 쓰여요. '등유'는 휘발유에 이어 150~280도 사이에서 생산되는 제품인데요. 도시가스가 공급되지 않는 농어촌이나 지방 소도시 등에서 실내 난방용으로 많이 활용됩니다. 디젤 차량의 연료인 '경유'는 230~350도에서 생산되죠. 이 외에도 배의 연료로 쓰이는 '중유', 화학약품의 원료인 '나프타' 등이 있답니다.

                   물품을 배송하는 택배 차량, 전 세계에서 수출입되는 상품을 유통하는 선박, 물건을 제조하는 공장, 공장 내부 냉난방 시설 등은 모두 석유제품으로 움직여요. 이처럼 유가의 변동은 생산·유통 등 경제 전반에 영향을 끼치죠. 유가가 상승한다면 경제 상황은 나빠질 수밖에 없어요. 전문가들은 "현재 국제 유가가 불안정하다"며 "전 세계에 인플레이션이 계속되는 상황에서 유가가 다시 오르면 물가 상승이 상당 기간 지속될 것"이라며 우려의 목소리를 내고 있어요.

                   한편, 호주 멜버른대학은 '공기로 수소 연료를 만들 수 있는 기술'을 최근 공개했어요. 공기에서 수소와 산소를 분해하는 원리인데요. 이를 통해 얻은 수소가 기계 장치의 동력이 된다는 거죠. 연구진은 "친환경적이고, 어디에나 있는 공기로 에너지를 생산할 수 있다는 장점이 있다"고 전했답니다.
         """, category: "경제", image: UIImage(named: "oilprice_article")),
    News(title: "50년 후 한국 ‘가장 늙은 나라’ 될 수도 있다?",
         content: """
                   지난해 우리나라 합계출산율은 0.81명입니다. 이는 여성 한 명이 가임 기간(15~49세) 한 명도 낳지 않는다는 얘기입니다. 일각에서는 50년 뒤 '전 세계에서 가장 늙은 나라'가 될 것이라는 우려도 나오고 있어요.

                   우리나라는 2006년부터 지난해까지 이 문제를 해결하기 위해 380조 원을 투입했어요. 하지만 출산율은 오히려 낮아졌습니다. 전문가들은 "아이를 잘 키울 수 있는 환경을 위해 저출산 대책을 재정비해야 한다"며 "장기적인 대책이 필요한 상황"이라고 했습니다.

                   그렇다면 저출산 문제를 갖고 있는 다른 나라는 이를 어떻게 극복했을까요. 일본은 3~5세 자녀의 보육과 교육을 전면 무상으로 지원해왔습니다. 저소득층 가정의 0~16세 자녀에겐 '특별 아동수당'도 지급했죠. 프랑스와 독일은 수입이 없는 주부에게 부모 수당을 지급했습니다. 출산율이 낮았던 세 나라는 2018년 기준 합계출산율 1.4~1.8명을 기록했답니다. 우리나라도 위기를 기회 삼아, 실용적인 정책을 통해 출산율을 높일 수 있으면 좋겠습니다.
         """, category: "시사", image: UIImage(named: "baby_article")),
    News(title: "라벨 없애고 종이로 包裝<포장>하고 선물 세트에 부는 ‘친환경 바람’",
         content: """
                    다가오는 추석을 맞아 식품업계가 명절 선물 세트를 잇따라 선보이고 있어요. 올해에는 특히 '친(親)환경' 포장 선물 세트가 눈길을 끌고 있습니다. 연휴마다 쓰레기가 많이 나오는 데다 환경을 지키려는 업계의 노력이 반영된 겁니다. 플라스틱 용기를 재생(再生) 종이로 교체하고, 재활용이 가능한 종이 가방으로 포장했죠.

                    CJ제일제당은 100% 종이 포장지로 만든 '세이브 어스 초이스(Save Earth Choice)' 선물 세트를 선보였어요. 내부 받침과 쇼핑백 모두 다시 사용할 수 있는 종이로 만들었죠. '올 페이퍼 패키지(All Paper Package)'는 캔 겉면에 비닐 라벨을 제거한 '스팸 라벨프리 선물 세트'와 플라스틱 받침을 사용하지 않은 'CJ 명가김 선물 세트'로 구성됐답니다. CJ제일제당은 "새로운 포장 기술로 300여t(톤)에 달하는 플라스틱 사용량을 줄였다"고 설명했어요.

                    대상 청정원도 친환경 패키지를 적용한 '자연스러운 선물 세트'를 출시했어요. 기존의 부직포 소재를 전부 종이로 대체해 '플라스틱 제로 쇼핑백'을 만들었답니다. 모든 포장재가 종이로 이뤄져 있어, 분리수거할 때도 편리하도록 했죠. 대상 측은 이번 친환경 패키지를 통해 플라스틱 사용량 약 470t을 감축할 수 있을 것으로 전망했어요.

                    갤러리아백화점은 '노 플라스틱 패키지(No Plastic Package)' 선물 세트를 내놨어요. 플라스틱 포장지를 일절 사용하지 않고 종이로 대체한 친환경 포장 세트인데요. 머스크메론 세트, 국산 망고 세트, 유기농 양곡 세트 등을 대표 품목으로 조합했어요.

                    신세계백화점은 올해 처음 종이로 만든 과일 트레이와 칸막이를 적용했는데요. 백화점은 오는 22일부터 매장에서 판매될 추석 선물의 친환경 포장 비율도 높일 예정이라고 해요. 무(無)코팅 재생 용지에 콩기름으로 인쇄한 과일 선물 세트 박스는 기존 50%에서 80%로 확대할 계획입니다. 축산과 수산 제품을 담는 보랭백의 범위도 75%에서 전 상품 대상으로 늘렸는데요. 보랭백은 폐(廢)페트병과 폐의류 등을 재활용해 만들었답니다.
         """, category: "시사", image: UIImage(named: "eco_article"))
]
