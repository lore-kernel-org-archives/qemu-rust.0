Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629A0CE8D6B
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 08:48:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKuuG-0004GE-BS; Mon, 17 Nov 2025 03:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuuC-00046w-BS
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuu9-00071l-F8
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763369288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13wjDJAbYFD10gI6Zr7kk4dq3n61G4FXpl1Z3qYzA6A=;
 b=UADIR+FimQConG7/OpeP8u4FyW2zwh3YAARjLV6e1kB5PQ7QFBaQjwwPx3++sBB/vGqv8z
 CbjL+ZbOU4M6P/UYFH0qhFLsoF4VgE3CkdqX3FAeRpRssB6Ei54ipnb1DuZnEEuQGZ7s9L
 HVWzShgY+R/hW7smbu6+hiFV+oQ3aTI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-gt92l9RLN1qwI6BSuP-Epw-1; Mon, 17 Nov 2025 03:48:07 -0500
X-MC-Unique: gt92l9RLN1qwI6BSuP-Epw-1
X-Mimecast-MFC-AGG-ID: gt92l9RLN1qwI6BSuP-Epw_1763369286
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4775d8428e8so50870305e9.0
 for <qemu-rust@nongnu.org>; Mon, 17 Nov 2025 00:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763369286; x=1763974086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=13wjDJAbYFD10gI6Zr7kk4dq3n61G4FXpl1Z3qYzA6A=;
 b=iytkJsiddbgiT1ZOiGdMMOevaGAMkhAIuO6/+0bI+d/Fze82Tk/2COWDVtpWj83i58
 BpwqhX7Yf79BRLNPgqIk/d6PhijcawuGWqfsO/Epsodt4ZV8CHIanDHwxMwlemAX/WwQ
 sF7BGqztJ/Qn0CD3ABviMlKAJeG9owYvMgywQvBA/gs4tv/yuzg5IYutlU1Q1l9HOI2D
 +eM+gZ1snJbBl6Hwd2YPuTVmfGAeMADXHD38ElDqS4UC0+ZT9A5DdO6hELn6bbfepWeT
 otRRmrB9qn2HQ8pUc8osDaSHSwsocPgFcARrxRvKoFtj/Yg7s4AdC32FfVSOFWcyVvce
 RM4A==
X-Gm-Message-State: AOJu0YwdZKysclS2VeA5h5DAT/xQOyVa5Q4X8GM7qbYuyo2458xwgw1h
 TWi8RYNKwrNg0nfqtnglu4ecvc3Ayyg5AdexxXu5MGVF2AE81rcDI8oya3mLEt6hj06mUlzKy8m
 QxcHed54mwvFYRuaVe1nCAbKJVM/nxpnDLmoP0AQ9RYs2HWLQn+MoPFE=
X-Gm-Gg: ASbGncsaYsllMljElHhSL2UxxW4ymrBz/s8fr8H3jmWyraK/p5GKt/upU9J712hULOz
 b1edcAlILDC3gvUwgb89UsUCIopKwblVzuBiu4L1IR/+1nb8hQQAKfo/+hgmL5YxeIbAQyFkJU9
 WXVpHEW1rdypq7xC8mq//2Z5rPXYFRGlLMt4zswZSTZnfTdg9fhjCcPUkXM0MWIlyRcIpt+cWZ7
 8AsdBhDDVcL1gDOlzvs9rQUDQknYAkIkqQljv0LWhHtZoW9o1pwNu26dth1gepiLqa6ja2qxDDm
 W2TnweFXcErdkrnwpjBy0LIw9DtP6bqmlouBmIMEF5gxhXpXZWzH1JwLQL72Am8qNR8EL9+5yfj
 g1FGr4DlnA34fjgE3/C7FQJy/VVgmQ6DNZv60MRvgjFOGhqvySxWsc8zNJzM5ugbCmArQ8E4wAA
 9AsvBN
X-Received: by 2002:a05:600c:8b4b:b0:477:755b:5587 with SMTP id
 5b1f17b1804b1-4778fe55405mr120246545e9.8.1763369286121; 
 Mon, 17 Nov 2025 00:48:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHO3LBJn+YbU5X+iaa8JqvmzPeaJKA7gO3VOUKYsFmhe8jI/H7VeCvb+7GHo+9dafbY/erqlQ==
X-Received: by 2002:a05:600c:8b4b:b0:477:755b:5587 with SMTP id
 5b1f17b1804b1-4778fe55405mr120246225e9.8.1763369285641; 
 Mon, 17 Nov 2025 00:48:05 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779920f2cdsm135766415e9.10.2025.11.17.00.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 00:48:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 4/5] rust: migration: implement ToMigrationState for Timer
Date: Mon, 17 Nov 2025 09:47:51 +0100
Message-ID: <20251117084752.203219-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117084752.203219-1-pbonzini@redhat.com>
References: <20251117084752.203219-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gMk8kXDjXYa0ReUi5PYE2dnssvEQNshONN8jJmM9vv0_1763369286
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Timer is a complex struct, allow adding it to a struct that
uses #[derive(ToMigrationState)]; similar to vmstate_timer, only
the expiration time has to be preserved.

In fact, because it is thread-safe, ToMigrationStateShared can
also be implemented without needing a cell or mutex that wraps
the timer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/timer/hpet/src/device.rs |  1 -
 rust/migration/src/migratable.rs | 31 +++++++++++++++++++++++++++++++
 rust/util/src/timer.rs           | 10 +++++++++-
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 5bcf151a680..373ec37bbd3 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -250,7 +250,6 @@ const fn get_individual_route(&self) -> usize {
 }
 
 /// HPET Timer Abstraction
-#[repr(C)]
 #[derive(Debug)]
 pub struct HPETTimer {
     /// timer N index within the timer block (`HPETState`)
diff --git a/rust/migration/src/migratable.rs b/rust/migration/src/migratable.rs
index 02efe31d72c..c82a6b9a7cf 100644
--- a/rust/migration/src/migratable.rs
+++ b/rust/migration/src/migratable.rs
@@ -140,6 +140,26 @@ fn restore_migrated_state_mut(
 
 impl_for_primitive!(u8, u16, u32, u64, i8, i16, i32, i64, bool);
 
+impl ToMigrationState for util::timer::Timer {
+    type Migrated = i64;
+
+    fn snapshot_migration_state(&self, target: &mut i64) -> Result<(), InvalidError> {
+        // SAFETY: as_ptr() is unsafe to ensure that the caller reasons about
+        // the pinning of the data inside the Opaque<>.  Here all we do is
+        // access a field.
+        *target = self.expire_time_ns().unwrap_or(-1);
+        Ok(())
+    }
+
+    fn restore_migrated_state_mut(
+        &mut self,
+        source: Self::Migrated,
+        version_id: u8,
+    ) -> Result<(), InvalidError> {
+        self.restore_migrated_state(source, version_id)
+    }
+}
+
 impl<T: ToMigrationState, const N: usize> ToMigrationState for [T; N]
 where
     [T::Migrated; N]: Default,
@@ -237,6 +257,17 @@ fn restore_migrated_state(
     ) -> Result<(), InvalidError>;
 }
 
+impl ToMigrationStateShared for util::timer::Timer {
+    fn restore_migrated_state(&self, source: i64, _version_id: u8) -> Result<(), InvalidError> {
+        if source >= 0 {
+            self.modify(source as u64);
+        } else {
+            self.delete();
+        }
+        Ok(())
+    }
+}
+
 impl<T: ToMigrationStateShared, const N: usize> ToMigrationStateShared for [T; N]
 where
     [T::Migrated; N]: Default,
diff --git a/rust/util/src/timer.rs b/rust/util/src/timer.rs
index 829f52d111e..4109d84c398 100644
--- a/rust/util/src/timer.rs
+++ b/rust/util/src/timer.rs
@@ -10,7 +10,8 @@
 use common::{callbacks::FnCall, Opaque};
 
 use crate::bindings::{
-    self, qemu_clock_get_ns, timer_del, timer_init_full, timer_mod, QEMUClockType,
+    self, qemu_clock_get_ns, timer_del, timer_expire_time_ns, timer_init_full, timer_mod,
+    QEMUClockType,
 };
 
 /// A safe wrapper around [`bindings::QEMUTimer`].
@@ -88,6 +89,13 @@ pub fn init_full<T, F>(
         }
     }
 
+    pub fn expire_time_ns(&self) -> Option<i64> {
+        // SAFETY: the only way to obtain a Timer safely is via methods that
+        // take a Pin<&mut Self>, therefore the timer is pinned
+        let ret = unsafe { timer_expire_time_ns(self.as_ptr()) };
+        i64::try_from(ret).ok()
+    }
+
     pub fn modify(&self, expire_time: u64) {
         // SAFETY: the only way to obtain a Timer safely is via methods that
         // take a Pin<&mut Self>, therefore the timer is pinned
-- 
2.51.1


