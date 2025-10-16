Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0603BCCD195
	for <qemu-rust@archiver.kernel.org>; Thu, 16 Oct 2025 14:56:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v9PPH-0000Aq-75; Thu, 16 Oct 2025 10:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v9PPF-0000AL-Mx
 for qemu-rust@nongnu.org; Thu, 16 Oct 2025 10:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v9PP2-0008Tt-3o
 for qemu-rust@nongnu.org; Thu, 16 Oct 2025 10:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760626585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bKRAus6HdVcn682X1+0P7SmXTLcO6cGl1ErIELft2Ds=;
 b=MAJwONfI4XL8F8d+DnG8ROYZQUfqivsvfHnx8uXX00sUU3D5RLuIhEZ4ekvuD8up/7IBD/
 p+PObx9CM5eMr+Phi+SfiRCSRDUx9KB3w2h8+vlL8CYH8/7UiyppF2tMRNvdcCeEnDJJTK
 ZHTL90qMvLe0ksW7zyG6USEEsE26NvM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-RbCgsGSUOJyzOvDiZoRFiA-1; Thu, 16 Oct 2025 10:56:23 -0400
X-MC-Unique: RbCgsGSUOJyzOvDiZoRFiA-1
X-Mimecast-MFC-AGG-ID: RbCgsGSUOJyzOvDiZoRFiA_1760626583
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-426ff59a320so623660f8f.3
 for <qemu-rust@nongnu.org>; Thu, 16 Oct 2025 07:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760626582; x=1761231382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKRAus6HdVcn682X1+0P7SmXTLcO6cGl1ErIELft2Ds=;
 b=i2qVlsCbf1rMAnf3qa5+GkEkx2+GnkGX2lOxtBaggDpCMtJh+QgXmfKRKx9ZNrOce6
 PKrgUGTzdQBaFSQrUGRkInN3hbUFH1Ch7XT5yUL0Zsd0x7y1jWy1O+3Trrg6MpCApFJi
 DYa96prg0vmSYYqFNPfIFQlXKyIJ+gnz7zu71/mteP/kT0O7fY1FIvnQDcnLZe9rgtfZ
 nht69hwFv39bBzzArLALH9qaj+ybLxp9ZoXR32sd4UAguXyZykiNOgoY4+7Z0d2Vu8RB
 d/Lq0HCmqhrF809UewpN8NM9gQcH/JOSZcrVZI4Ug1UQS8obhEhXu3c0IODZaK+8IUWP
 LWbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZXoO8W7XYf2uobGsy5wo3qPzc8T2CmtaotqC37Roi1AjlbKPs4LwZXAmhjj0m0EDL8vVk+9L7mvg=@nongnu.org
X-Gm-Message-State: AOJu0YxJBEYUJR+Kf6IC/PmidqxebOLODrm8q2dmtM89MhR9xyqpvrJ9
 EUIp6YqcpOgUsEOQ/bTY9uaWb9hKT2Y5gdfrF1LYlqHAnaGxezCJvgvWL1Um+q0oVljpgCu9hCm
 LNDZMoahybH7dKturhqucP32wtyYD/41aPGtfRqyZ2tyJpsmZ9gjB0s39TrQOewo=
X-Gm-Gg: ASbGnctRRLdaUX9fPhMSILQEhlSu9+AmdJyaq9YRsxklsOzjPPwkYwr9RtCPP+m3iLn
 LAb3if5fv2ttMkkGpg8xbqKOWvQNsI7DfIGg8UcRzYlasdc+8Q9bgMx96VkPklniXeqLd95gQGR
 CpXNhZKtiYLtvThrKf2iTdF0vlQhsRJenVcgPw5c4sSu1HJ3t7ClzNevfKKlQjzKmmWwTwhHR64
 7KFjlDzlDDyajFXfbxsfKiiaXK89Mx1WKegYM9YqefwVBA/QBoPkOGX8DPmp8u0ehb9zsRyMjE6
 rQyt/MDCYiXeJNhORXyyWp0UUZe27twSvJEg+lKQS3zhrY0/mVCyqzglkPuZZ+KImwnLU4Du6bA
 ekyyWEaZ5OEn5mSnP9HmLuMH6ABZ8g2q9TRTYif0+23JRqZwe3QZQ+bMxjTnHocehs+QHG4K/k6
 k=
X-Received: by 2002:a05:6000:2888:b0:427:2e8:fe53 with SMTP id
 ffacd0b85a97d-42704d7eac3mr294264f8f.6.1760626581612; 
 Thu, 16 Oct 2025 07:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnkNkx4gaoII/mtiHK6Q2V5m2qzQcfNwpWbBojpz75vSrsXpsXCqXBKm1vSpXxRfmrcCkYvA==
X-Received: by 2002:a05:6000:2888:b0:427:2e8:fe53 with SMTP id
 ffacd0b85a97d-42704d7eac3mr294246f8f.6.1760626581155; 
 Thu, 16 Oct 2025 07:56:21 -0700 (PDT)
Received: from [192.168.1.84] ([93.56.170.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47114460fe1sm33868415e9.17.2025.10.16.07.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 07:56:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: mkletzan@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH] rust: remove useless glib_sys bindings
Date: Thu, 16 Oct 2025 16:56:19 +0200
Message-ID: <20251016145619.1324585-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LBgXQgAsimaKyjSeeTuIu1h9xdFWz0Z11HbMI3s5smI_1760626583
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

From: Martin Kletzander <mkletzan@redhat.com>

The definition of types needed for g_autolist(), g_autoslist(),
g_autoqueue() need the imports for GList, GSList and GQueue
to appear everything.  Rust code is never going to see those,
since they are not used in structs.  Block the types from
appearing in the bindings.

Co-authored-by: Martin Kletzander <mkletzan@redhat.com>
Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                        | 1 +
 rust/bql/src/bindings.rs           | 2 +-
 rust/chardev/src/bindings.rs       | 4 ++--
 rust/hw/char/pl011/src/bindings.rs | 2 +-
 rust/hw/core/src/bindings.rs       | 2 +-
 rust/migration/src/bindings.rs     | 2 +-
 rust/qom/src/bindings.rs           | 2 +-
 rust/system/src/bindings.rs        | 2 +-
 rust/util/src/bindings.rs          | 2 +-
 9 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 25813490d22..6cb85b173d0 100644
--- a/meson.build
+++ b/meson.build
@@ -4255,6 +4255,7 @@ if have_rust
     '--allowlist-file', meson.project_source_root() + '/include/.*',
     '--allowlist-file', meson.project_build_root() + '/.*',
     '--blocklist-file', glib_pc.get_variable('includedir') + '/glib-2.0/.*',
+    '--blocklist-type', '.*_([a-z]*autoptr)$',
     ]
   if not rustfmt.found()
     if bindgen.version().version_compare('<0.65.0')
diff --git a/rust/bql/src/bindings.rs b/rust/bql/src/bindings.rs
index 8c70f3a87ce..efd76790fb2 100644
--- a/rust/bql/src/bindings.rs
+++ b/rust/bql/src/bindings.rs
@@ -19,7 +19,7 @@
 )]
 
 use glib_sys::{
-    guint, GArray, GHashTable, GHashTableIter, GList, GPollFD, GPtrArray, GQueue, GSList, GSource,
+    guint, GArray, GHashTable, GHashTableIter, GPollFD, GPtrArray, GSList, GSource,
 };
 
 #[cfg(MESON)]
diff --git a/rust/chardev/src/bindings.rs b/rust/chardev/src/bindings.rs
index c95dc89c56d..6447c72b7e3 100644
--- a/rust/chardev/src/bindings.rs
+++ b/rust/chardev/src/bindings.rs
@@ -20,8 +20,8 @@
 
 use common::Zeroable;
 use glib_sys::{
-    gboolean, guint, GArray, GHashTable, GHashTableIter, GIOCondition, GList, GMainContext,
-    GPollFD, GPtrArray, GQueue, GSList, GSource, GSourceFunc,
+    gboolean, guint, GArray, GHashTable, GHashTableIter, GIOCondition, GMainContext,
+    GPollFD, GPtrArray, GSList, GSource, GSourceFunc,
 };
 
 #[cfg(MESON)]
diff --git a/rust/hw/char/pl011/src/bindings.rs b/rust/hw/char/pl011/src/bindings.rs
index 52a76d0de5c..654be9185b1 100644
--- a/rust/hw/char/pl011/src/bindings.rs
+++ b/rust/hw/char/pl011/src/bindings.rs
@@ -22,7 +22,7 @@
 
 use glib_sys::{
     gboolean, guint, GArray, GByteArray, GHashTable, GHashTableIter, GIOCondition, GList,
-    GMainContext, GPollFD, GPtrArray, GQueue, GSList, GSource, GSourceFunc, GString,
+    GMainContext, GPollFD, GPtrArray, GSList, GSource, GSourceFunc, GString,
 };
 
 #[cfg(MESON)]
diff --git a/rust/hw/core/src/bindings.rs b/rust/hw/core/src/bindings.rs
index 65b9aae7536..dd334944600 100644
--- a/rust/hw/core/src/bindings.rs
+++ b/rust/hw/core/src/bindings.rs
@@ -21,7 +21,7 @@
 use chardev::bindings::Chardev;
 use common::Zeroable;
 use glib_sys::{
-    GArray, GByteArray, GHashTable, GHashTableIter, GList, GPtrArray, GQueue, GSList, GString,
+    GArray, GByteArray, GHashTable, GHashTableIter, GList, GPtrArray, GSList, GString,
 };
 use migration::bindings::VMStateDescription;
 use qom::bindings::ObjectClass;
diff --git a/rust/migration/src/bindings.rs b/rust/migration/src/bindings.rs
index 24503eb69bd..e9c058386c2 100644
--- a/rust/migration/src/bindings.rs
+++ b/rust/migration/src/bindings.rs
@@ -19,7 +19,7 @@
 )]
 
 use common::Zeroable;
-use glib_sys::{GHashTable, GHashTableIter, GList, GPtrArray, GQueue, GSList};
+use glib_sys::{GHashTable, GHashTableIter, GPtrArray, GSList};
 
 #[cfg(MESON)]
 include!("bindings.inc.rs");
diff --git a/rust/qom/src/bindings.rs b/rust/qom/src/bindings.rs
index 91de42f2426..e61259ec2ef 100644
--- a/rust/qom/src/bindings.rs
+++ b/rust/qom/src/bindings.rs
@@ -18,7 +18,7 @@
     clippy::too_many_arguments
 )]
 
-use glib_sys::{GHashTable, GHashTableIter, GList, GPtrArray, GQueue, GSList};
+use glib_sys::{GHashTable, GHashTableIter, GPtrArray, GSList};
 
 #[cfg(MESON)]
 include!("bindings.inc.rs");
diff --git a/rust/system/src/bindings.rs b/rust/system/src/bindings.rs
index 6cbb588de3d..2a5ba43c4f1 100644
--- a/rust/system/src/bindings.rs
+++ b/rust/system/src/bindings.rs
@@ -20,7 +20,7 @@
 
 use common::Zeroable;
 use glib_sys::{
-    guint, GArray, GByteArray, GHashTable, GHashTableIter, GList, GPollFD, GPtrArray, GQueue,
+    guint, GArray, GByteArray, GHashTable, GHashTableIter, GList, GPollFD, GPtrArray,
     GSList, GString,
 };
 
diff --git a/rust/util/src/bindings.rs b/rust/util/src/bindings.rs
index c277a295add..3514a66f5fa 100644
--- a/rust/util/src/bindings.rs
+++ b/rust/util/src/bindings.rs
@@ -18,7 +18,7 @@
     clippy::too_many_arguments
 )]
 
-use glib_sys::{guint, GList, GPollFD, GQueue, GSList, GString};
+use glib_sys::{guint, GPollFD, GString};
 
 #[cfg(MESON)]
 include!("bindings.inc.rs");
-- 
2.51.0


