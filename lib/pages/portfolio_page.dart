import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiv_portfolio/bloc/portfolio_cubit.dart';
import 'package:shiv_portfolio/bloc/portfolio_state.dart';
import 'package:shiv_portfolio/sections/about_section.dart';
import 'package:shiv_portfolio/sections/experience_section.dart';
import 'package:shiv_portfolio/sections/footer_section.dart';
import 'package:shiv_portfolio/sections/hero_section.dart';
import 'package:shiv_portfolio/sections/projects_section.dart';
import 'package:shiv_portfolio/sections/top_bar_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final Map<String, GlobalKey> _sectionKeys = <String, GlobalKey>{
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Experience': GlobalKey(),
    'Projects': GlobalKey(),
    'Contact': GlobalKey(),
  };

  Future<void> _scrollToSection(String label) async {
    final BuildContext? targetContext = _sectionKeys[label]?.currentContext;
    if (targetContext == null) {
      return;
    }

    await Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, PortfolioState>(
      builder: (BuildContext context, PortfolioState state) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool isDesktop = constraints.maxWidth >= 1000;
            final bool isTablet = constraints.maxWidth >= 700;

            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1180),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 24 : 14,
                          vertical: 20,
                        ),
                        child: Column(
                          children: <Widget>[
                            TopBarSection(
                              isDesktop: isDesktop,
                              onNavSelected: _scrollToSection,
                            ),
                            const SizedBox(height: 18),
                            KeyedSubtree(
                              key: _sectionKeys['Home'],
                              child: HeroSection(
                                isDesktop: isDesktop,
                                isTablet: isTablet,
                                skills: state.skills,
                                resumeUrl: state.resumeUrl,
                              ),
                            ),
                            const SizedBox(height: 18),
                            KeyedSubtree(
                              key: _sectionKeys['About'],
                              child: AboutSection(
                                isDesktop: isDesktop,
                                metrics: state.metrics,
                              ),
                            ),
                            const SizedBox(height: 18),
                            KeyedSubtree(
                              key: _sectionKeys['Experience'],
                              child: ExperienceSection(
                                isDesktop: isDesktop,
                                experiences: state.experiences,
                              ),
                            ),
                            const SizedBox(height: 18),
                            KeyedSubtree(
                              key: _sectionKeys['Projects'],
                              child: ProjectsSection(
                                isDesktop: isDesktop,
                                isTablet: isTablet,
                                projects: state.projects,
                              ),
                            ),
                            const SizedBox(height: 18),
                            KeyedSubtree(
                              key: _sectionKeys['Contact'],
                              child: const FooterSection(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
