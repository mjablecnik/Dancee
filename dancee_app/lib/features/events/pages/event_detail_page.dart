import 'package:dancee_app/entities/event.dart';
import 'package:dancee_app/utils.dart';
import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/material.dart' hide Chip;
import 'package:vader_app/vader_app.dart';

part 'event_detail_page.g.dart';

@TypedGoRoute<EventDetailRoute>(path: '/event/detail')
class EventDetailRoute extends GoRouteData {
  const EventDetailRoute(this.$extra);

  final Event $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => EventDetailPage(event: $extra);
}

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Detail události",
      child: Column(
        spacing: 20,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 130,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 42,
                  children: [
                    _EventDetailSection(event: event),
                    _SectionLayout(
                      title: "Popis",
                      child: Text(event.description, style: TextStyles.smallBodyTextStyle),
                    ),
                    _ProgramSection(programList: event.parts),
                    _InfoSection(infoList: event.info),
                  ],
                ),
              ),
            ),
          ),
          PrimaryButton(text: 'Zúčastním se', size: ButtonSize.large),
        ],
      ),
    );
  }
}

class _EventDetailSection extends StatelessWidget {
  const _EventDetailSection({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: [
        Text(event.title, style: TextStyles.largeTitleTextStyle),
        SizedBox(height: 8),
        Row(
          children: [
            Label(icon: AppIcons.calendar.svg, text: event.dateTimeRange.start.formatCzechDate()),
            Spacer(),
            Label(icon: AppIcons.clock.svg, text: event.dateTimeRange.formatString()),
          ],
        ),
        Label(icon: AppIcons.point.svg, text: event.venue.format("\n")),
        Row(
          children: [
            AppIcons.dancers.svg,
            SizedBox(width: 280, height: 36, child: ChipList(chips: [Chip(text: "Salsa"), Chip(text: "Bachata")])),
          ],
        ),
      ],
    );
  }
}

class _ProgramSection extends StatelessWidget {
  const _ProgramSection({super.key, required this.programList});

  final List<EventPart> programList;

  @override
  Widget build(BuildContext context) {
    return _SectionLayout(
      title: "Program",
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.grey300))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final program in programList)
              EventDetailAccordion(
                time: program.dateTimeRange.start.formatTimeString(),
                title: program.name,
                description: program.description ?? 'Žádné další informace',
                info: {
                  "Čas": program.dateTimeRange.formatString(),
                  ...program.lectors != null && program.lectors!.isNotEmpty
                      ? {"Lektoři": program.lectors!.join(', ')}
                      : {},
                  ...program.djs != null && program.djs!.isNotEmpty ? {"DJ": program.djs!.join(', ')} : {},
                },
                isOpen: false,
              ),
          ],
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({super.key, required this.infoList});

  final List<EventInfo> infoList;

  @override
  Widget build(BuildContext context) {
    return _SectionLayout(
      title: "Odkazy",
      child: Column(
        spacing: 4,
        children: [
          for (final info in infoList)
            Row(
              children: [
                SizedBox(width: 100, child: Text("${info.key}:", style: TextStyles.smallLabelTextStyle)),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:
                        info.type == EventInfoType.url
                            ? LinkButton(text: info.value, textStyle: LinkTextStyles.smallLinkTextStyle)
                            : Text(info.value, style: TextStyles.smallBodyTextStyle),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _SectionLayout extends StatelessWidget {
  const _SectionLayout({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: [Text(title, style: TextStyles.mediumTitleTextStyle), child],
    );
  }
}
