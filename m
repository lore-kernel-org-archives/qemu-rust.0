Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYiEG-0001zy-Rw
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiEB-0001uR-Lx
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiE8-00085K-CN
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737104474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mVJNc6AglKjjRuDFE0OkssFaL2nSeryQ2XLRS9fMKB0=;
 b=DAbxtGXZ/aYvNKSpsqjvu3+mT0+eJ+sXUIkMOPiRiWYecMFhsbRZ4d14TKPYFOZjT0W6s+
 MIz1Sn7UNOXYEu6AbFPMsx3JG1ZeEYma5l+Re/a6Ca1lxVxaXfGPGvSaeBP7hqUSDXOZzr
 6bHeyHea3cy2y3+ofHBt1n1ObbIpKzU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-rAQX3giENOOyx3fuchySRQ-1; Fri, 17 Jan 2025 04:01:13 -0500
X-MC-Unique: rAQX3giENOOyx3fuchySRQ-1
X-Mimecast-MFC-AGG-ID: rAQX3giENOOyx3fuchySRQ
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aa6b904a886so155822466b.0
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104471; x=1737709271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mVJNc6AglKjjRuDFE0OkssFaL2nSeryQ2XLRS9fMKB0=;
 b=F/f0vq6b3IZ+drYNsSho/+FC/O6tXQoPbGsZycylbUhWccSbLykj8PHallXO7n7VOf
 xKOr6GxmLiLCw/7Hll6gHKOQhN+oc3LKGR3g1mDaDFPSQN2qVQjmLABESxDBeuPv0NHv
 PdHqXb7cOy3txhtJqR/7qffcte8gly//dVe0FT1HrAVpbv/rGxgrn0O01NOnMg7+BKeU
 Y5SGnvVmj99uh5J5p9sJKTzNNgZNAn/mF5WiKILMiI2ZHOvFXce3zlIlZVJPBfICLR0c
 unvwvKSsVoZ7jWW3IY/4jyJ+Yt0nRQy0OsqTtnM8hTAM5Bng0gNQZE3nLWQD+TZjXbh3
 PXpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb2qWmyxG0KjtQoGBd3rSHPu6eg97adPzt7sLS38JXIm2cYA+SbWl/DQkiNnDVe1gohODdyyTXfFo=@nongnu.org
X-Gm-Message-State: AOJu0YyaBbFZmB2ba+WDTAwhcoYJPgT0FpZ73RMiCO3Abu3gl8cQ01CC
 i+gTdSuHhQLhoRt1hG1IIwbTlGIOfia/Of1r0fzVHToRce76HZbn6Sfu/tqLwrIlJY7rRqeIGFb
 m4ZRqXnQRjlZGMxmXyqoxny+KWBGo9wZxPU0iBR5UZV9Bd7/JUwc86sgAs665XQ==
X-Gm-Gg: ASbGncsjj5Eo7CqEki9jb7/+TQ81k+oV2Nz21nNOkc6/g7iM4oE5D4/DJuSOvs6B11v
 8b6SDVTr3FbvxDlIKppf6qga3I+j+XujHsLZq+oCDe1uznLbq+Tk+pXWHnMT9KDKOEgyDtSRDGj
 mRlDBURHdifvanIzgiYC+9+8rEWG2UvfiXxuZfuFAejuP9/4iBpFVwzGHrgGH0Qj6SUHJWlnMjc
 kpEAsDkn77cFWHiMmsbB42HBcv+OyacbR3zQ7REnBf8j+G4ilWj1BDpjbNk
X-Received: by 2002:a17:907:7d94:b0:aaf:a2d9:234 with SMTP id
 a640c23a62f3a-ab38b3854f1mr165245966b.39.1737104470907; 
 Fri, 17 Jan 2025 01:01:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH83FiXv9YRjp81EkpVQaRkyUnAcloLnSxcemqiGi8X9ztQ+Lrl/JnJQo+c+1/Js/qDIu7dzQ==
X-Received: by 2002:a17:907:7d94:b0:aaf:a2d9:234 with SMTP id
 a640c23a62f3a-ab38b3854f1mr165243566b.39.1737104470401; 
 Fri, 17 Jan 2025 01:01:10 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce106csm134567866b.45.2025.01.17.01.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:01:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 08/10] rust: pl011: switch vmstate to new-style macros
Date: Fri, 17 Jan 2025 10:00:44 +0100
Message-ID: <20250117090046.1045010-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117090046.1045010-1-pbonzini@redhat.com>
References: <20250117090046.1045010-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sw4-JjPR5YJS1cHEJfVStEDx3JCkEeZWpNLcfoYEwpA_1737104472
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Jan 2025 09:01:20 -0000

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs       |  3 ++-
 rust/hw/char/pl011/src/device_class.rs | 36 +++++++++++++-------------
 rust/hw/char/pl011/src/lib.rs          |  6 +++++
 3 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 994c2fc0593..11a87664c7a 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -10,7 +10,7 @@
 
 use qemu_api::{
     bindings::{self, *},
-    c_str,
+    c_str, impl_vmstate_forward,
     irq::InterruptSource,
     prelude::*,
     qdev::DeviceImpl,
@@ -54,6 +54,7 @@ impl DeviceId {
 #[repr(transparent)]
 #[derive(Debug, Default)]
 pub struct Fifo([registers::Data; PL011_FIFO_DEPTH as usize]);
+impl_vmstate_forward!(Fifo);
 
 impl Fifo {
     const fn len(&self) -> u32 {
diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/src/device_class.rs
index 7f3ca895071..e0d3532e956 100644
--- a/rust/hw/char/pl011/src/device_class.rs
+++ b/rust/hw/char/pl011/src/device_class.rs
@@ -6,11 +6,11 @@
 use std::os::raw::{c_int, c_void};
 
 use qemu_api::{
-    bindings::*, c_str, vmstate_clock, vmstate_fields, vmstate_subsections, vmstate_uint32,
-    vmstate_uint32_array, vmstate_unused, zeroable::Zeroable,
+    bindings::*, c_str, vmstate_clock, vmstate_fields, vmstate_of, vmstate_subsections,
+    vmstate_unused, zeroable::Zeroable,
 };
 
-use crate::device::{PL011State, PL011_FIFO_DEPTH};
+use crate::device::PL011State;
 
 extern "C" fn pl011_clock_needed(opaque: *mut c_void) -> bool {
     unsafe {
@@ -52,21 +52,21 @@ extern "C" fn pl011_post_load(opaque: *mut c_void, version_id: c_int) -> c_int {
     post_load: Some(pl011_post_load),
     fields: vmstate_fields! {
         vmstate_unused!(core::mem::size_of::<u32>()),
-        vmstate_uint32!(flags, PL011State),
-        vmstate_uint32!(line_control, PL011State),
-        vmstate_uint32!(receive_status_error_clear, PL011State),
-        vmstate_uint32!(control, PL011State),
-        vmstate_uint32!(dmacr, PL011State),
-        vmstate_uint32!(int_enabled, PL011State),
-        vmstate_uint32!(int_level, PL011State),
-        vmstate_uint32_array!(read_fifo, PL011State, PL011_FIFO_DEPTH),
-        vmstate_uint32!(ilpr, PL011State),
-        vmstate_uint32!(ibrd, PL011State),
-        vmstate_uint32!(fbrd, PL011State),
-        vmstate_uint32!(ifl, PL011State),
-        vmstate_uint32!(read_pos, PL011State),
-        vmstate_uint32!(read_count, PL011State),
-        vmstate_uint32!(read_trigger, PL011State),
+        vmstate_of!(PL011State, flags),
+        vmstate_of!(PL011State, line_control),
+        vmstate_of!(PL011State, receive_status_error_clear),
+        vmstate_of!(PL011State, control),
+        vmstate_of!(PL011State, dmacr),
+        vmstate_of!(PL011State, int_enabled),
+        vmstate_of!(PL011State, int_level),
+        vmstate_of!(PL011State, read_fifo),
+        vmstate_of!(PL011State, ilpr),
+        vmstate_of!(PL011State, ibrd),
+        vmstate_of!(PL011State, fbrd),
+        vmstate_of!(PL011State, ifl),
+        vmstate_of!(PL011State, read_pos),
+        vmstate_of!(PL011State, read_count),
+        vmstate_of!(PL011State, read_trigger),
     },
     subsections: vmstate_subsections! {
         VMSTATE_PL011_CLOCK
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index 0a89d393e0f..f30f9850ad4 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -106,6 +106,7 @@ pub mod registers {
     //! Device registers exposed as typed structs which are backed by arbitrary
     //! integer bitmaps. [`Data`], [`Control`], [`LineControl`], etc.
     use bilge::prelude::*;
+    use qemu_api::impl_vmstate_bitsized;
 
     /// Receive Status Register / Data Register common error bits
     ///
@@ -172,6 +173,7 @@ pub struct Data {
         pub errors: Errors,
         _reserved: u16,
     }
+    impl_vmstate_bitsized!(Data);
 
     impl Data {
         // bilge is not very const-friendly, unfortunately
@@ -208,6 +210,7 @@ pub struct ReceiveStatusErrorClear {
         pub errors: Errors,
         _reserved_unpredictable: u24,
     }
+    impl_vmstate_bitsized!(ReceiveStatusErrorClear);
 
     impl ReceiveStatusErrorClear {
         pub fn set_from_data(&mut self, data: Data) {
@@ -280,6 +283,7 @@ pub struct Flags {
         pub ring_indicator: bool,
         _reserved_zero_no_modify: u23,
     }
+    impl_vmstate_bitsized!(Flags);
 
     impl Flags {
         pub fn reset(&mut self) {
@@ -354,6 +358,7 @@ pub struct LineControl {
         /// 31:8 - Reserved, do not modify, read as zero.
         _reserved_zero_no_modify: u24,
     }
+    impl_vmstate_bitsized!(LineControl);
 
     impl LineControl {
         pub fn reset(&mut self) {
@@ -498,6 +503,7 @@ pub struct Control {
         /// 31:16 - Reserved, do not modify, read as zero.
         _reserved_zero_no_modify2: u16,
     }
+    impl_vmstate_bitsized!(Control);
 
     impl Control {
         pub fn reset(&mut self) {
-- 
2.47.1


