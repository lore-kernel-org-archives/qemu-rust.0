Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27488CE8D6B
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 07:44:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKttk-0003ZE-H3; Mon, 17 Nov 2025 02:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKttI-0003TH-0M
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKttE-0005yE-5p
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763365387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYpXvQqc4dVmIfdFRG0SX4W7X90x8XVMn1XK0b+T/Is=;
 b=PHMrzzMbZ7QDy6/QwqxhampxTv+jjdFElnP26UnZcK26875MgvoKVELtHO+Yx9ofWDL5gc
 hzNEF6NuB3zwLw+YaKp4CtfyxBQPqml0kQxPtILHndvciGHVbuqhqYGF4Y8mQJhlHeEpHi
 QrTxofKH7EIu5J0P5oOmCbK8SUPqgC4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-YBSOLCP-Mny4xg8ZYcOkrw-1; Mon, 17 Nov 2025 02:42:52 -0500
X-MC-Unique: YBSOLCP-Mny4xg8ZYcOkrw-1
X-Mimecast-MFC-AGG-ID: YBSOLCP-Mny4xg8ZYcOkrw_1763365371
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4779b3749a8so9935345e9.1
 for <qemu-rust@nongnu.org>; Sun, 16 Nov 2025 23:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763365370; x=1763970170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LYpXvQqc4dVmIfdFRG0SX4W7X90x8XVMn1XK0b+T/Is=;
 b=l4fvCEx/jERwVLHBecahtbCzzckA0aZDKFCeYomDQCe8V20nc/cQcLOroLe9+OS7uU
 1qALI+BCG82gVA+kK/era848Degp3lXOjzIzw2aK8hwQjYFTUkP65YNoF+u3zvmXIzdL
 HmlOhNEDEn6jM+z1HhN+D90hou7p5rXu4zFd+rPZ+GzuOTyXFY+iyIGoJRCU6WKpFUM2
 Xts/yQLumO2iYodfg/SXdnTED2Re8dWVc1KwjKIEu1uPblV1CMpt3jW+UT0a0rbrlpoe
 qi4Z1dj5lAzsWBNpdZKn2PVMDQuqj8gbWi7uxYdGbYSOplph+jVO1IFIGLHRpl6kei2T
 WZKA==
X-Gm-Message-State: AOJu0YxrTVisJe5dE0DblbRRnnK5vE1FLp3vIqemGFVYIlanAWGfHV1D
 Aohps/slpJYyzEP8iCg8NTmdVWdybi8zkqYwJOjXcFwuJEaE4QcFjnhWJja1dIc7IIqo14rik3Z
 Thz5B6/YIyDtlSaGRf4GaIR/Ln/3GvJhjgvkFgLcM4WSM77fbywUgZq0rnFOQj08=
X-Gm-Gg: ASbGncvE2rSw/2myyO1n+KWRNBioi7YjjfrECUDQgv/GZ/RDhtwnm4FEcO+a9wNyNdv
 I1L/GJ4OrJoSaiEcibsBjkG1alDOU3DPy9aR5tnvXTRTDdZ7nZ0l8mJqwwPbGCA9WERL9LqMkt1
 rBeFXQJsWsKYM4KLV4545sgFtfKf6lJGWvIFqvzPk9JVVWmBruZysoe6PvfPqdJh3wwFh23WVKe
 tHFbrfoTG9yXbniHBaC8bcD1aakMsLGQoJCe7MHPmkJ0SrtOhRO8n3G1iLYCzTITbHyjkVZj53x
 UAQaRHrSmtooEoc74D63mrLL0dQqsvFVBdyRI9748qGDMn61Q7wjiI6nWLHcK7BsAksJN7/DxrG
 alHFPW0jEgta7R/sEDLIiKzEW4zMAcq+3zxGHJT8HAU8z9/jRJ/jcH+HkYpychmZJ3BudPDEsWU
 HfpEsy
X-Received: by 2002:a05:600c:1f0f:b0:471:1774:3003 with SMTP id
 5b1f17b1804b1-4778feb51f6mr97242825e9.29.1763365370563; 
 Sun, 16 Nov 2025 23:42:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvfpiujz2PjslU/fzkxoftfg1QXzoLa0wphtavKXdIOKrErzSsZ1Uo4oa3poXjHmecuuDvtA==
X-Received: by 2002:a05:600c:1f0f:b0:471:1774:3003 with SMTP id
 5b1f17b1804b1-4778feb51f6mr97242645e9.29.1763365370084; 
 Sun, 16 Nov 2025 23:42:50 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47799768409sm123528535e9.3.2025.11.16.23.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 23:42:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 4/8] migration: add prelude
Date: Mon, 17 Nov 2025 08:42:34 +0100
Message-ID: <20251117074239.190424-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117074239.190424-1-pbonzini@redhat.com>
References: <20251117074239.190424-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cgX-fyzliaPnIhnMRxI4X_sDBoAi6NnB7PcPLg0fAwA_1763365371
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 rust/chardev/src/prelude.rs       |  3 +++
 rust/hw/char/pl011/src/device.rs  |  5 +----
 rust/hw/core/tests/tests.rs       |  2 +-
 rust/hw/timer/hpet/src/device.rs  |  5 +----
 rust/migration/meson.build        |  1 +
 rust/migration/src/lib.rs         |  5 +++++
 rust/migration/src/prelude.rs     | 19 +++++++++++++++++++
 rust/tests/tests/vmstate_tests.rs |  5 ++---
 8 files changed, 33 insertions(+), 12 deletions(-)
 create mode 100644 rust/chardev/src/prelude.rs
 create mode 100644 rust/migration/src/prelude.rs

diff --git a/rust/chardev/src/prelude.rs b/rust/chardev/src/prelude.rs
new file mode 100644
index 00000000000..9f0b561bfab
--- /dev/null
+++ b/rust/chardev/src/prelude.rs
@@ -0,0 +1,3 @@
+//! Essential types and traits intended for blanket imports.
+
+pub use crate::chardev::{Chardev, CharFrontend, Event};
\ No newline at end of file
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 164f27d5bb2..2e4ccc9b231 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -8,10 +8,7 @@
 use chardev::{CharFrontend, Chardev, Event};
 use common::prelude::*;
 use hwcore::{prelude::*, ClockEvent, IRQState};
-use migration::{
-    self, impl_vmstate_forward, impl_vmstate_struct, vmstate_fields, vmstate_of,
-    vmstate_subsections, vmstate_unused, VMStateDescription, VMStateDescriptionBuilder,
-};
+use migration::{self, prelude::*};
 use qom::{prelude::*, ObjectImpl, Owned, ParentField, ParentInit};
 use system::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder};
 use util::prelude::*;
diff --git a/rust/hw/core/tests/tests.rs b/rust/hw/core/tests/tests.rs
index b39d1501d5b..f38376d0016 100644
--- a/rust/hw/core/tests/tests.rs
+++ b/rust/hw/core/tests/tests.rs
@@ -6,7 +6,7 @@
 
 use bql::BqlCell;
 use hwcore::prelude::*;
-use migration::{VMStateDescription, VMStateDescriptionBuilder};
+use migration::prelude::*;
 use qom::{prelude::*, ObjectImpl, ParentField};
 use util::bindings::{module_call_init, module_init_type};
 
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 7ab9897cdfb..4ff1779a3d2 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -13,10 +13,7 @@
 use bql::{BqlCell, BqlRefCell};
 use common::prelude::*;
 use hwcore::prelude::*;
-use migration::{
-    self, impl_vmstate_struct, vmstate_fields, vmstate_of, vmstate_subsections, vmstate_validate,
-    VMStateDescription, VMStateDescriptionBuilder,
-};
+use migration::{self, prelude::*};
 use qom::{prelude::*, ObjectImpl, ParentField, ParentInit};
 use system::{
     bindings::{address_space_memory, address_space_stl_le, hwaddr},
diff --git a/rust/migration/meson.build b/rust/migration/meson.build
index 444494700ad..d7af2129490 100644
--- a/rust/migration/meson.build
+++ b/rust/migration/meson.build
@@ -32,6 +32,7 @@ _migration_rs = static_library(
       'src/lib.rs',
       'src/bindings.rs',
       'src/migratable.rs',
+      'src/prelude.rs',
       'src/vmstate.rs',
     ],
     {'.' : _migration_bindings_inc_rs},
diff --git a/rust/migration/src/lib.rs b/rust/migration/src/lib.rs
index c9bdf0d4133..32e182e716a 100644
--- a/rust/migration/src/lib.rs
+++ b/rust/migration/src/lib.rs
@@ -7,5 +7,10 @@
 pub mod migratable;
 pub use migratable::*;
 
+// preserve one-item-per-"use" syntax, it is clearer
+// for prelude-like modules
+#[rustfmt::skip]
+pub mod prelude;
+
 pub mod vmstate;
 pub use vmstate::*;
diff --git a/rust/migration/src/prelude.rs b/rust/migration/src/prelude.rs
new file mode 100644
index 00000000000..797e7ec59d1
--- /dev/null
+++ b/rust/migration/src/prelude.rs
@@ -0,0 +1,19 @@
+//! Essential types and traits intended for blanket imports.
+
+// Core migration traits and types
+pub use crate::vmstate::VMState;
+pub use crate::vmstate::VMStateDescription;
+pub use crate::vmstate::VMStateDescriptionBuilder;
+
+// Migratable wrappers
+pub use crate::migratable::Migratable;
+pub use crate::ToMigrationState;
+
+// Commonly used macros
+pub use crate::impl_vmstate_forward;
+pub use crate::impl_vmstate_struct;
+pub use crate::vmstate_fields;
+pub use crate::vmstate_of;
+pub use crate::vmstate_subsections;
+pub use crate::vmstate_unused;
+pub use crate::vmstate_validate;
diff --git a/rust/tests/tests/vmstate_tests.rs b/rust/tests/tests/vmstate_tests.rs
index fa9bbd6a122..c3f9e1c7436 100644
--- a/rust/tests/tests/vmstate_tests.rs
+++ b/rust/tests/tests/vmstate_tests.rs
@@ -16,9 +16,8 @@
         vmstate_info_bool, vmstate_info_int32, vmstate_info_int64, vmstate_info_int8,
         vmstate_info_uint64, vmstate_info_uint8, vmstate_info_unused_buffer, VMStateFlags,
     },
-    impl_vmstate_forward, impl_vmstate_struct,
-    vmstate::{VMStateDescription, VMStateDescriptionBuilder, VMStateField},
-    vmstate_fields, vmstate_of, vmstate_unused, vmstate_validate,
+    prelude::*,
+    vmstate::VMStateField,
 };
 
 const FOO_ARRAY_MAX: usize = 3;
-- 
2.51.1


