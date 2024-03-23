import 'package:flutter/material.dart';
import 'package:portfolio/project/project.dart';
import 'package:portfolio/utils/text.dart';
import 'package:portfolio/widgets/description_tile.dart';
import 'package:portfolio/widgets/description_tiles.dart';
import 'package:portfolio/widgets/headline.dart';
import 'package:portfolio/widgets/progress_view.dart';
import 'package:portfolio/widgets/project_tile.dart';

class PluginHubTab extends StatelessWidget {
  const PluginHubTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // subtitle
        text('개별 플러그인, 모드 제작\n', color: Colors.grey),

        const SizedBox(height: 60),

        text('필요한 기능의 플러그인 혹은 모드를 정확하고 빠르게 제작합니다.'),
        text('서버 코어의 종류와 버전에 최적화된 결과물을 제공합니다.'),

        const SizedBox(height: 150),

        // Cards
        const Headline(Icons.apps, '작업 요소', color: Colors.pinkAccent),
        const SizedBox(height: 30),
        CardGrid(
          items: [
            DescriptionCard.text(
              Icons.auto_fix_high,
              '폭넓은 기본 기능',
              '전투, 스킬, 무기, 커스텀 아이템, 능력치 등\n상상 가능한 모든 게임 내 기능의 고품질 구현',
              color: Colors.pinkAccent,
            ),
            DescriptionCard.text(
              Icons.webhook,
              '특수 기능',
              '타 API, DB, 디스코드 봇, 웹훅, 파일 작업등\n게임 외부와 연동이 이루어지는 기능의 통합',
              color: Colors.pinkAccent,
            ),
            DescriptionCard.text(
              Icons.compare_arrows,
              '서버 코어 최적화',
              '서버의 종류와 버전에 최적화된 작업 진행\n높은 성능, 호환성 확보',
              color: Colors.pinkAccent,
            ),
            DescriptionCard.text(
              Icons.code,
              '타 플러그인, 모드 호환',
              '다른 플러그인 혹은 모드와의 호환 가능\n혹은 확장(애드온) 프로젝트 개발',
              color: Colors.pinkAccent,
            ),
            DescriptionCard.text(
              Icons.settings,
              '간편한 사용자화',
              '쉽게 플러그인, 모드의 설정을 변경할 수 있는 방법 제공',
              color: Colors.pinkAccent,
            ),
            DescriptionCard.text(
              Icons.feedback,
              '빠른 피드백',
              '높은 빈도로 진행 상황 이미지, 영상, 문서 전송\n지속적으로 피드백 수용',
              color: Colors.pinkAccent,
            ),
            DescriptionCard.text(
              Icons.upload_file_rounded,
              '강력한 버전 정책',
              '최신 버전의 마인크래프트에서 작업 가능\n개발 중 새 버전이 출시될 경우 업그레이드',
              color: Colors.pinkAccent,
            ),
          ],
        ),

        const SizedBox(height: 150),

        // Process
        const Headline(Icons.apps, '작업 프로세스', color: Colors.pinkAccent),
        const SizedBox(height: 40),
        ProgressView(
          color: Colors.pinkAccent,
          steps: [
            ProgressStep(
              '계획 수립',
              Icons.plagiarism,
              '플러그인 혹은 모드의 기능에 대하여 전달받습니다.\n작업할 서버 코어 및 버전을 결정합니다.',
            ),
            ProgressStep(
              '제작',
              Icons.timelapse,
              '정해진 계획대로 제작을 진행합니다.',
            ),
            ProgressStep(
              '최초 전달 및 피드백',
              Icons.send_time_extension,
              '최초 결과물을 전송하고 피드백을 진행합니다.\n버그 및 세부사항을 수정합니다.',
            ),
            ProgressStep(
              '완성',
              Icons.check,
              '최종 결과물을 완성합니다.',
            ),
          ],
        ),

        const SizedBox(height: 150),

        // Projects
        const Headline(Icons.apps, '작업물', color: Colors.pinkAccent),
        const SizedBox(height: 40),
        const ProjectRow([
          Project.pin_engine,
          Project.simple_discord,
          Project.better_spyglass,
          Project.rechargeable_fireworks,
          Project.lethal_scanner,
          Project.nameplate_changer,
        ]),
      ],
    );
  }
}
