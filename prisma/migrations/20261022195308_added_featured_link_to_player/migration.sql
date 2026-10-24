/*
  Warnings:

  - You are about to drop the column `document_tsv` on the `SearchDocument` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Collection" DROP CONSTRAINT "Collection_forked_from_id_fkey";

-- DropForeignKey
ALTER TABLE "CollectionCollaborator" DROP CONSTRAINT "CollectionCollaborator_collection_id_fkey";

-- DropForeignKey
ALTER TABLE "CollectionComment" DROP CONSTRAINT "CollectionComment_collection_id_fkey";

-- DropForeignKey
ALTER TABLE "CollectionFollow" DROP CONSTRAINT "CollectionFollow_collection_id_fkey";

-- DropForeignKey
ALTER TABLE "CollectionImport" DROP CONSTRAINT "CollectionImport_collection_id_fkey";

-- DropForeignKey
ALTER TABLE "CollectionItem" DROP CONSTRAINT "CollectionItem_collection_id_fkey";

-- DropForeignKey
ALTER TABLE "GamePageTrack" DROP CONSTRAINT "GamePageTrack_composerId_fkey";

-- DropForeignKey
ALTER TABLE "JamRatingReminderDispatch" DROP CONSTRAINT "JamRatingReminderDispatch_jam_id_fkey";

-- DropIndex
DROP INDEX "Reaction_kind_slug_idx";

-- DropIndex
DROP INDEX "SearchDocument_document_tsv_idx";

-- AlterTable
ALTER TABLE "ContentReviewSettings" RENAME CONSTRAINT "jamcore_content_review_settings_pkey" TO "ContentReviewSettings_pkey";

-- AlterTable
ALTER TABLE "DomainEvent" RENAME CONSTRAINT "jamcore_domain_events_pkey" TO "DomainEvent_pkey";

-- AlterTable
ALTER TABLE "EventCheckpoint" RENAME CONSTRAINT "jamcore_event_checkpoints_pkey" TO "EventCheckpoint_pkey";

-- AlterTable
ALTER TABLE "FederationAllowlistEntry" RENAME CONSTRAINT "jamcore_federation_allowlist_pkey" TO "FederationAllowlistEntry_pkey";

-- AlterTable
ALTER TABLE "FederationBlock" RENAME CONSTRAINT "jamcore_federation_blocks_pkey" TO "FederationBlock_pkey";

-- AlterTable
ALTER TABLE "FederationPreviewQueueItem" RENAME CONSTRAINT "jamcore_federation_preview_queue_pkey" TO "FederationPreviewQueueItem_pkey";

-- AlterTable
ALTER TABLE "FederationReputation" RENAME CONSTRAINT "jamcore_federation_reputation_pkey" TO "FederationReputation_pkey";

-- AlterTable
ALTER TABLE "FederationTrustSetting" RENAME CONSTRAINT "jamcore_federation_trust_settings_pkey" TO "FederationTrustSetting_pkey";

-- AlterTable
ALTER TABLE "IdempotencyRecord" RENAME CONSTRAINT "jamcore_idempotency_pkey" TO "IdempotencyRecord_pkey";

-- AlterTable
ALTER TABLE "NotificationPreference" RENAME CONSTRAINT "jamcore_notification_preferences_pkey" TO "NotificationPreference_pkey";

-- AlterTable
ALTER TABLE "PlatformJob" RENAME CONSTRAINT "jamcore_jobs_pkey" TO "PlatformJob_pkey";

-- AlterTable
ALTER TABLE "PostAutosave" RENAME CONSTRAINT "jamcore_post_autosaves_pkey" TO "PostAutosave_pkey";

-- AlterTable
ALTER TABLE "PostCollaborator" RENAME CONSTRAINT "jamcore_post_collaborators_pkey" TO "PostCollaborator_pkey";

-- AlterTable
ALTER TABLE "PostGameLink" RENAME CONSTRAINT "jamcore_post_games_pkey" TO "PostGameLink_pkey";

-- AlterTable
ALTER TABLE "PostRevision" RENAME CONSTRAINT "jamcore_post_revisions_pkey" TO "PostRevision_pkey";

-- AlterTable
ALTER TABLE "PostSeries" RENAME CONSTRAINT "jamcore_post_series_pkey" TO "PostSeries_pkey";

-- AlterTable
ALTER TABLE "PostSeriesPost" RENAME CONSTRAINT "jamcore_post_series_posts_pkey" TO "PostSeriesPost_pkey";

-- AlterTable
ALTER TABLE "RadioBan" RENAME CONSTRAINT "jamcore_radio_bans_pkey" TO "RadioBan_pkey";

-- AlterTable
ALTER TABLE "RadioEmote" RENAME CONSTRAINT "jamcore_radio_emotes_pkey" TO "RadioEmote_pkey";

-- AlterTable
ALTER TABLE "RadioSession" RENAME CONSTRAINT "jamcore_radio_sessions_pkey" TO "RadioSession_pkey";

-- AlterTable
ALTER TABLE "RadioVote" RENAME CONSTRAINT "jamcore_radio_votes_pkey" TO "RadioVote_pkey";

-- AlterTable
ALTER TABLE "RemoteComment" RENAME CONSTRAINT "jamcore_remote_comments_pkey" TO "RemoteComment_pkey";

-- AlterTable
ALTER TABLE "RemoteFeedPost" RENAME CONSTRAINT "jamcore_remote_feed_posts_pkey" TO "RemoteFeedPost_pkey";

-- AlterTable
ALTER TABLE "ReportNote" RENAME CONSTRAINT "jamcore_report_notes_pkey" TO "ReportNote_pkey";

-- AlterTable
ALTER TABLE "RoleGrant" RENAME CONSTRAINT "jamcore_role_grants_pkey" TO "RoleGrant_pkey";

-- AlterTable
ALTER TABLE "SearchDocument" DROP COLUMN "document_tsv";
ALTER TABLE "SearchDocument" RENAME CONSTRAINT "jamcore_search_documents_pkey" TO "SearchDocument_pkey";

-- AlterTable
ALTER TABLE "SearchReindexRun" RENAME CONSTRAINT "jamcore_search_reindex_runs_pkey" TO "SearchReindexRun_pkey";

-- AlterTable
ALTER TABLE "SearchSettings" RENAME CONSTRAINT "jamcore_search_settings_pkey" TO "SearchSettings_pkey";

-- AlterTable
ALTER TABLE "SearchSynonym" RENAME CONSTRAINT "jamcore_search_synonyms_pkey" TO "SearchSynonym_pkey";

-- AlterTable
ALTER TABLE "ServiceKey" RENAME CONSTRAINT "jamcore_service_keys_pkey" TO "ServiceKey_pkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "featuredLink" TEXT;

-- AlterTable
ALTER TABLE "UserFollow" RENAME CONSTRAINT "jamcore_user_follows_pkey" TO "UserFollow_pkey";

-- AlterTable
ALTER TABLE "WebhookSubscription" RENAME CONSTRAINT "jamcore_webhook_subscriptions_pkey" TO "WebhookSubscription_pkey";

-- AddForeignKey
ALTER TABLE "GamePageTrack" ADD CONSTRAINT "GamePageTrack_composerId_fkey" FOREIGN KEY ("composerId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JamRatingReminderDispatch" ADD CONSTRAINT "JamRatingReminderDispatch_jam_id_fkey" FOREIGN KEY ("jam_id") REFERENCES "Jam"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- RenameIndex
ALTER INDEX "jamcore_collection_follows_user_id_created_at_idx" RENAME TO "CollectionFollow_user_id_created_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_collection_items_item_type_item_id_idx" RENAME TO "CollectionItem_item_type_item_id_idx";

-- RenameIndex
ALTER INDEX "jamcore_domain_events_occurred_at_idx" RENAME TO "DomainEvent_occurred_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_federation_allowlist_tenant_id_allow_type_value_key" RENAME TO "FederationAllowlistEntry_tenant_id_allow_type_value_key";

-- RenameIndex
ALTER INDEX "jamcore_federation_blocks_tenant_id_block_type_value_key" RENAME TO "FederationBlock_tenant_id_block_type_value_key";

-- RenameIndex
ALTER INDEX "jamcore_federation_preview_queue_tenant_id_status_created_a_idx" RENAME TO "FederationPreviewQueueItem_tenant_id_status_created_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_federation_reputation_tenant_id_host_key" RENAME TO "FederationReputation_tenant_id_host_key";

-- RenameIndex
ALTER INDEX "jamcore_idempotency_expires_at_idx" RENAME TO "IdempotencyRecord_expires_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_jobs_status_run_at_idx" RENAME TO "PlatformJob_status_run_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_post_autosaves_tenant_id_author_id_post_id_key" RENAME TO "PostAutosave_tenant_id_author_id_post_id_key";

-- RenameIndex
ALTER INDEX "jamcore_post_games_game_id_created_at_idx" RENAME TO "PostGameLink_game_id_created_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_post_revisions_post_id_created_at_idx" RENAME TO "PostRevision_post_id_created_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_post_series_tenant_id_owner_id_slug_key" RENAME TO "PostSeries_tenant_id_owner_id_slug_key";

-- RenameIndex
ALTER INDEX "jamcore_post_series_tenant_id_visibility_updated_at_idx" RENAME TO "PostSeries_tenant_id_visibility_updated_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_post_series_posts_post_id_idx" RENAME TO "PostSeriesPost_post_id_idx";

-- RenameIndex
ALTER INDEX "jamcore_radio_bans_tenant_id_track_id_key" RENAME TO "RadioBan_tenant_id_track_id_key";

-- RenameIndex
ALTER INDEX "jamcore_radio_emotes_tenant_id_created_at_idx" RENAME TO "RadioEmote_tenant_id_created_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_radio_votes_tenant_id_vote_round_track_id_idx" RENAME TO "RadioVote_tenant_id_vote_round_track_id_idx";

-- RenameIndex
ALTER INDEX "jamcore_radio_votes_tenant_id_vote_round_user_id_key" RENAME TO "RadioVote_tenant_id_vote_round_user_id_key";

-- RenameIndex
ALTER INDEX "jamcore_remote_comments_tenant_id_object_id_key" RENAME TO "RemoteComment_tenant_id_object_id_key";

-- RenameIndex
ALTER INDEX "jamcore_remote_feed_posts_tenant_id_object_id_key" RENAME TO "RemoteFeedPost_tenant_id_object_id_key";

-- RenameIndex
ALTER INDEX "jamcore_remote_feed_posts_tenant_id_status_published_at_cre_idx" RENAME TO "RemoteFeedPost_tenant_id_status_published_at_created_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_report_notes_report_id_created_at_idx" RENAME TO "ReportNote_report_id_created_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_search_documents_tenant_id_entity_type_entity_id_idx" RENAME TO "SearchDocument_tenant_id_entity_type_entity_id_idx";

-- RenameIndex
ALTER INDEX "jamcore_user_follows_tenant_id_follower_id_created_at_idx" RENAME TO "UserFollow_tenant_id_follower_id_created_at_idx";

-- RenameIndex
ALTER INDEX "jamcore_user_follows_tenant_id_following_id_created_at_idx" RENAME TO "UserFollow_tenant_id_following_id_created_at_idx";
