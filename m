Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBF7CEACEF
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 07:44:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKttc-0003Vb-34; Mon, 17 Nov 2025 02:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtt4-0003SI-4a
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKtsz-0005vn-Tf
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 02:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763365372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/qrIn0AvFVaoDVF4vr0euvjESxVs46yfDtsWTtlMTM=;
 b=S6ZyOkdUyhru2mpe5XaOYRqM98VbJ77exD6iLPX34N9kUYBGsU97pOMtEsYwPDwM+E8gwf
 9J3Ye1oY9WDMYHOaT+z3igsl3bFNTkbVqD0nB37bKthX/C88QLcjvGz9Mr0rzR8LuPDQbz
 jFijjYUWEXYqGG8A9GIDEbFKK+Eo0yk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-fUKl0AKgMcOhRY6r_r4Ixg-1; Mon, 17 Nov 2025 02:42:50 -0500
X-MC-Unique: fUKl0AKgMcOhRY6r_r4Ixg-1
X-Mimecast-MFC-AGG-ID: fUKl0AKgMcOhRY6r_r4Ixg_1763365369
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47496b3c1dcso55394085e9.3
 for <qemu-rust@nongnu.org>; Sun, 16 Nov 2025 23:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763365368; x=1763970168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7/qrIn0AvFVaoDVF4vr0euvjESxVs46yfDtsWTtlMTM=;
 b=UGhV8LWp75oPZ7Lo1qVW5TN/B76EKU7M4JNyAIJSYE2xyrf6CTNM09Ovn4Hy71Rl7B
 vzZThqfQB7BifN/h/pKyHWi0LAQj9U3OiwHtiqSSN8TaNozxPtyaO66FWxRzpdkuMdpe
 DFOTdC301xGDhH0XyGRkgH3KgyEkgD9h2/sNWC3DuvoBGE8XGhhSvWdrrJa5seoG9m6B
 2jjvw6srHLqqXSiiu1EKpH6hxLA2adLm8xmqeBs2yLvdbLHIcQV56k4AK9KKU52xW4kJ
 qfuxpnIsHkhHLRVoa+A3WO8TWP3DAK+PCW6YIB90mtKFempQ4u9KzCKHXE8UkXrfSkE5
 WxEw==
X-Gm-Message-State: AOJu0Yw7ZfI3pyx4bTy92q0iqKt+aC5fXFTGgIc1pqSW+7nGW2lkjwDR
 eWGlwAvRLmkE10n2gcPIiQLJ/d2jqiWbiUMdMSaGrlu0ufwj055K4KLMDNpx9RzajrKPicvBun1
 qiq3O3+aPRtAn7B8waarjABRwP0eNOkFrbJh3ug8KELXMVV90z7KjdshQnCBxO6Y=
X-Gm-Gg: ASbGnctC1TZ/AFgeOKJFL6kzfxZmrmmmJEGRa7A401bLo9GempR/SFsrgzYN4a1FGzH
 OQ9YscCCWz0KQsCz/Wdk5QXnWuxZPBSBXIbjFwjhvOXlF6FmZcyRV+vpO4lZSgSEZWevjPQDvjZ
 IquQOn6B8iF2Gr1PuE7pB6iXSpTlYZS1u+wGIO6q5zyA5OCQLLwJmxr43I5/XHs/pKq5s4nwH5q
 w4aG8RXys4yA8IXc47FU8EKTsYhQ+sT5ZXXfbSFVwLmqACF/dbI5fBKow86hiQfokLHEVzqhhki
 DOS2uXg2kssFlxfHcbLlRRI3zrxJOtkrUIXuirghd+EA00M+tQ9EEg/pcoyyD+f9J9NMcKvwL0D
 oLRHdw2RB5gD80TOT2mXp6AgLRR4c1U0j+VU2yH2uynhOSKVCQiDop+XRCk9Ws/Q6hczP7GhMy1
 O1fJ+m
X-Received: by 2002:a05:600c:4503:b0:45b:80ff:58f7 with SMTP id
 5b1f17b1804b1-4778feb23dfmr97404225e9.36.1763365368299; 
 Sun, 16 Nov 2025 23:42:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGheM/f1OTkMQZwJPst9G+ieKpF0gUZlMwrJAkIuQzwGdTJtyn9KhW/OIelH1RaN/JHDTrOBg==
X-Received: by 2002:a05:600c:4503:b0:45b:80ff:58f7 with SMTP id
 5b1f17b1804b1-4778feb23dfmr97404055e9.36.1763365367922; 
 Sun, 16 Nov 2025 23:42:47 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779fab9b0esm73883205e9.12.2025.11.16.23.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 23:42:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 3/8] hwcore: add prelude
Date: Mon, 17 Nov 2025 08:42:33 +0100
Message-ID: <20251117074239.190424-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117074239.190424-1-pbonzini@redhat.com>
References: <20251117074239.190424-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YMSOki_kCyuYJ_c2nl3tQn-5CYjEeMNJYYEZ3tCeYuQ_1763365369
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
 rust/hw/char/pl011/src/device.rs |  5 +----
 rust/hw/core/meson.build         |  1 +
 rust/hw/core/src/lib.rs          |  5 +++++
 rust/hw/core/src/prelude.rs      | 14 ++++++++++++++
 rust/hw/core/tests/tests.rs      |  2 +-
 rust/hw/timer/hpet/src/device.rs |  5 +----
 6 files changed, 23 insertions(+), 9 deletions(-)
 create mode 100644 rust/hw/core/src/prelude.rs

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index b7e8e393d2e..164f27d5bb2 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -7,10 +7,7 @@
 use bql::BqlRefCell;
 use chardev::{CharFrontend, Chardev, Event};
 use common::prelude::*;
-use hwcore::{
-    Clock, ClockEvent, DeviceImpl, DeviceMethods, DeviceState, IRQState, InterruptSource,
-    ResetType, ResettablePhasesImpl, SysBusDevice, SysBusDeviceImpl, SysBusDeviceMethods,
-};
+use hwcore::{prelude::*, ClockEvent, IRQState};
 use migration::{
     self, impl_vmstate_forward, impl_vmstate_struct, vmstate_fields, vmstate_of,
     vmstate_subsections, vmstate_unused, VMStateDescription, VMStateDescriptionBuilder,
diff --git a/rust/hw/core/meson.build b/rust/hw/core/meson.build
index 1560dd20c6b..fa1765a2302 100644
--- a/rust/hw/core/meson.build
+++ b/rust/hw/core/meson.build
@@ -51,6 +51,7 @@ _hwcore_rs = static_library(
       'src/lib.rs',
       'src/bindings.rs',
       'src/irq.rs',
+      'src/prelude.rs',
       'src/qdev.rs',
       'src/sysbus.rs',
     ],
diff --git a/rust/hw/core/src/lib.rs b/rust/hw/core/src/lib.rs
index b40801eb843..491743d2b9d 100644
--- a/rust/hw/core/src/lib.rs
+++ b/rust/hw/core/src/lib.rs
@@ -8,6 +8,11 @@
 mod irq;
 pub use irq::*;
 
+// preserve one-item-per-"use" syntax, it is clearer
+// for prelude-like modules
+#[rustfmt::skip]
+pub mod prelude;
+
 mod qdev;
 pub use qdev::*;
 
diff --git a/rust/hw/core/src/prelude.rs b/rust/hw/core/src/prelude.rs
new file mode 100644
index 00000000000..c544c317b39
--- /dev/null
+++ b/rust/hw/core/src/prelude.rs
@@ -0,0 +1,14 @@
+//! Essential types and traits intended for blanket imports.
+
+pub use crate::qdev::Clock;
+pub use crate::qdev::DeviceState;
+pub use crate::qdev::DeviceImpl;
+pub use crate::qdev::DeviceMethods;
+pub use crate::qdev::ResettablePhasesImpl;
+pub use crate::qdev::ResetType;
+
+pub use crate::sysbus::SysBusDevice;
+pub use crate::sysbus::SysBusDeviceImpl;
+pub use crate::sysbus::SysBusDeviceMethods;
+
+pub use crate::irq::InterruptSource;
diff --git a/rust/hw/core/tests/tests.rs b/rust/hw/core/tests/tests.rs
index 247d812866d..b39d1501d5b 100644
--- a/rust/hw/core/tests/tests.rs
+++ b/rust/hw/core/tests/tests.rs
@@ -5,7 +5,7 @@
 use std::{ffi::CStr, ptr::addr_of};
 
 use bql::BqlCell;
-use hwcore::{DeviceImpl, DeviceState, ResettablePhasesImpl, SysBusDevice};
+use hwcore::prelude::*;
 use migration::{VMStateDescription, VMStateDescriptionBuilder};
 use qom::{prelude::*, ObjectImpl, ParentField};
 use util::bindings::{module_call_init, module_init_type};
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index e9c7afa24d5..7ab9897cdfb 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -12,10 +12,7 @@
 
 use bql::{BqlCell, BqlRefCell};
 use common::prelude::*;
-use hwcore::{
-    DeviceImpl, DeviceMethods, DeviceState, InterruptSource, ResetType, ResettablePhasesImpl,
-    SysBusDevice, SysBusDeviceImpl, SysBusDeviceMethods,
-};
+use hwcore::prelude::*;
 use migration::{
     self, impl_vmstate_struct, vmstate_fields, vmstate_of, vmstate_subsections, vmstate_validate,
     VMStateDescription, VMStateDescriptionBuilder,
-- 
2.51.1


