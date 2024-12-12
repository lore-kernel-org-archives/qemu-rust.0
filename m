Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLmtZ-0006rR-S6
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 12:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtV-0006oh-Ah
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtT-0006oG-6R
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734024149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdA/kdjoP/9szKTJTz2r1k+8hRh1UCiqvXnOngQ4uto=;
 b=NB6zkgWzDHenPeu22lccr3UA77Lx3cPjxfr5u6cZ4f5HP9rZRxOV/0DRqJtm4qbCEEcAYn
 E1VJ4MsQB85lvEmXkwoR8jIELE+bhRJsQp5G0UDJAG8vjo3jkabeT1KY8WDkbmDb3Rm/Pq
 +i+CspHG2m/SG6gksgGVhCcaBBEXBl0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-8-psUxp_MQ2jhOcLZn2CKA-1; Thu, 12 Dec 2024 12:22:28 -0500
X-MC-Unique: 8-psUxp_MQ2jhOcLZn2CKA-1
X-Mimecast-MFC-AGG-ID: 8-psUxp_MQ2jhOcLZn2CKA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43624b081f3so7980705e9.1
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 09:22:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734024147; x=1734628947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HdA/kdjoP/9szKTJTz2r1k+8hRh1UCiqvXnOngQ4uto=;
 b=eYE1KOvaARFcIOcaENjvjgdRj7AmVH/DP/WTq+Mkdw+phuM01AwwjiT/Y9gWF2LO0N
 o8Rr2cSN4Lu72lm8l7165zslZcMGkKv1Kh7pWVajBShIZFeJMsi+JAdtvibA6Rj+RUvw
 EPiY/s1Kp1JrA5JRYVVTHcbJk+1ZEIPhlDLOl7oqekH6liQL8McNCk+RUpoeMGUBnb21
 Nga4RzF28XhUsJnxnM68SK1oO9NyYdINsYuuepKgCrlEn762KJUANf2hzWomNwUJDiof
 1P4WY+VMP9gHy7a/E0dvaglhh7oaXhGe7T1kR6khJ3uT5+J/5ukz6c7RruaIFRH44TpG
 e8ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6hqFtIgvszzzbcq17xBGBSc5LkkEovqZdj60buxFKFMjTeFnIQ1589gLGFIOYYZhZ72oCB06bmvk=@nongnu.org
X-Gm-Message-State: AOJu0Yz2+qzCYNlmIMFNkOcLbjk11IMDnWmrbXtknzCgx77WAwxFPtZi
 tblmb+s3xwUC+Mlvzf1l1j81V5zoic4IwiyP7SnUJGeiSKGZc8KycJWuIeh1T41hmvFB5v/letz
 Qhu1rAZLR6t5NMczaB7J0pSEqJaCT7PuZo0D3d6GtZsBy94sx8k4=
X-Gm-Gg: ASbGncvLlQ2uVJlWTsdbLu8EoPE5jqXcvYrMOyYu3RNrQHO+xFVZ6vFg6JatsG4GkNv
 tDxPxTxG/c6RbD+bucUwRur9K+etBaXPheNeJb3lNMmSRD7+g0vBttK1ICyGHGnhTkI1p/kbnwp
 RjD+iwt6YIh56M8/gAHnb76GeVviIfQXBlpH1Rlt5sTOKJ+Ijz3pkp3mBqSvMuDiFW4vSbjP3aH
 LYngcPIUjuXOX2VM+evx7af7qMbb35KE8WglEoZAjjLApp6LwjdeulmU1Al
X-Received: by 2002:a05:600c:1ca6:b0:434:f396:525e with SMTP id
 5b1f17b1804b1-43622832ff4mr38313645e9.9.1734024147354; 
 Thu, 12 Dec 2024 09:22:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGA3AUAESDQriN/fq+NBro7IZR6DAtQIjHdmjuYFRNgyeHWebyZMBctglmsS6VoA2E3HvPcrQ==
X-Received: by 2002:a05:600c:1ca6:b0:434:f396:525e with SMTP id
 5b1f17b1804b1-43622832ff4mr38313245e9.9.1734024146919; 
 Thu, 12 Dec 2024 09:22:26 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625550532sm22987545e9.7.2024.12.12.09.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 09:22:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 6/7] rust: pl011: fix migration stream
Date: Thu, 12 Dec 2024 18:22:03 +0100
Message-ID: <20241212172209.533779-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212172209.533779-1-pbonzini@redhat.com>
References: <20241212172209.533779-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 59wMMWoewkD_EW-YWu_sJYyRXmBTwASlWq9-m_W73E4_1734024147
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Thu, 12 Dec 2024 17:22:33 -0000

The Rust vmstate macros lack the type-safety of their C equivalents (so
safe, much abstraction), and therefore they were predictably wrong.

The registers have already been changed to 32-bits in the previous patch,
but read_pos/read_count/read_trigger also have to be u32 instead of usize.
The easiest way to do so is to let the FIFO use u32 indices instead
of usize.

My plan for making VMStateField typesafe is to have a trait to retrieve
a basic VMStateField; for example something like vmstate_uint32 would
become an implementation of the VMState trait on u32.  Then you'd write
something like "vmstate_of!(Type, field).with_version_id(2)".  That is,
vmstate_of retrieves the basic VMStateField and fills in the offset,
and then more changes can be applied on top.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs       | 38 ++++++++++++++++++++++----
 rust/hw/char/pl011/src/device_class.rs |  8 +++---
 rust/qemu-api/src/vmstate.rs           | 22 ---------------
 3 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 332e0a31a82..cfe2734703e 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -31,7 +31,7 @@
 const FBRD_MASK: u32 = 0x3f;
 
 /// QEMU sourced constant.
-pub const PL011_FIFO_DEPTH: usize = 16_usize;
+pub const PL011_FIFO_DEPTH: u32 = 16;
 
 #[derive(Clone, Copy)]
 struct DeviceId(&'static [u8; 8]);
@@ -49,6 +49,32 @@ impl DeviceId {
     const LUMINARY: Self = Self(&[0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1]);
 }
 
+// FIFOs use 32-bit indices instead of usize, for compatibility with
+// the migration stream produced by the C version of this device.
+#[repr(transparent)]
+#[derive(Debug, Default)]
+pub struct Fifo([registers::Data; PL011_FIFO_DEPTH as usize]);
+
+impl Fifo {
+    const fn len(&self) -> u32 {
+        self.0.len() as u32
+    }
+}
+
+impl std::ops::IndexMut<u32> for Fifo {
+    fn index_mut(&mut self, idx: u32) -> &mut Self::Output {
+        &mut self.0[idx as usize]
+    }
+}
+
+impl std::ops::Index<u32> for Fifo {
+    type Output = registers::Data;
+
+    fn index(&self, idx: u32) -> &Self::Output {
+        &self.0[idx as usize]
+    }
+}
+
 #[repr(C)]
 #[derive(Debug, qemu_api_macros::Object, qemu_api_macros::offsets)]
 /// PL011 Device Model in QEMU
@@ -66,14 +92,14 @@ pub struct PL011State {
     pub dmacr: u32,
     pub int_enabled: u32,
     pub int_level: u32,
-    pub read_fifo: [registers::Data; PL011_FIFO_DEPTH],
+    pub read_fifo: Fifo,
     pub ilpr: u32,
     pub ibrd: u32,
     pub fbrd: u32,
     pub ifl: u32,
-    pub read_pos: usize,
-    pub read_count: usize,
-    pub read_trigger: usize,
+    pub read_pos: u32,
+    pub read_count: u32,
+    pub read_trigger: u32,
     #[doc(alias = "chr")]
     pub char_backend: CharBackend,
     /// QEMU interrupts
@@ -485,7 +511,7 @@ pub fn loopback_enabled(&self) -> bool {
     }
 
     #[inline]
-    pub fn fifo_depth(&self) -> usize {
+    pub fn fifo_depth(&self) -> u32 {
         // Note: FIFO depth is expected to be power-of-2
         if self.fifo_enabled() {
             return PL011_FIFO_DEPTH;
diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/src/device_class.rs
index 975c3d42be7..759c521a99e 100644
--- a/rust/hw/char/pl011/src/device_class.rs
+++ b/rust/hw/char/pl011/src/device_class.rs
@@ -6,7 +6,7 @@
 use std::os::raw::{c_int, c_void};
 
 use qemu_api::{
-    bindings::*, c_str, vmstate_clock, vmstate_fields, vmstate_int32, vmstate_subsections,
+    bindings::*, c_str, vmstate_clock, vmstate_fields, vmstate_subsections,
     vmstate_uint32, vmstate_uint32_array, vmstate_unused, zeroable::Zeroable,
 };
 
@@ -64,9 +64,9 @@ extern "C" fn pl011_post_load(opaque: *mut c_void, version_id: c_int) -> c_int {
         vmstate_uint32!(ibrd, PL011State),
         vmstate_uint32!(fbrd, PL011State),
         vmstate_uint32!(ifl, PL011State),
-        vmstate_int32!(read_pos, PL011State),
-        vmstate_int32!(read_count, PL011State),
-        vmstate_int32!(read_trigger, PL011State),
+        vmstate_uint32!(read_pos, PL011State),
+        vmstate_uint32!(read_count, PL011State),
+        vmstate_uint32!(read_trigger, PL011State),
     },
     subsections: vmstate_subsections! {
         VMSTATE_PL011_CLOCK
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 25c68b703ea..63c897abcdf 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -106,28 +106,6 @@ macro_rules! vmstate_uint32 {
     }};
 }
 
-#[doc(alias = "VMSTATE_INT32_V")]
-#[macro_export]
-macro_rules! vmstate_int32_v {
-    ($field_name:ident, $struct_name:ty, $version_id:expr) => {{
-        $crate::vmstate_single!(
-            $field_name,
-            $struct_name,
-            $version_id,
-            ::core::ptr::addr_of!($crate::bindings::vmstate_info_int32),
-            ::core::mem::size_of::<i32>()
-        )
-    }};
-}
-
-#[doc(alias = "VMSTATE_INT32")]
-#[macro_export]
-macro_rules! vmstate_int32 {
-    ($field_name:ident, $struct_name:ty) => {{
-        $crate::vmstate_int32_v!($field_name, $struct_name, 0)
-    }};
-}
-
 #[doc(alias = "VMSTATE_ARRAY")]
 #[macro_export]
 macro_rules! vmstate_array {
-- 
2.47.1


