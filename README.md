# 한강캠핑
**[:link: ppt](https://pitch.com/public/570ab20d-f0ad-4e01-8a49-387e29b09c81)** 

![title](https://user-images.githubusercontent.com/96432168/172875800-71b9aae1-ff1f-4d33-bfef-92ac2a724b27.png)


## 목차
- [주제선정](#주제선정)
- [개발목표](#개발목표)
- [개발환경](#개발환경)
- [흐름도](#흐름도)
- [담당 구현기능](#담당-구현기능)
- [후기](#후기)

## 주제선정
![camping](https://user-images.githubusercontent.com/96432168/172875787-cf540b50-8d9d-4d4c-b746-f8749aa93ff9.png)

코로나 19 여파에 국내로 눈을 돌린 여행의 수요가 주목하고 있는 레저 활동 중 하나는 캠핑이다.
신한카드 빅데이터 연구소가 신용카드 사용실적을 분석한 결과, 작년 캠핑장 이용 경험이 있는 소비자는 1만 9000명으로 지난해 같은 기간보다 3배 이상 증가했다. 캠핑은 실외 활동이기 때문에 제약이 덜하다는 장점이 있어 활황세를 타고 있다. **[:link:](https://www.donga.com/news/Economy/article/all/20200707/101847576/1)**

이에 따라 캠핑을 좋아하는 사람의 눈높이에 맞추어, 온라인을 통한 예약 시스템과 커뮤니티 시스템으로 구성된 캠핑 플랫폼을 제작 및 배포하고자 한다.

## 개발목표
- 소비자가 확실한 정보를 가지고 캠핑 장소를 선택해 자유롭게 예약, 환불할 수 있는 시스템
- 조회수가 많은 후기를 메인화면에 노출시켜 해당 장소에 대한 평가를 확인
- 회원 간 자유로운 소통을 위한 커뮤니티 기능 : 동행찾기, 채팅, 쪽지

## 개발환경
![enviro](https://user-images.githubusercontent.com/96432168/172879724-22d4efc5-5150-4999-b2ea-904eaccf0c54.png)

## 흐름도
![image](https://user-images.githubusercontent.com/96432168/172880072-21b64d71-cdce-42c4-9686-9090469eec13.png)

## 담당 구현기능
### 메인 레이아웃 & 상단바
> * 반응형 (bootstrap)
> * 마우스 효과
> * 상단바 : Ajax -> 프로필사진 출력 & 미열람 쪽지 개수 출력 

![image](https://user-images.githubusercontent.com/96432168/172887695-29c668ce-f344-43aa-885e-610e03186d0a.png)

### 예약 & 결제
> * Javascript function
> * 주문서 저장 : 결제대기 상태로 예약내역에서 확인 가능
> * 아임포트 API : 결제 후 검증 과정 추가 (REST API)

![image](https://user-images.githubusercontent.com/96432168/172882853-a6b0d7a7-6719-47ae-b82d-1f1574ae46b2.png)
![image](https://user-images.githubusercontent.com/96432168/172882986-f9906846-944f-41eb-842b-f7461fa57131.png)


### 예약확인 & 결제취소
> * Javascript function
> * 결제상태 : 결제대기, 예약완료, 예약취소 -> 예약이 확정되지 않은 주문은 목록에서 삭제 가능
> * 캠핑일이 지났을 때 지난예약 처리 : 리뷰 작성 활성화 -> 리뷰를 작성한 주문은 리뷰 확인 가능
> * 예약상세 : 예약취소 -> 아임포트 API : 금액 검증 후 환불 (REST API)

![image](https://user-images.githubusercontent.com/96432168/172886477-7af124ac-f8b5-447b-8f7d-8759ccf29ce3.png)
![image](https://user-images.githubusercontent.com/96432168/172886581-ef41c5a7-2d97-4093-b16d-4a9080d43b95.png)


### 장비관리
> * 캠핑 지역, 타입 필터
> * 팝업창
> * 다중삭제

![image](https://user-images.githubusercontent.com/96432168/172888678-cb3fe208-e6e9-43f1-b876-ee28abfaf826.png)


### 예약관리 : 예약확인 & 장비반납
> * 지역 필터, 일자별 정렬
> * 예약상세 : 예약자에게 쪽지 보내기
> * 장비반납 & 취소 -> Ajax

![image](https://user-images.githubusercontent.com/96432168/172889076-733d0ea5-e596-4cf3-bd10-c36a60a794eb.png)
![image](https://user-images.githubusercontent.com/96432168/172889140-216e241a-2419-4363-affc-6f2b831a3add.png)


### 쪽지
> * 팝업창
> * 쪽지 열람 여부 확인
> * 일괄열람처리 & 다중삭제
> * 유효성 : 삭제, 존재하지 않는 회원

![image](https://user-images.githubusercontent.com/96432168/172889949-c4337e5d-3591-4eea-a55e-74dacc81aaa5.png)


## 후기
> 개발기간 4주, 참여인원 5명


  선생님이 처음 프로젝트에 들어갈 때 해주신 말씀이 있다. 프로젝트를 하면 실력이 느는 걸 체감할 수 있을 거라고, 지금 잘 모르는 것도 프로젝트를 하고 나면 잘 알게 될 거라고. 그러니 포기하지 않고 열심히 해 보라고. 그 말씀이 맞았다. 나뿐 아니라 조원 모두가 크게 발전하고 있다는 것을 느낄 수 있었다.
 
  팀 프로젝트는 혼자 하는 것이 아니기 때문에, 대화와 소통이 매우 중요하다. 서로 소통하지 않으면 현재 어디까지 진행되고 있는지, 요구사항을 제대로 반영했는지, 역할의 재분배나 일정 수정이 필요한지- 이런 파악을 전혀 알 수 없고, 이런 단절은 곧 프로젝트의 실패가 된다. 그런 의미에서 우리 조는 소통이 아주 잘 되었다고 생각한다. 이 과정에서 각자의 실력이 좋고 나쁘고는 중요하지 않다. 우리는 모두 배우는 입장이기 때문에, 이같은 소통은 모두 배워가는 과정이 된다. 조원들이 내게 질문을 할 때, 같이 코드를 보며 고민하고 해결해나가는 그 모든 것이 나의 공부가 되는 것이다. 조원들이 적극적으로 참여하고 소통해준 덕분에 내가 맡은 부분 뿐 아니라 다른 조원이 맡은 부분에 대한 코드 이해도가 많이 높아졌고 덕분에 테스트를 진행할 때도 적절한 피드백을 줄 수 있었다.
 
  내가 맡은 역할은 이 프로젝트의 가장 중요한 파트 중 하나였기 때문에 부담감이 상당했다. 서버에 올려 테스트를 진행하면서 발생한 오류가 셀 수 없이 많았고, 밤새 잠도 자지 못하고 계속 수정에 수정을 거듭했던 기억이 난다. 요 며칠 간의 밤샘으로 컨트롤러를 구성할 때 반드시 null에 대한 대처-try catch 또는 조건문-를 고려해야 한다는 정말 값진 교훈을 얻을 수 있었다. 또, 요구사항을 아주 자세하게 작성하고 DB 설계도 신중하게 해야 한다는 사실도. 프로젝트 중간 즈음 알아챘을 땐 이미 늦어 백엔드 단에서 해결해야 하는 과정을 프론트 단에서 진행해야 하는 부분이 있었는데 -예약 금액 출력- 이 때문에 대여한 장비는 수정이나 삭제를 할 수 없도록 처리해야 하는 문제가 있었다. 배우는 과정이기 때문에 일어날 수 있는 실수고, 실무에서는 절대 일어나지 않아야 할 실수이다. 이런 경험을 발판 삼아 더 좋은 개발자가 될 수 있을거라 믿는다.
 
  우리의 한 달 간의 노력이 헛되지 않았다는 건 수료식 때 받은 최우수상이 증명해주네요. 마지막까지 잡음 없이 열심히 노력해준 조원분들과 도움 주신 선생님에게 감사드립니다.
