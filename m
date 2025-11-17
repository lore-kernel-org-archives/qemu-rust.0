Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062D6CEACEF
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 07:44:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKttl-0003Zk-7U; Mon, 17 Nov 2025 02:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtt8-0003Sr-Iv
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtt6-0005wf-QU
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763365379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GygTWM71YJQuelKl4+w4JM0b7Dy3UCtb9HIa+5b46AQ=;
 b=DE6Ue7mfme4dN/mUZWZGJXKGsaNkGPD4iXGb1jDzIvl7/nEj/8EiACIF5U4WbPWCWepYU/
 2jks4HN7WEfClib3H4K8fEl5n+kcpWeomPwlqGgD69FC6IGTorjcDNrEpwEmatrMQo75Dk
 xeU5RtjbLk+TXTJs0yQ0sGpTB0oh5gg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-bHH-TRnjNUWKhRGthjg2Eg-1; Mon, 17 Nov 2025 02:42:57 -0500
X-MC-Unique: bHH-TRnjNUWKhRGthjg2Eg-1
X-Mimecast-MFC-AGG-ID: bHH-TRnjNUWKhRGthjg2Eg_1763365376
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477563e531cso32737255e9.1
 for <qemu-rust@nongnu.org>; Sun, 16 Nov 2025 23:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763365376; x=1763970176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GygTWM71YJQuelKl4+w4JM0b7Dy3UCtb9HIa+5b46AQ=;
 b=rub5DycpaCbA3Hw/uq9Z/MQpDmzsr1wVaydk2lw7//aNJY+myJc8ldhCrbMe7tYgL6
 vaOiHMcQW2r5lsc4xBG7+HUxu3vBB4Er7/DyXWytrIZiI0pSrD3tA5Hl4/jmYzPgEOoz
 cf/3/veSliohd7P4UVnViq5htb02IMHrN5V1AMwQXgIPVmZMdbtk9nV2QW2WQoi308XI
 39M1QxCiyfULXU4ZOPk1qrDfCIz0+FceFm/j3k3PPlUeJ5YQLW8Iqy32kJYDkJQApJLP
 qqbeAWYYZ9RL93PGMe+LeMwpLArF96xYLvBEhJsrd/6NfLwtDdBWZheu+JCosw/+68X+
 Jjsw==
X-Gm-Message-State: AOJu0Yyn8Qk5fswxeQLcZqkqB3vGgH6J1b0CQnmjJ/teryHQI7Xneji9
 2alyAZxiD/O7hnZnwcQgIv+qmZE8HixZUCHwcJTrJ/dZ8awhZxaVUMtSvBmtEtZhlmZcM81HKWC
 bA7CazDfvzQDtxcycUjk+8lqxFXjU4Fj5ezWPYCoqTNoXnE5rAoPYBjULcKLS2ms=
X-Gm-Gg: ASbGncunj+wTwZoSlsUIC7gMBog7Ya3sf2YaS0sQU9WCvRTvT1AOSOFmPp/46RryIDV
 fXI4Wxjl52ftypNEH58GKEV8AqxlMZsXZU6BJEfgdoAk8U7mQpeHgp1l6714bv15+kgD50HKnqQ
 OXNq2J1WNc2AHxgFouLl1VxHCM6rlgVRaGckkzRohAYTgvPLCikxuRT/IlYKq4ABbK7zmwCTA+u
 3Gw1n2RG8ykzU5Q7u6e3/FeTtfBHStIkNE3CfvYgvn0DS/X7NUo6caM1pUK2hi2LZTJ20lfV2rg
 I57/leMqB2tG6f6c67gMMDEtSaRhO+lVPWAIlnkQwQcIA9+LUHayhyaTu4KXyJ8OjCVK7CTDHFI
 BPE1JK1TqE4eTtVKROPmRvUoI78I+vc01BHwzFQXw0DeAfRjJDQtDrWr8/YWUvXvKglHrceyM8X
 Zif3O1
X-Received: by 2002:a05:600c:3b12:b0:475:dcbb:7903 with SMTP id
 5b1f17b1804b1-4778fe5c87amr102518995e9.9.1763365375587; 
 Sun, 16 Nov 2025 23:42:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3TSxkFmvzdmZyZt4ZbpVfA8/q3zkvsVFvxypOHoR9O1h1OuytUVhgHmoptLSTCc11/kbDGw==
X-Received: by 2002:a05:600c:3b12:b0:475:dcbb:7903 with SMTP id
 5b1f17b1804b1-4778fe5c87amr102518885e9.9.1763365375158; 
 Sun, 16 Nov 2025 23:42:55 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e45677sm297822465e9.8.2025.11.16.23.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 23:42:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 6/8] bql: add prelude
Date: Mon, 17 Nov 2025 08:42:36 +0100
Message-ID: <20251117074239.190424-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117074239.190424-1-pbonzini@redhat.com>
References: <20251117074239.190424-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -KdVXDIXTfOwKVZRNjZDfZrkE6zHN1NJGPwMQLru_HA_1763365376
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/bql/meson.build              | 1 +
 rust/bql/src/lib.rs               | 5 +++++
 rust/bql/src/prelude.rs           | 4 ++++
 rust/chardev/src/chardev.rs       | 2 +-
 rust/hw/char/pl011/src/device.rs  | 2 +-
 rust/hw/core/tests/tests.rs       | 2 +-
 rust/hw/timer/hpet/src/device.rs  | 2 +-
 rust/migration/src/migratable.rs  | 2 +-
 rust/tests/tests/vmstate_tests.rs | 2 +-
 9 files changed, 16 insertions(+), 6 deletions(-)
 create mode 100644 rust/bql/src/prelude.rs

diff --git a/rust/bql/meson.build b/rust/bql/meson.build
index 091372dd7b6..90aaadaa6d6 100644
--- a/rust/bql/meson.build
+++ b/rust/bql/meson.build
@@ -31,6 +31,7 @@ _bql_rs = static_library(
       'src/lib.rs',
       'src/bindings.rs',
       'src/cell.rs',
+      'src/prelude.rs',
     ],
     {'.': _bql_bindings_inc_rs}
   ),
diff --git a/rust/bql/src/lib.rs b/rust/bql/src/lib.rs
index ef08221e9c1..d2fea5db1ac 100644
--- a/rust/bql/src/lib.rs
+++ b/rust/bql/src/lib.rs
@@ -6,6 +6,11 @@
 mod cell;
 pub use cell::*;
 
+// preserve one-item-per-"use" syntax, it is clearer
+// for prelude-like modules
+#[rustfmt::skip]
+pub mod prelude;
+
 /// An internal function that is used by doctests.
 pub fn start_test() {
     // SAFETY: integration tests are run with --test-threads=1, while
diff --git a/rust/bql/src/prelude.rs b/rust/bql/src/prelude.rs
new file mode 100644
index 00000000000..42031ec18ab
--- /dev/null
+++ b/rust/bql/src/prelude.rs
@@ -0,0 +1,4 @@
+//! Essential types and traits intended for blanket imports.
+
+pub use crate::cell::BqlCell;
+pub use crate::cell::BqlRefCell;
diff --git a/rust/chardev/src/chardev.rs b/rust/chardev/src/chardev.rs
index f0b7975dbf7..fb9674b3fb4 100644
--- a/rust/chardev/src/chardev.rs
+++ b/rust/chardev/src/chardev.rs
@@ -18,7 +18,7 @@
     slice,
 };
 
-use bql::{BqlRefCell, BqlRefMut};
+use bql::{prelude::*, BqlRefMut};
 use common::{callbacks::FnCall, errno, Opaque};
 use qom::prelude::*;
 
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index ff929e60993..be1bdf5ab12 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -4,7 +4,7 @@
 
 use std::{ffi::CStr, mem::size_of};
 
-use bql::BqlRefCell;
+use bql::prelude::*;
 use chardev::prelude::*;
 use common::prelude::*;
 use hwcore::{prelude::*, ClockEvent, IRQState};
diff --git a/rust/hw/core/tests/tests.rs b/rust/hw/core/tests/tests.rs
index f38376d0016..e60c9d018f5 100644
--- a/rust/hw/core/tests/tests.rs
+++ b/rust/hw/core/tests/tests.rs
@@ -4,7 +4,7 @@
 
 use std::{ffi::CStr, ptr::addr_of};
 
-use bql::BqlCell;
+use bql::prelude::*;
 use hwcore::prelude::*;
 use migration::prelude::*;
 use qom::{prelude::*, ObjectImpl, ParentField};
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 4ff1779a3d2..b7153a46e31 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -10,7 +10,7 @@
     slice::from_ref,
 };
 
-use bql::{BqlCell, BqlRefCell};
+use bql::prelude::*;
 use common::prelude::*;
 use hwcore::prelude::*;
 use migration::{self, prelude::*};
diff --git a/rust/migration/src/migratable.rs b/rust/migration/src/migratable.rs
index ded6fe8f4a6..ce603867502 100644
--- a/rust/migration/src/migratable.rs
+++ b/rust/migration/src/migratable.rs
@@ -9,7 +9,7 @@
     sync::{Arc, Mutex},
 };
 
-use bql::{BqlCell, BqlRefCell};
+use bql::prelude::*;
 use common::Zeroable;
 
 use crate::{
diff --git a/rust/tests/tests/vmstate_tests.rs b/rust/tests/tests/vmstate_tests.rs
index c3f9e1c7436..87176a80990 100644
--- a/rust/tests/tests/vmstate_tests.rs
+++ b/rust/tests/tests/vmstate_tests.rs
@@ -9,7 +9,7 @@
     slice,
 };
 
-use bql::BqlCell;
+use bql::prelude::*;
 use common::Opaque;
 use migration::{
     bindings::{
-- 
2.51.1


