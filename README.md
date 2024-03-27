# Palworld_Server_manager script

여기저기에서 참조했는데, 링크를 못찾아서 출처는 나중에 쓰는거로 하고...
간단히말해서 터미널로 켜고 끌수 있는 스크립트입니다.

> 사용환경
- Ubuntu 22.- LTS 에서 작동 확인.
- Docker 로 서버가 운영되어야 합니다. 링크 나중에 올리기
- 크론탭(CronTab) 사용가능.

> 사용방법
- ./스크립트파일이름 명령어
- ex) ./server_manager start

> 명령어
- start : 팰월드 docker container를 시작합니다.
- stop : 팰월드 docker container룰 정지합니다.

> 주의사항
- 크론탭 사용시 루트 패스워드를 입력해줘야합니다. 방법은 나중에 쓰기...
- 본 스크립트는 내가 쓸려고 만든거라 타 환경에서 작동을 보장하지 않습니다.

> 업데이트 내역
- V 1.0 최초릴리즈
