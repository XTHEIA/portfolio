import 'package:flutter/material.dart';
import 'package:portfolio/project/project.dart';
import 'package:portfolio/utils/text.dart';
import 'package:portfolio/widgets/description_tile.dart';
import 'package:portfolio/widgets/description_tiles.dart';
import 'package:portfolio/widgets/headline.dart';
import 'package:portfolio/widgets/progress_view.dart';
import 'package:portfolio/widgets/project_tile.dart';

class ServerHubTab extends StatelessWidget {
  const ServerHubTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtitle
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.podcasts, size: 18, color: Colors.grey),
                text(' 스트리밍 / ', weight: FontWeight.w500, color: Colors.grey),
                const Icon(Icons.people, size: 18, color: Colors.grey),
                text(' 시청자 참여 / ', weight: FontWeight.w500, color: Colors.grey),
                const Icon(Icons.videocam, size: 18, color: Colors.grey),
                text(' 컨텐츠', weight: FontWeight.w500, color: Colors.grey),
              ],
            ),
            text('100% 맞춤형 서버 제작 (플러그인, 모드 포함)', color: Colors.grey),
          ],
        ),

        const SizedBox(height: 60),

        // Description
        const Text('목적에 맞는 고품질의 마인크래프트 서버를 제작합니다.'),
        const Text('구현할 컨텐츠에 따라 전용 플러그인, 모드, 리소스팩의 개발이 포함됩니다.'),
        SizedBox(height: 5),
        text('(아이템, 블록 등의 텍스쳐 이미지는 직접 제공 필요)', size: 13, color: Colors.grey),

        const SizedBox(height: 150),

        // Elements
        const Headline(Icons.apps, '작업 요소', color: Colors.cyanAccent),
        const SizedBox(height: 40),
        CardGrid(
          items: [
            DescriptionCard.text(
              Icons.auto_fix_high,
              '최적 솔루션 협의',
              '필요한 컨텐츠 혹은 기능의 자유로운 상담\n가장 적합한 서버 코어 및 구현 방식 제안',
              color: Colors.cyanAccent,
            ),
            DescriptionCard.text(
              Icons.dashboard_customize,
              '맞춤형 작업 진행',
              '결과물의 고품질 구현을 위하여\n즉시 전용 플러그인/모드 개발 착수',
              color: Colors.cyanAccent,
            ),
            DescriptionCard.text(
              Icons.webhook,
              '특수 기능',
              '타 API, DB, 디스코드 봇, 웹훅, 파일 작업등\n게임 외부와 연동이 이루어지는 기능의 통합',
              color: Colors.cyanAccent,
            ),
            DescriptionCard.text(
              Icons.developer_board,
              '타 플러그인, 모드 호환',
              '다른 플러그인 혹은 모드와 상호 연동 가능\n혹은 애드온(확장) 프로젝트',
              color: Colors.cyanAccent,
            ),
            DescriptionCard.text(
              Icons.broadcast_on_home,
              '실시간 테스트 서버 작동',
              '개발 중인 컨텐츠를 직접 시연하는 서버 작동\n실제로 서버에 참여하여 테스트 가능',
              color: Colors.cyanAccent,
            ),
            DescriptionCard.text(
              Icons.manage_accounts,
              '관리 기능 제공 및 지원',
              '서버 관리/감독 및 모니터링 기능 제공\n혹은 서버 관리직 직접 담당',
              color: Colors.cyanAccent,
            ),
            DescriptionCard.text(
              Icons.dns,
              '호스팅 셋업 지원',
              '호스팅 서버 PC 초기 설정 어시스트\n혹은 비공개 소규모 서버 직접 호스팅',
              color: Colors.cyanAccent,
            ),
            DescriptionCard.text(
              Icons.document_scanner,
              '관리자, 사용자 가이드 제공',
              '제작된 서버의 사용법과 작동 방식에 관한 문서 제공\n참여 플레이어 전용 가이드 제작',
              color: Colors.cyanAccent,
            ),
            DescriptionCard.text(
              Icons.forum,
              '긴밀한 피드백',
              '개발 진행 상황 전달 채널 수립 (디스코드 등)\n지속적 상황 전달, 즉각적 피드백 수용',
              color: Colors.cyanAccent,
            ),
          ],
        ),

        const SizedBox(height: 150),

        // Process
        const Headline(Icons.view_timeline, '작업 프로세스', color: Colors.cyanAccent),
        const SizedBox(height: 40),
        ProgressView(
          color: Colors.cyanAccent,
          steps: [
            ProgressStep(
              '구현 컨텐츠 및 기능 상담',
              Icons.forum,
              '어떤 서버가 필요한지 계획을 전달받습니다.\n개발할 기능 및 제작할 컨텐츠에 관하여 협의합니다.',
            ),
            ProgressStep(
              '솔루션 결정',
              Icons.document_scanner,
              '사용할 서버의 버전과 종류, 제작 대상과 방식에 관하여 결정합니다.',
            ),
            ProgressStep(
              '개발 진행',
              Icons.timelapse,
              '결정된 사항을 토대로 서버 제작을 시작합니다.',
            ),
            ProgressStep(
              '피드백',
              Icons.feedback,
              '작업 중 지속적으로 피드백을 주고받습니다.',
            ),
            ProgressStep(
              '결과물 전달',
              Icons.send,
              '최종 완성된 서버를 전달합니다.',
            ),
            ProgressStep(
              '배포 및 관리',
              Icons.dns,
              '완성된 서버를 가동하여 실제 프로덕션에 사용합니다.\n경우에 따라 호스팅 PC의 설정 및 서버 관리 감독을 담당합니다.',
            ),
          ],
        ),
        SizedBox(height: 10),
        text('세부적인 진행 과정은 프로젝트의 종류와 규모에 따라 다를 수 있습니다.', color: Colors.grey, size: 13),

        const SizedBox(height: 150),

        // Projects
        const Headline(Icons.apps, '작업물', color: Colors.cyanAccent),
        const SizedBox(height: 40),
        const ProjectRow(
          [
            Project.three_kingdoms,
            Project.pixel_universe,
          ],
          width: 420,
        ),


        // const Headline(Icons.request_page, '의뢰', color: Colors.cyanAccent),


      ],
    );
  }
}
