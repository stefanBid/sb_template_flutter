import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_design.dart';
import '../../helpers/theme/app_colors.dart';
import '../../helpers/theme/app_typography.dart';

// Project - Widgets
import '../../widgets/app/card/app_card.dart';
import '../../widgets/app/badge/app_badge.dart';

class ComponentsSection extends StatelessWidget {
  const ComponentsSection({super.key});

  void _handleCardTap(BuildContext context, String id, String cardName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$cardName tapped! ID: $id',
          style: AppTypography.of(context).body.copyWith(color: Colors.white),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.of(context).appBarBackground,
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(title, style: AppTypography.of(context).heading1);
  }

  Widget _buildSubsectionTitle(BuildContext context, String title) {
    return Text(title, style: AppTypography.of(context).heading3);
  }

  Widget _buildDescription(BuildContext context, String description) {
    return Text(description, style: AppTypography.of(context).caption);
  }

  Widget _buildExampleCard({
    required BuildContext context,
    required String title,
    required String description,
    required Widget widget,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.of(
            context,
          ).body.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDesign.xs),
        Text(description, style: AppTypography.of(context).caption),
        const SizedBox(height: AppDesign.md),
        widget,
        const SizedBox(height: AppDesign.xl),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'UI Components'),
        const SizedBox(height: AppDesign.lg),

        // === CARDS SECTION ===
        _buildSubsectionTitle(context, 'Cards'),
        const SizedBox(height: AppDesign.sm),
        _buildDescription(
          context,
          'Contenitori versatili per raggruppare informazioni correlate',
        ),
        const SizedBox(height: AppDesign.xl),

        _buildExampleCard(
          context: context,
          title: 'Card Base (non cliccabile)',
          description: 'Card con titolo e descrizione senza onTap',
          widget: AppCard(
            title: 'Titolo della Card',
            description:
                'Questa card non ha l\'onTap definito, quindi non è cliccabile.',
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Card con Prefix Icon (cliccabile)',
          description: 'Card con icona a sinistra e effetto ripple al tap',
          widget: AppCard(
            title: 'Notifica',
            description: 'Hai un nuovo messaggio da leggere',
            prefixContent: Container(
              padding: const EdgeInsets.all(AppDesign.md),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(26),
                borderRadius: AppDesign.borderRadiusM,
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: AppColors.primary,
                size: AppDesign.iconXL,
              ),
            ),
            onTap: (id) => _handleCardTap(context, id, 'Card con Prefix'),
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Card con Suffix Icon (cliccabile)',
          description: 'Card con icona a destra e effetto ripple al tap',
          widget: AppCard(
            title: 'Impostazioni',
            description: 'Configura le preferenze dell\'applicazione',
            suffixContent: const Icon(
              Icons.arrow_forward_ios,
              size: AppDesign.iconM,
            ),
            onTap: (id) => _handleCardTap(context, id, 'Card con Suffix'),
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Card con Contenuto Personalizzato (non cliccabile)',
          description: 'Card con bodyContent personalizzato senza onTap',
          widget: AppCard(
            bodyContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppColors.secondary,
                      size: AppDesign.iconL,
                    ),
                    const SizedBox(width: AppDesign.sm),
                    Expanded(
                      child: Text(
                        'Contenuto Personalizzato',
                        style: AppTypography.of(context).heading3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDesign.md),
                Text(
                  'Puoi inserire qualsiasi widget nel bodyContent per personalizzare completamente l\'aspetto della card.',
                  style: AppTypography.of(context).bodySecondary,
                ),
                const SizedBox(height: AppDesign.md),
                const Wrap(
                  spacing: AppDesign.sm,
                  runSpacing: AppDesign.sm,
                  children: [
                    AppBadge(text: 'Custom', variant: BadgeVariant.primary),
                    AppBadge(text: 'Flexible', variant: BadgeVariant.success),
                  ],
                ),
              ],
            ),
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Confronto: Cliccabile vs Non Cliccabile',
          description:
              'Le card con onTap mostrano l\'effetto ripple, le altre no',
          widget: Column(
            children: [
              AppCard(
                title: 'Card Cliccabile',
                description: 'Tocca per vedere l\'effetto ripple',
                prefixContent: Container(
                  padding: const EdgeInsets.all(AppDesign.sm),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(26),
                    borderRadius: AppDesign.borderRadiusM,
                  ),
                  child: const Icon(
                    Icons.touch_app,
                    color: AppColors.primary,
                    size: AppDesign.iconL,
                  ),
                ),
                onTap: (id) => _handleCardTap(context, id, 'Card Cliccabile'),
              ),
              const SizedBox(height: AppDesign.md),
              AppCard(
                title: 'Card Non Cliccabile',
                description: 'Nessun effetto al tocco',
                prefixContent: Container(
                  padding: const EdgeInsets.all(AppDesign.sm),
                  decoration: BoxDecoration(
                    color: AppColors.of(context).textTertiary.withAlpha(26),
                    borderRadius: AppDesign.borderRadiusM,
                  ),
                  child: Icon(
                    Icons.block,
                    color: AppColors.of(context).textTertiary,
                    size: AppDesign.iconL,
                  ),
                ),
              ),
            ],
          ),
        ),

        // === BADGES SECTION ===
        _buildSubsectionTitle(context, 'Badges'),
        const SizedBox(height: AppDesign.sm),
        _buildDescription(
          context,
          'Etichette compatte per stati, categorie e metadati',
        ),
        const SizedBox(height: AppDesign.xl),

        _buildExampleCard(
          context: context,
          title: 'Badge Varianti',
          description: 'Diverse varianti di colore per diversi scopi',
          widget: Wrap(
            spacing: AppDesign.md,
            runSpacing: AppDesign.md,
            children: const [
              AppBadge(text: 'Primary', variant: BadgeVariant.primary),
              AppBadge(text: 'Secondary', variant: BadgeVariant.secondary),
              AppBadge(text: 'Success', variant: BadgeVariant.success),
              AppBadge(text: 'Warning', variant: BadgeVariant.warning),
              AppBadge(text: 'Error', variant: BadgeVariant.error),
            ],
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Badge con Icone',
          description: 'Badge con icone per maggiore chiarezza visiva',
          widget: Wrap(
            spacing: AppDesign.md,
            runSpacing: AppDesign.md,
            children: const [
              AppBadge(
                text: 'Nuovo',
                icon: Icons.star,
                variant: BadgeVariant.primary,
              ),
              AppBadge(
                text: 'Completato',
                icon: Icons.check_circle,
                variant: BadgeVariant.success,
              ),
              AppBadge(
                text: 'In attesa',
                icon: Icons.access_time,
                variant: BadgeVariant.warning,
              ),
              AppBadge(
                text: 'Errore',
                icon: Icons.error,
                variant: BadgeVariant.error,
              ),
            ],
          ),
        ),

        _buildExampleCard(
          context: context,
          title: 'Badge in uso reale',
          description: 'Esempi di utilizzo dei badge nelle card',
          widget: Column(
            children: [
              AppCard(
                title: 'Progetto A',
                description: 'Sviluppo della nuova funzionalità',
                prefixContent: Container(
                  padding: const EdgeInsets.all(AppDesign.md),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(26),
                    borderRadius: AppDesign.borderRadiusM,
                  ),
                  child: const Icon(
                    Icons.folder_outlined,
                    color: AppColors.primary,
                    size: AppDesign.iconXL,
                  ),
                ),
                suffixContent: const AppBadge(
                  text: 'Attivo',
                  icon: Icons.play_arrow,
                  variant: BadgeVariant.success,
                ),
                onTap: (id) => _handleCardTap(context, id, 'Progetto A'),
              ),
              const SizedBox(height: AppDesign.md),
              AppCard(
                title: 'Progetto B',
                description: 'Correzione bug critici',
                prefixContent: Container(
                  padding: const EdgeInsets.all(AppDesign.md),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withAlpha(26),
                    borderRadius: AppDesign.borderRadiusM,
                  ),
                  child: const Icon(
                    Icons.bug_report_outlined,
                    color: AppColors.warning,
                    size: AppDesign.iconXL,
                  ),
                ),
                suffixContent: const AppBadge(
                  text: 'Urgente',
                  icon: Icons.priority_high,
                  variant: BadgeVariant.error,
                ),
                onTap: (id) => _handleCardTap(context, id, 'Progetto B'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
