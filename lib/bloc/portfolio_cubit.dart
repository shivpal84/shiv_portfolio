import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiv_portfolio/bloc/portfolio_state.dart';
import 'package:shiv_portfolio/data/portfolio_data.dart';
import 'package:shiv_portfolio/models/portfolio_models.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit()
      : super(
          const PortfolioState(
            skills: kSkills,
            metrics: kMetrics,
            projects: kProjects,
            experiences: kExperienceEntries,
            resumeUrl: kResumeUrl,
          ),
        ) {
    _listenToProjects();
    _listenToResumeUrl();
  }

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _projectsSub;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _resumeSub;

  void _listenToProjects() {
    if (Firebase.apps.isEmpty) {
      return;
    }

    _projectsSub =
        FirebaseFirestore.instance.collection('projects').snapshots().listen(
      (QuerySnapshot<Map<String, dynamic>> snapshot) {
        final List<ProjectItem> dynamicProjects = snapshot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
              return ProjectItem.fromMap(doc.data());
            })
            .where((ProjectItem project) => project.isValid)
            .toList()
          ..sort(
            (ProjectItem a, ProjectItem b) => a.order.compareTo(b.order),
          );

        if (dynamicProjects.isNotEmpty) {
          emit(state.copyWith(projects: dynamicProjects));
        }
      },
      onError: _handleFirestoreError,
    );
  }

  void _listenToResumeUrl() {
    if (Firebase.apps.isEmpty) {
      return;
    }

    _resumeSub = FirebaseFirestore.instance
        .collection('portfolio')
        .doc('links')
        .snapshots()
        .listen(
      (DocumentSnapshot<Map<String, dynamic>> snapshot) {
        final String? resumeUrl =
            (snapshot.data()?['resumeUrl'] as String?)?.trim();

        if (resumeUrl != null &&
            resumeUrl.isNotEmpty &&
            resumeUrl != state.resumeUrl) {
          emit(state.copyWith(resumeUrl: resumeUrl));
        }
      },
      onError: _handleFirestoreError,
    );
  }

  void _handleFirestoreError(Object error, StackTrace stackTrace) {
    if (error is FirebaseException && error.code == 'permission-denied') {
      debugPrint(
        'Firestore access denied. Falling back to bundled portfolio data.',
      );
      return;
    }

    FlutterError.reportError(
      FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'portfolio_cubit',
        context:
            ErrorDescription('while listening to Firestore portfolio data'),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _projectsSub?.cancel();
    await _resumeSub?.cancel();
    return super.close();
  }
}
