CREATE TABLE "event_relationships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "followed_event_id" integer, "follower_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_event_relationships_on_followed_event_id" ON "event_relationships" ("followed_event_id");
CREATE UNIQUE INDEX "index_event_relationships_on_follower_id_and_followed_event_id" ON "event_relationships" ("follower_id", "followed_event_id");
CREATE INDEX "index_event_relationships_on_follower_id" ON "event_relationships" ("follower_id");
CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar, "day" varchar, "beginning" datetime, "end" datetime, "restaurant_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_events_on_restaurant_id" ON "events" ("restaurant_id");
CREATE TABLE "restaurant_relationships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "followed_restaurant_id" integer, "follower_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "restaurants" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "address1" varchar, "address2" varchar, "state" varchar, "zip" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20160113022657');

INSERT INTO schema_migrations (version) VALUES ('20160117150357');

INSERT INTO schema_migrations (version) VALUES ('20160117150916');

INSERT INTO schema_migrations (version) VALUES ('20160117151252');

INSERT INTO schema_migrations (version) VALUES ('20160117151441');

