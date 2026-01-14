Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32865D37E3A
	for <qemu-rust@archiver.kernel.org>; Wed, 14 Jan 2026 13:50:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vg1Fe-0008GX-U3; Wed, 14 Jan 2026 08:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vg1Fd-0008DO-FR
 for qemu-rust@nongnu.org; Wed, 14 Jan 2026 08:49:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vg1Fb-0002GY-Fa
 for qemu-rust@nongnu.org; Wed, 14 Jan 2026 08:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768398570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pY1hxDGlHJnTX02EQhzRBcSZ2T5rcDS1TiA2uBU1QQY=;
 b=YU3lF/8+cx+sGVCxrAYH5Y14FFUMa0PoDj/WEp9x+coQ1N3S9MWcrdF9xr1e1t/wLTXtG4
 MlawgTPMhKYYNJGWJH7nO6C1Bj6Pbi61wWAtqd8HYvsV1JxN8a4UZMGRWbQzkKgwGj1ZHy
 8MwSBYE9rA9gVTLnluajeU6iD+V2l6E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-gQRwf4upMuiH9oN4mEEXqg-1; Wed, 14 Jan 2026 08:49:29 -0500
X-MC-Unique: gQRwf4upMuiH9oN4mEEXqg-1
X-Mimecast-MFC-AGG-ID: gQRwf4upMuiH9oN4mEEXqg_1768398568
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4775f51ce36so79592185e9.1
 for <qemu-rust@nongnu.org>; Wed, 14 Jan 2026 05:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768398568; x=1769003368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pY1hxDGlHJnTX02EQhzRBcSZ2T5rcDS1TiA2uBU1QQY=;
 b=DAgMmzT1cZrQKCmZZ7moGev3cMQfxL8Vq9XZ9LpdxT5ruuWX5juzBDe4fWaojLQ2hj
 9nOfiGRIrQADG3/Ty4V//PmFBvO9Cbm3V82f2Qqrlrfln5XwqLNjxrK2hw22TJ7qOexY
 5BDzegPUSYweYUHw+y7ooLXU5mEJ22DIZXVFULF2RJB9xgJYsTPxxbTVzhrCfraqDj3+
 e43koRHHuteywqyyg0Vn0DaVtHbzof7TTMRQVWXNreVgoFZl6boRALGrqu0m1IYyxtet
 Txbwz8CJ+4I0AbF/tFjo4KTLafUCI70o/lrskKdhoZy3uRfqkR892PRKfnNDWs3HWZeQ
 3aQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvlk8ZTkHoyJck/Pnozex4W2zn/mWUF8vqer+vuoQlG6Q9NI5PmJmInhi0vFn/aiLqwvIrdS7q1Kw=@nongnu.org
X-Gm-Message-State: AOJu0YwyFdMq/xLyDo3HwHMwIwhMQWiyKngcBovD4wnDJnQt3UH4zlSJ
 Vm0R4IPlm6r4UWa0mekQ+kJ1RTgsnGhCbOjWvT3KIEiThzLCEeqsdmAU/IEkDCuOK9YCHL6BaPi
 EbHHNcXgkzctPVpm88jfbWjVae+54gU7r36/wxYKFPp50e1Ijx6qIDhY=
X-Gm-Gg: AY/fxX4c8oYExy5jRxB0JuDJZ/B0O1z3Rq3Lc5nxfwF88wgMwSAy2SJZQ0OdYYjZc8F
 zOzUzbU1vGON1CAZNzU7S5uytemow+MMCCMIHSo8t5pf3ZQ7CpWLRjWhaBkzwpjjISFCTXngRXZ
 3DG3YSRkHI5eax8sGzbde5U8X+Io5c1YPMGGeqW7eiEJMzwgTNft3Np1Y/EgCIz3++SAj+3xfbw
 FVxMyl9q19+QiG8U17lGpB+bac9smDu5I3G0RCRcV+JOukTqd0oR0WvDSU2ym2YvVk7iBEsB7gG
 22tNAHqDaCOXfJlBnsSIs4gG0rpMZZazVQt9+wPcur5p7N6GA4FvBOnWCRbaWmzu8eeyTGYcQFU
 992VerfDVJQ7fHeNfSsujn93p5fehS1qZij6VhuQzABY2yQmQ7AF0c7E9kfpfCSEKfRmSNdWfW0
 C/h9aG2TEwg7TFeg==
X-Received: by 2002:a05:600c:528f:b0:477:abea:9023 with SMTP id
 5b1f17b1804b1-47ee330fd26mr29192825e9.9.1768398568044; 
 Wed, 14 Jan 2026 05:49:28 -0800 (PST)
X-Received: by 2002:a05:600c:528f:b0:477:abea:9023 with SMTP id
 5b1f17b1804b1-47ee330fd26mr29192525e9.9.1768398567566; 
 Wed, 14 Jan 2026 05:49:27 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee563ce5fsm29464335e9.13.2026.01.14.05.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 05:49:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH 3/3] rust: move hwcore::sysbus to system crate
Date: Wed, 14 Jan 2026 14:49:19 +0100
Message-ID: <20260114134919.1476518-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114134919.1476518-1-pbonzini@redhat.com>
References: <20260114134919.1476518-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DPvdvfVjuoCYlDXyiI7tpHKclfudj063ypIS_GaOJTg_1768398568
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

This inverts the dependency from hwcore to system, replacing it with
a dependency from system to hwcore.  It also matches how hw/core/sysbus.h
is part of the system-sys crate, and hw/core/sysbus.c is part of system_ss
on the C side.

This fixes a linker error in hwcore integration tests on msys2.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/core/Cargo.toml                | 1 -
 rust/hw/core/meson.build               | 2 +-
 rust/hw/core/src/irq.rs                | 4 ++--
 rust/hw/core/src/lib.rs                | 3 ---
 rust/hw/core/src/prelude.rs            | 5 -----
 rust/hw/core/tests/tests.rs            | 4 ++--
 rust/meson.build                       | 2 +-
 rust/system/Cargo.toml                 | 1 +
 rust/system/meson.build                | 2 +-
 rust/system/src/lib.rs                 | 3 +++
 rust/system/src/prelude.rs             | 5 +++++
 rust/{hw/core => system}/src/sysbus.rs | 7 ++-----
 12 files changed, 18 insertions(+), 21 deletions(-)
 rename rust/{hw/core => system}/src/sysbus.rs (96%)

diff --git a/rust/hw/core/Cargo.toml b/rust/hw/core/Cargo.toml
index 8cc514da202..d1ff71d5c37 100644
--- a/rust/hw/core/Cargo.toml
+++ b/rust/hw/core/Cargo.toml
@@ -21,7 +21,6 @@ bql = { path = "../../bql" }
 qom = { path = "../../qom" }
 chardev = { path = "../../chardev" }
 migration = { path = "../../migration" }
-system = { path = "../../system" }
 util = { path = "../../util" }
 
 [lints]
diff --git a/rust/hw/core/meson.build b/rust/hw/core/meson.build
index 28ea00cdb4f..6d1bfd4d204 100644
--- a/rust/hw/core/meson.build
+++ b/rust/hw/core/meson.build
@@ -3,7 +3,7 @@ _hwcore_rs = static_library(
   'src/lib.rs',
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
-  link_with: [_bql_rs, _chardev_rs, _migration_rs, _qom_rs, _system_rs, _util_rs],
+  link_with: [_bql_rs, _chardev_rs, _migration_rs, _qom_rs, _util_rs],
   dependencies: [glib_sys_rs, qemu_macros, common_rs, hwcore_sys_rs],
 )
 
diff --git a/rust/hw/core/src/irq.rs b/rust/hw/core/src/irq.rs
index e0d7784d97b..2a1ac9e6264 100644
--- a/rust/hw/core/src/irq.rs
+++ b/rust/hw/core/src/irq.rs
@@ -87,11 +87,11 @@ pub fn set(&self, level: T) {
         }
     }
 
-    pub(crate) const fn as_ptr(&self) -> *mut *mut bindings::IRQState {
+    pub const fn as_ptr(&self) -> *mut *mut bindings::IRQState {
         self.cell.as_ptr()
     }
 
-    pub(crate) const fn slice_as_ptr(slice: &[Self]) -> *mut *mut bindings::IRQState {
+    pub const fn slice_as_ptr(slice: &[Self]) -> *mut *mut bindings::IRQState {
         assert!(!slice.is_empty());
         slice[0].as_ptr()
     }
diff --git a/rust/hw/core/src/lib.rs b/rust/hw/core/src/lib.rs
index 76689fe7db1..6701dc52b65 100644
--- a/rust/hw/core/src/lib.rs
+++ b/rust/hw/core/src/lib.rs
@@ -14,6 +14,3 @@
 
 mod qdev;
 pub use qdev::*;
-
-mod sysbus;
-pub use sysbus::*;
diff --git a/rust/hw/core/src/prelude.rs b/rust/hw/core/src/prelude.rs
index 13f7dfc6809..45e86e178b1 100644
--- a/rust/hw/core/src/prelude.rs
+++ b/rust/hw/core/src/prelude.rs
@@ -9,9 +9,4 @@
 pub use crate::qdev::ResettablePhasesImpl;
 pub use crate::qdev::ResetType;
 
-pub use crate::sysbus::SysBusDevice;
-pub use crate::sysbus::SysBusDeviceClassExt;
-pub use crate::sysbus::SysBusDeviceImpl;
-pub use crate::sysbus::SysBusDeviceMethods;
-
 pub use crate::irq::InterruptSource;
diff --git a/rust/hw/core/tests/tests.rs b/rust/hw/core/tests/tests.rs
index 115dd7a860d..05aa5d4a377 100644
--- a/rust/hw/core/tests/tests.rs
+++ b/rust/hw/core/tests/tests.rs
@@ -142,7 +142,7 @@ fn test_cast() {
     let obj_ref: &Object = p_ref.upcast();
     assert_eq!(addr_of!(*obj_ref), p_ptr.cast());
 
-    let sbd_ref: Option<&SysBusDevice> = obj_ref.dynamic_cast();
+    let sbd_ref: Option<&DummyChildState> = obj_ref.dynamic_cast();
     assert!(sbd_ref.is_none());
 
     let dev_ref: Option<&DeviceState> = obj_ref.downcast();
@@ -150,7 +150,7 @@ fn test_cast() {
 
     // SAFETY: the cast is wrong, but the value is only used for comparison
     unsafe {
-        let sbd_ref: &SysBusDevice = obj_ref.unsafe_cast();
+        let sbd_ref: &DummyChildState = obj_ref.unsafe_cast();
         assert_eq!(addr_of!(*sbd_ref), p_ptr.cast());
     }
 }
diff --git a/rust/meson.build b/rust/meson.build
index 3a3e10d7b97..b6711fe77dd 100644
--- a/rust/meson.build
+++ b/rust/meson.build
@@ -42,9 +42,9 @@ subdir('util')
 subdir('bql')
 subdir('migration')
 subdir('qom')
-subdir('system')
 subdir('chardev')
 subdir('hw/core')
+subdir('system')
 subdir('tests')
 subdir('trace')
 subdir('hw')
diff --git a/rust/system/Cargo.toml b/rust/system/Cargo.toml
index f7fde9782ea..d6217370317 100644
--- a/rust/system/Cargo.toml
+++ b/rust/system/Cargo.toml
@@ -16,6 +16,7 @@ rust-version.workspace = true
 common = { path = "../common" }
 system-sys = { path = "../bindings/system-sys" }
 bql = { path = "../bql" }
+hwcore = { path = "../hw/core" }
 migration = { path = "../migration" }
 qom = { path = "../qom" }
 util = { path = "../util" }
diff --git a/rust/system/meson.build b/rust/system/meson.build
index 4cbd63cbbd7..89c1f2b84d1 100644
--- a/rust/system/meson.build
+++ b/rust/system/meson.build
@@ -1,7 +1,7 @@
 _system_rs = static_library(
   'system',
   'src/lib.rs',
-  link_with: [_bql_rs, _migration_rs, _qom_rs, _util_rs],
+  link_with: [_bql_rs, _hwcore_rs, _migration_rs, _qom_rs, _util_rs],
   dependencies: [glib_sys_rs, common_rs, qemu_macros, system_sys_rs],
 )
 
diff --git a/rust/system/src/lib.rs b/rust/system/src/lib.rs
index 10741e0ee0a..3b1666e62ce 100644
--- a/rust/system/src/lib.rs
+++ b/rust/system/src/lib.rs
@@ -9,3 +9,6 @@
 // for prelude-like modules
 #[rustfmt::skip]
 pub mod prelude;
+
+mod sysbus;
+pub use sysbus::*;
diff --git a/rust/system/src/prelude.rs b/rust/system/src/prelude.rs
index 2d98524c36e..5a8688ca343 100644
--- a/rust/system/src/prelude.rs
+++ b/rust/system/src/prelude.rs
@@ -6,3 +6,8 @@
 pub use crate::memory::MemoryRegionOps;
 pub use crate::memory::MemoryRegionOpsBuilder;
 pub use crate::memory::MemTxAttrs;
+
+pub use crate::sysbus::SysBusDevice;
+pub use crate::sysbus::SysBusDeviceClassExt;
+pub use crate::sysbus::SysBusDeviceImpl;
+pub use crate::sysbus::SysBusDeviceMethods;
diff --git a/rust/hw/core/src/sysbus.rs b/rust/system/src/sysbus.rs
similarity index 96%
rename from rust/hw/core/src/sysbus.rs
rename to rust/system/src/sysbus.rs
index 7db09a82c63..3c9aff51be0 100644
--- a/rust/hw/core/src/sysbus.rs
+++ b/rust/system/src/sysbus.rs
@@ -7,15 +7,12 @@
 use std::ffi::CStr;
 
 use common::Opaque;
+use hwcore::{prelude::*, IRQState};
 use qom::prelude::*;
-use system::MemoryRegion;
 pub use system_sys::SysBusDeviceClass;
 use util::{Error, Result};
 
-use crate::{
-    irq::{IRQState, InterruptSource},
-    qdev::{DeviceClassExt, DeviceImpl, DeviceState},
-};
+use crate::MemoryRegion;
 
 /// A safe wrapper around [`system_sys::SysBusDevice`].
 #[repr(transparent)]
-- 
2.52.0


