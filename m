Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uXKSl-0000ti-6w
	for mharc-qemu-rust@gnu.org; Thu, 03 Jul 2025 09:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uXKSj-0000t2-Tn
 for qemu-rust@nongnu.org; Thu, 03 Jul 2025 09:58:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uXKSf-0000j0-Lx
 for qemu-rust@nongnu.org; Thu, 03 Jul 2025 09:58:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so12194214a12.2
 for <qemu-rust@nongnu.org>; Thu, 03 Jul 2025 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751551128; x=1752155928; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FvLhRPj1vfT6fjk88OGyW5S9WumCYLF9auEExY5jSXI=;
 b=bLRT/dQRdX6LnRYM6hls61xW10xrpDDSHNswVjnne/B0d7dEVnU4TwqcQ2ClhHTjge
 veer6IJb+r4eyxftYMxpkJKB26CDa64cRDq4HhtE/gENqEZG6pU/Zfa5klhdWEhAPP1e
 1uYKXJFSuxLktIpcF/lEkA2j6vyCRuoWSexu6YJ5KIjztX1hOdZpmJ5E2/tz5EtSoUzn
 0Y9+fv/y6vowiUtOQ5lcAAthkhL1K+FLYT3jgE9HZ1lTiiJHB7M1lvHkpxWWZekCoRI0
 vrDupeRKPxrQ4IhQqrsISOKJXjTCC6wFHx/pUG2CswWBSLyyE6ku8EyyAMA9FouWnbYQ
 zbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751551128; x=1752155928;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvLhRPj1vfT6fjk88OGyW5S9WumCYLF9auEExY5jSXI=;
 b=DC3wWTg2g62rQOWaNqMbPJhsHDhEd29qK5YOj0KFbLu2Eh1H6qLfxoAf0frn/2Yble
 7EyULfdsc0XB+TsM5gQUepbL1Wz2qsZVrUjTibIaP64i8OvtcwfqxJNlnib55XFItLMt
 QHoAtxQcL9NyLlrstsg/vinLDAo6UfiwSZjSqFDUmsbs+o0OHZi9vPJlmzirDkwWPoaz
 yXwn2IPpTPE/zAu/K4ZeHN+SyAtQhfgFr0Iej6yLL/cZEIYYZd2OwUwW1lWdbg4xbxtA
 4LfvGq+Rd/EsCZRnX+dugT+Udz9ZLdivn9aDKxB7ZGYzW1K79oWVOE4bF/LfuJ4cL02G
 U3PQ==
X-Gm-Message-State: AOJu0YwiaSbJjrLRAKqcA4Kzup3zNZZZO5zSjbocO+J3HENkBi5CSKAQ
 au7QLrd26IDIk/GXTbS5tOLDZtA1QLmeCrkGu/w9JJ9azId78SBwKnjNMdRhypc7xLs=
X-Gm-Gg: ASbGnctNJjjrRrmTokZc2ldZlewd7AVEFzgIwrSSlmLdk4rDNBFf2FSEdJ3glZdYFSR
 O5fUAN2F+mYRupYWWmMhHgIAy+nJLdJob08SKKJQV+OguXvCWBrCDZZ+XmCp1noknIIhuDfPg+a
 MZQE5eoWDvvCEV5fCoK4SxqDIrq/NNC7YYpsJ+V4TBHlNzbuSh8O+ZWnJbvYhTSpqf176lcFSrV
 l8juCKRSNiop3SOEoZiT3v3fBmuWKy3GOTG12ziWH1fE+MnpbpFPNEgcp/ad9WI7TJFA01AshIh
 spi6GXBqaQM3YvtwevDSu3B5pLVxBAJ647LBjSP5h6yVod/U6PoLvEhVdxAbxzSWPwcabGt+VcQ
 bgCGeisk/X09cG38hDKu8ZK1QWQXN0qk=
X-Google-Smtp-Source: AGHT+IGf7K/lYxBnK79Pkd0vYng8HmYU6tcGoPpnW3smMJIVl7aAEy+LUcFgfTUGARAIxdMsC8kPgg==
X-Received: by 2002:a17:907:9495:b0:ae3:6cc8:e431 with SMTP id
 a640c23a62f3a-ae3c2db00cemr769035966b.57.1751551126031; 
 Thu, 03 Jul 2025 06:58:46 -0700 (PDT)
Received: from [127.0.1.1] (ppp-2-86-212-125.home.otenet.gr. [2.86.212.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353ca1ca6sm1279678966b.176.2025.07.03.06.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 06:58:45 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 03 Jul 2025 16:58:11 +0300
Subject: [PATCH 1/3] rust/memory: replace size arg with Bits enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-rust-mem-api-v1-1-cd5314bdf580@linaro.org>
References: <20250703-rust-mem-api-v1-0-cd5314bdf580@linaro.org>
In-Reply-To: <20250703-rust-mem-api-v1-0-cd5314bdf580@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8208;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=b5wGxgQqVBjenLdl6KFUgyRLn8oJlLD3hMKTz4nl5dQ=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9ab3lUWFVFbmoxZmJxazVyaE5wK2VFR21nSXdaCkRGRmpOaUFjVzBjTis4bEpt
 RnlKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUdhTWt3QUt
 DUkIzS2Nkd2YzNEowTnJMRC9zR1RGU1QyeStSTWxtMXJvc0plc05sOEhzM1JGTk5iNlFQYXVaQg
 pLL05YbzlMd2x2bXFaR29ZRFhxYTJzRysvK0FPMWpXb20wRk9NY1BuQm03SkM3RTlCaWxIZHM4c
 0RPeVFtRnVQCjFTMjhmRk1MeENCNzJmQyttMGFOV2dySTF5Z0I0YytiOU5sYkFYQVF5NjJnOGVG
 QTk4OG52alcxL2ttbWF2a0IKZVJqNjlkNGd6MllKa2p0eHh2QkdpeHMzMmZlWHNBRVl0cDZWYnJ
 VVk12OFZiOEZHNzdRZk1aek9USGZXRW53VApES1hYNFNYUFB5SHdXZlpTSkRUbDNGak0wNWxINV
 FZeVNUaEFuck9ESWRMSlRvZENwQ2Z2S1VUdi9Pd3BYZWx2CmE5aWd4OEU0UGYyWGdYYkpQaVozT
 nlXNitPK2YwRzQ3dWhRT2dtdkVWcW5YcDhydkg5OFFpYUFXaGZ5V1BMTW8KRUtENGNhQ1EvZGJB
 b3BGTVl4QVkvczdJWVJVRjR4bHlzVWFJMVdJRDMzbzdtazFOUW13dVNMN3dTY080TEdnMQpjVVh
 IUmo4QWxFZGMzbkZPczRBYXdkMGpIYTA2QlpqWFd4SnJtYWNWdUpsRkJrM1V2eDgyZkY3TzE0Sm
 pXNGp1CnNKWHhJQ2xEQUZMZ3Q0ZGxxZ2dOdUxRNG9MSHRwejY5b09zMjFEc0MvQnRLbVRmK0dPN
 UYyTUdLUFhBZnNZREQKV3BFeVR6Sk1kY1dxc1NPUGFiREEvdmRIbFljazBTZjhFVzVuUTAyeXhC
 SmpLc3oyczU3SkNYKzJiV3RsZDd6Rgp5UW1TVVpVclk3RjhzSzFUdWltUFpURmwzcEJNbXZVNTZ
 haWhiRXVWREF2SFU0dlU5dS9nWGhIKzh2V3BhbDdqCjNYazVZZz09Cj1ieU9zCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 03 Jul 2025 13:58:54 -0000

We have the ability to make memory accesses use a typesafe access width
type in Rust, which the C API currently lacks as it does not use a
newtype wrapper for specifying the amount of bytes a memory access has;
it uses a plain 32-bit integer value instead.

Replace use of u32 size arguments with a Bits enum that has only the
allowed byte sizes as variants and has a u32 representation so that it
can be fed back into C as well.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 rust/hw/char/pl011/src/device.rs |  8 ++++----
 rust/hw/timer/hpet/src/device.rs | 14 +++++++-------
 rust/qemu-api/src/memory.rs      | 34 ++++++++++++++++++++++++----------
 3 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 5b53f2649f161287f40f79075afba47db6d9315c..0c146821fbec4d310963264b90bb2bf2d30b901d 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -10,7 +10,7 @@
     irq::{IRQState, InterruptSource},
     log::Log,
     log_mask_ln,
-    memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
+    memory::{hwaddr, Bits, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
     prelude::*,
     qdev::{Clock, ClockEvent, DeviceImpl, DeviceState, Property, ResetType, ResettablePhasesImpl},
     qom::{ObjectImpl, Owned, ParentField, ParentInit},
@@ -501,7 +501,7 @@ unsafe fn init(mut this: ParentInit<Self>) {
             .read(&PL011State::read)
             .write(&PL011State::write)
             .native_endian()
-            .impl_sizes(4, 4)
+            .impl_sizes(Bits::_32, Bits::_32)
             .build();
 
         // SAFETY: this and this.iomem are guaranteed to be valid at this point
@@ -534,7 +534,7 @@ fn post_init(&self) {
         }
     }
 
-    fn read(&self, offset: hwaddr, _size: u32) -> u64 {
+    fn read(&self, offset: hwaddr, _size: Bits) -> u64 {
         match RegisterOffset::try_from(offset) {
             Err(v) if (0x3f8..0x400).contains(&(v >> 2)) => {
                 let device_id = self.get_class().device_id;
@@ -555,7 +555,7 @@ fn read(&self, offset: hwaddr, _size: u32) -> u64 {
         }
     }
 
-    fn write(&self, offset: hwaddr, value: u64, _size: u32) {
+    fn write(&self, offset: hwaddr, value: u64, _size: Bits) {
         let mut update_irq = false;
         if let Ok(field) = RegisterOffset::try_from(offset) {
             // qemu_chr_fe_write_all() calls into the can_receive
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index acf7251029e912f18a5690b0d6cf04ea8151c5e1..a94e128e302a57df709ef3643694308833791859 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -18,7 +18,7 @@
     cell::{BqlCell, BqlRefCell},
     irq::InterruptSource,
     memory::{
-        hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder, MEMTXATTRS_UNSPECIFIED,
+        hwaddr, Bits, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder, MEMTXATTRS_UNSPECIFIED,
     },
     prelude::*,
     qdev::{DeviceImpl, DeviceState, Property, ResetType, ResettablePhasesImpl},
@@ -703,8 +703,8 @@ unsafe fn init(mut this: ParentInit<Self>) {
                 .read(&HPETState::read)
                 .write(&HPETState::write)
                 .native_endian()
-                .valid_sizes(4, 8)
-                .impl_sizes(4, 8)
+                .valid_sizes(Bits::_32, Bits::_64)
+                .impl_sizes(Bits::_32, Bits::_64)
                 .build();
 
         MemoryRegion::init_io(
@@ -771,9 +771,9 @@ fn reset_hold(&self, _type: ResetType) {
         self.rtc_irq_level.set(0);
     }
 
-    fn decode(&self, mut addr: hwaddr, size: u32) -> HPETAddrDecode<'_> {
+    fn decode(&self, mut addr: hwaddr, size: Bits) -> HPETAddrDecode<'_> {
         let shift = ((addr & 4) * 8) as u32;
-        let len = std::cmp::min(size * 8, 64 - shift);
+        let len = std::cmp::min(size as u32 * 8, 64 - shift);
 
         addr &= !4;
         let reg = if (0..=0xff).contains(&addr) {
@@ -796,7 +796,7 @@ fn decode(&self, mut addr: hwaddr, size: u32) -> HPETAddrDecode<'_> {
         HPETAddrDecode { shift, len, reg }
     }
 
-    fn read(&self, addr: hwaddr, size: u32) -> u64 {
+    fn read(&self, addr: hwaddr, size: Bits) -> u64 {
         // TODO: Add trace point - trace_hpet_ram_read(addr)
         let HPETAddrDecode { shift, reg, .. } = self.decode(addr, size);
 
@@ -823,7 +823,7 @@ fn read(&self, addr: hwaddr, size: u32) -> u64 {
         }) >> shift
     }
 
-    fn write(&self, addr: hwaddr, value: u64, size: u32) {
+    fn write(&self, addr: hwaddr, value: u64, size: Bits) {
         let HPETAddrDecode { shift, len, reg } = self.decode(addr, size);
 
         // TODO: Add trace point - trace_hpet_ram_write(addr, value)
diff --git a/rust/qemu-api/src/memory.rs b/rust/qemu-api/src/memory.rs
index e40fad6cf19ea7971daf78afdf9ac886308ef5c3..b1907aa01300a3fac8e1f3b69c5d50da631a556d 100644
--- a/rust/qemu-api/src/memory.rs
+++ b/rust/qemu-api/src/memory.rs
@@ -20,6 +20,15 @@
     zeroable::Zeroable,
 };
 
+#[derive(Copy, Clone, Debug, Eq, PartialEq, qemu_api_macros::TryInto)]
+#[repr(u32)]
+pub enum Bits {
+    _8 = 1,
+    _16 = 2,
+    _32 = 4,
+    _64 = 8,
+}
+
 pub struct MemoryRegionOps<T>(
     bindings::MemoryRegionOps,
     // Note: quite often you'll see PhantomData<fn(&T)> mentioned when discussing
@@ -41,32 +50,37 @@ unsafe impl<T: Sync> Sync for MemoryRegionOps<T> {}
 #[derive(Clone)]
 pub struct MemoryRegionOpsBuilder<T>(bindings::MemoryRegionOps, PhantomData<fn(&T)>);
 
-unsafe extern "C" fn memory_region_ops_read_cb<T, F: for<'a> FnCall<(&'a T, hwaddr, u32), u64>>(
+unsafe extern "C" fn memory_region_ops_read_cb<T, F: for<'a> FnCall<(&'a T, hwaddr, Bits), u64>>(
     opaque: *mut c_void,
     addr: hwaddr,
     size: c_uint,
 ) -> u64 {
+    let size = Bits::try_from(size).expect("invalid size argument");
     F::call((unsafe { &*(opaque.cast::<T>()) }, addr, size))
 }
 
-unsafe extern "C" fn memory_region_ops_write_cb<T, F: for<'a> FnCall<(&'a T, hwaddr, u64, u32)>>(
+unsafe extern "C" fn memory_region_ops_write_cb<
+    T,
+    F: for<'a> FnCall<(&'a T, hwaddr, u64, Bits)>,
+>(
     opaque: *mut c_void,
     addr: hwaddr,
     data: u64,
     size: c_uint,
 ) {
+    let size = Bits::try_from(size).expect("invalid size argument");
     F::call((unsafe { &*(opaque.cast::<T>()) }, addr, data, size))
 }
 
 impl<T> MemoryRegionOpsBuilder<T> {
     #[must_use]
-    pub const fn read<F: for<'a> FnCall<(&'a T, hwaddr, u32), u64>>(mut self, _f: &F) -> Self {
+    pub const fn read<F: for<'a> FnCall<(&'a T, hwaddr, Bits), u64>>(mut self, _f: &F) -> Self {
         self.0.read = Some(memory_region_ops_read_cb::<T, F>);
         self
     }
 
     #[must_use]
-    pub const fn write<F: for<'a> FnCall<(&'a T, hwaddr, u64, u32)>>(mut self, _f: &F) -> Self {
+    pub const fn write<F: for<'a> FnCall<(&'a T, hwaddr, u64, Bits)>>(mut self, _f: &F) -> Self {
         self.0.write = Some(memory_region_ops_write_cb::<T, F>);
         self
     }
@@ -90,9 +104,9 @@ pub const fn native_endian(mut self) -> Self {
     }
 
     #[must_use]
-    pub const fn valid_sizes(mut self, min: u32, max: u32) -> Self {
-        self.0.valid.min_access_size = min;
-        self.0.valid.max_access_size = max;
+    pub const fn valid_sizes(mut self, min: Bits, max: Bits) -> Self {
+        self.0.valid.min_access_size = min as u32;
+        self.0.valid.max_access_size = max as u32;
         self
     }
 
@@ -103,9 +117,9 @@ pub const fn valid_unaligned(mut self) -> Self {
     }
 
     #[must_use]
-    pub const fn impl_sizes(mut self, min: u32, max: u32) -> Self {
-        self.0.impl_.min_access_size = min;
-        self.0.impl_.max_access_size = max;
+    pub const fn impl_sizes(mut self, min: Bits, max: Bits) -> Self {
+        self.0.impl_.min_access_size = min as u32;
+        self.0.impl_.max_access_size = max as u32;
         self
     }
 

-- 
2.47.2


