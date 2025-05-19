import 'package:dancee_app/i18n/translations.g.dart';
import 'package:dancee_shared/utils.dart';
import 'package:dancee_design/dancee_design.dart';
import 'package:dancee_shared/entities/event.dart';
import 'package:flutter/material.dart' hide Chip;
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
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
      title: i18n.events.detail.title,
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
                      title: i18n.events.detail.describe,
                      child: Text(event.description, style: TextStyles.smallBodyTextStyle),
                    ),
                    _InfoSection(infoList: event.info),
                    _ProgramSection(programList: event.parts),
                  ],
                ),
              ),
            ),
          ),
          PrimaryButton(
            text: i18n.events.detail.show,
            size: ButtonSize.large,
            onTap: () {
              launchUrl(Uri.parse(event.originalUrl));
            },
          ),
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
        GestureDetector(
          child: Label(icon: AppIcons.point.svg, text: event.venue!.format("\n")),
          onTap: () {
            MapsLauncher.launchQuery(event.venue!.format());
            //MapsLauncher.launchCoordinates(event.venue!.coordinates.latitude, event.venue!.coordinates.longitude);
          },
        ),
        Row(
          children: [
            AppIcons.dancers.svg,
            SizedBox(
              width: 280,
              height: 36,
              child: ChipList(chips: [for (final dance in event.tags) Chip(text: dance)]),
            ),
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
      title: i18n.events.detail.program.title,
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.grey300))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final program in programList)
              EventDetailAccordion(
                time: program.dateTimeRange.start.formatTimeString(isLocal: true),
                title: program.name,
                description: program.description ?? i18n.events.detail.program.noMoreInfo,
                info: {
                  i18n.events.detail.program.time: program.dateTimeRange.formatString(isLocal: true),
                  ...program.lectors != null && program.lectors!.isNotEmpty
                      ? {i18n.events.detail.program.lectors: program.lectors!.join(', ')}
                      : {},
                  ...program.djs != null && program.djs!.isNotEmpty
                      ? {i18n.events.detail.program.dj: program.djs!.join(', ')}
                      : {},
                },
                isOpen: programList.length <= 1,
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
    if (infoList.isEmpty) return SizedBox.shrink();
    return _SectionLayout(
      title: i18n.events.detail.links,
      child: Column(
        spacing: 4,
        children: [
          for (final info in infoList)
            Row(
              children: [
                SizedBox(width: 100, child: Text("${info.key}:", style: TextStyles.smallLabelTextStyle)),
                Spacer(),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:
                        info.type == EventInfoType.url
                            ? LinkButton(
                              text: info.value,
                              textStyle: LinkTextStyles.smallLinkTextStyle,
                              onTap: () => launchUrl(Uri.parse(info.value)),
                            )
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
