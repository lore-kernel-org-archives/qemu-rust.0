Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSQ3J-0003T3-On
	for mharc-qemu-rust@gnu.org; Mon, 30 Dec 2024 19:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3J-0003Si-8J
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:24:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3H-00020L-Dj
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735604642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYsX+8dH7ajdw7h4Gl+C0v6pO/Y+Rzud1yNiyL/9IMY=;
 b=aA5T/nqM6olZUXDk122a7nxNqWnET689maxBUH5jWRr5Srxx6WbtR9NLPw+7NKP5RiOfBy
 oPjAeitSqyRy1BGt7S1XMH6qqgLsoAljbT8oEhrTuXWkvnYxlGdbfiH5BR/is1qmQa6Dyn
 JR+/yvCNGugtfdVEtUxOBFvtAY7D3aE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-w3wovbp-Pzm-keHzxcZocQ-1; Mon, 30 Dec 2024 19:24:00 -0500
X-MC-Unique: w3wovbp-Pzm-keHzxcZocQ-1
X-Mimecast-MFC-AGG-ID: w3wovbp-Pzm-keHzxcZocQ
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-436289a570eso75335885e9.0
 for <qemu-rust@nongnu.org>; Mon, 30 Dec 2024 16:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735604639; x=1736209439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYsX+8dH7ajdw7h4Gl+C0v6pO/Y+Rzud1yNiyL/9IMY=;
 b=lUKMcjDXl1qRUtiTM1204bs62XzYBJSDNXR1w4y3Az1Z49NosrgPdJeinqzH/x0exi
 3fc8jLkS3tA1UBzeAY0oEYW0q4wBe+wExBDuqfqKd3gVqWCETa/jCIdG4uEt867gdopO
 Hl85hVCV5KhZJDLiUP5sL2KQUq3RvWaCJsTsxYJ4+xNuAAmVtirCWukph1y1fqLnQKWI
 t7WMb0oX9SHK5QBYjudXYnstVEUBjZZ6ulMRgp/sMBF6QCFdkKBzL+EbdF8tKR2PHoZo
 44V9Bn6hQzZidcNKWO40/JqgnyI7Dz1LmAc7wcOuOXDfDmFb7N6ZAboAFN3TLbPu9XTO
 pvLQ==
X-Gm-Message-State: AOJu0Yw50xGOf+B4Gv9MsQeX5tx/z7BpQbXMMPJRLqonkC1774fCF6n2
 Vi0ZLHIuJ3QacqPjWYVqGLMp5swOsz7rTHNmzD0UmzqoJII3Adp8dAoOumZZe8cOoCAAD6ZuV0Y
 zhMYuyJxmJZoMJx92jAL02Kig9lBGN7MEs2yoh94RfzLjpXqVxyA=
X-Gm-Gg: ASbGncsdBC8GjaUiaK53CHs4S5eNqMQFyb8LhB2b45QSspZNhNYsAT6hps2uHgqmh7w
 kN41jzi5Qc7k8yZGrj6j2LE1ieyy4f3HZBcvy6H4PnNEjfc/VVC9Y37oo0GhavVByNM8e9mvYfq
 qhqIpY0no4pqvqNFVkJFX3V9vzTda0DVr8biA7N7SZaKJ21q3FfwMpZOsqxS1dyjVGSu901ZPHX
 xKBRCqToi/bCz0cqJT2c5BFc7ns+AydfvL+mFfZL/CkTi1uw9h4I29/IZ4=
X-Received: by 2002:a05:600c:1c25:b0:434:f4fa:83c4 with SMTP id
 5b1f17b1804b1-43668b5f691mr304872285e9.29.1735604639445; 
 Mon, 30 Dec 2024 16:23:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxDzgunRjQHOEt3yXGNGZrj8KS6374Y+Ckge8ZDZ8iuINYuYauFPTqu7gP3FeSa0KAhsjRLA==
X-Received: by 2002:a05:600c:1c25:b0:434:f4fa:83c4 with SMTP id
 5b1f17b1804b1-43668b5f691mr304872215e9.29.1735604639086; 
 Mon, 30 Dec 2024 16:23:59 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b271sm402833415e9.34.2024.12.30.16.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:23:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com,
	junjie.mao@hotmail.com
Subject: [RFC PATCH 8/9] rust: pl011: switch vmstate to new-style macros
Date: Tue, 31 Dec 2024 01:23:35 +0100
Message-ID: <20241231002336.25931-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231002336.25931-1-pbonzini@redhat.com>
References: <20241231002336.25931-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9x6j_NS9r4XwszPt1qLzEKgH-DB_49L3dYp2W4EL4qU_1735604639
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.187,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 31 Dec 2024 00:24:05 -0000

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


