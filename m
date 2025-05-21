Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHefc-0004tx-Qt
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 04:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefU-0004r1-Af
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefM-0000CF-B2
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747815543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AR66GhTpeyumQSu0KfASdH7/iMoNc4vAxdPN0ZdynH8=;
 b=is0GmfS+KOpzSzi4cJSqeFExrTfj2crqh8PGvwUZiAQsqOg7hZRZh9f9Iu+9m/DXUy+S9p
 NhjfoAXsMjMhOkzWXP3W/b7DfhBQnnz550vEcr5aGjDZ36x1Iq5JHcnMWdhj1hGgRFVe85
 X7MD43KqE3f/vDr+Llb6zLY8GJVppH0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-E956TvCpNo-MRtgQP3ORuQ-1; Wed, 21 May 2025 04:19:02 -0400
X-MC-Unique: E956TvCpNo-MRtgQP3ORuQ-1
X-Mimecast-MFC-AGG-ID: E956TvCpNo-MRtgQP3ORuQ_1747815541
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-442ffaa7dbeso16571115e9.3
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 01:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747815541; x=1748420341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AR66GhTpeyumQSu0KfASdH7/iMoNc4vAxdPN0ZdynH8=;
 b=OBS/IG3bQtlKsHi5r9sDK0tMb2sVwYKeMI2qhLg/cgf6kFkFQdl63PRf4KiJ8WYz+G
 hCGefJvuCG/pGXH19+A9gFUqlY+L79e/svFrg3+1oz6gmSVhUGz2SUmSkSd3TxSzPxTY
 4M0B098tN6ijdOF4NDOq2IEO908ARX0RNM3BfXQNCkDkL5fPohpla3S3fhbxonv0xc+V
 x/loNraDck8lXyccEx344AVPjASlkqZS1a2pSLxOsdoNpZxMTFFi4utc5vXx1VKhgfSd
 s+WoZuVQlzajbE0yaKqRkU8m9jGOshLyV1JLOYQyvkWCR2gBM52IESgjXyGFRxCJ9lzY
 Kh8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAN4Y4Z6w0/mU6bAFP9i8HMrDU6YKpMPMOI3TTwb4BUEwTTuj1Im7dW3uFKh3tSJCoIE6qcvxdpTk=@nongnu.org
X-Gm-Message-State: AOJu0YzvYt41r1CaGgL89LVMTKvJkaBNKqg/hvIngyWSVbxvo7fC4fpm
 bde0BHZa8S5nUe+H8XDBQen8NG4KZ6C0QlIIQMuzHiGyKI7dWZuhRpaTyje6OqszDnmct824YMM
 pvqQdmRmbIbCVjs+04ur6BUW+jIGxFa0hX+w6LiflS32ghzZ6P1eBxMg=
X-Gm-Gg: ASbGnct1gv9YyRNUO6I3fJnDYAnwBrz4OEyuLmsgNqu2zq+/iLsiQtClD0qgyVzdv2m
 KEJUzmYeRnutLFW8iCItSLwQns7uuj9NpJEf4CuWnUPr66guQq6s6K2hS2Wm37bs3cb/BpQuDc8
 fePBr2KEMJlQvVZJnliQboSsXlNf+1ByTDUJp2Ql+FmyxxKlVQlCVJd3cPTjBDifsGUOBaRJS4Z
 eGc3Y8utlgNnxe3D4+6aMNXBbcgegZljQx7T1xPqvTdj1Sdtc2P6VXroqZgXxvEHeSG3FH6aDwq
 tLdJ6b3EKbaQ2A==
X-Received: by 2002:a05:600c:a012:b0:43c:e70d:44f0 with SMTP id
 5b1f17b1804b1-442fd63bfa4mr175851715e9.19.1747815540881; 
 Wed, 21 May 2025 01:19:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQT5Dg8m9YTAN1goqzsDzHeVtcSBdgBcKx4IECUHoeESE2p7eljMlVOA5UbzB7UwIMwTv5Vg==
X-Received: by 2002:a05:600c:a012:b0:43c:e70d:44f0 with SMTP id
 5b1f17b1804b1-442fd63bfa4mr175851395e9.19.1747815540408; 
 Wed, 21 May 2025 01:19:00 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3dd9c21sm62787015e9.38.2025.05.21.01.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 01:18:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-rust@nongnu.org,
 manos.pitsidianakis@linaro.org
Subject: [RFC PATCH 5/6] rust: pl011: switch from bilge to bitfield-struct
Date: Wed, 21 May 2025 10:18:44 +0200
Message-ID: <20250521081845.496442-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521081845.496442-1-pbonzini@redhat.com>
References: <20250521081845.496442-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: foG-1TYWrj5OqVRVLDnvOe0AHq4g38nTgDpCz11P058_1747815541
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.487,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 21 May 2025 08:19:18 -0000

The bilge crate, while very nice and espressive, is heavily reliant on
traits; because trait functions are never const, bilge and const mix
about as well as water and oil.

Try using the bitfield-struct crate instead.  It is built to support
const very well and the only downside is that more manual annotations
are needed (for enums and non-full-byte members).  Otherwise, the use
is pretty much the same and in fact device code does not change at all,
only register declarations.

Recent versions want to use Rust 1.83, so this uses a slightly older
version with basically no lost functionality; but anyway, I want to switch
to 1.83 for QEMU as well due to improved "const" support in the compiler.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.toml                     |   1 +
 rust/hw/char/pl011/Cargo.toml       |   3 +-
 rust/hw/char/pl011/meson.build      |  11 +--
 rust/hw/char/pl011/src/registers.rs | 108 ++++++++++++++--------------
 4 files changed, 56 insertions(+), 67 deletions(-)

diff --git a/rust/Cargo.toml b/rust/Cargo.toml
index 165328b6d01..3345858b5b4 100644
--- a/rust/Cargo.toml
+++ b/rust/Cargo.toml
@@ -97,5 +97,6 @@ used_underscore_binding = "deny"
 #wildcard_imports = "deny"   # still have many bindings::* imports
 
 # these may have false positives
+enum_variant_names = "allow"
 #option_if_let_else = "deny"
 cognitive_complexity = "deny"
diff --git a/rust/hw/char/pl011/Cargo.toml b/rust/hw/char/pl011/Cargo.toml
index 003ef9613d4..97e3dd00c35 100644
--- a/rust/hw/char/pl011/Cargo.toml
+++ b/rust/hw/char/pl011/Cargo.toml
@@ -16,8 +16,7 @@ rust-version.workspace = true
 crate-type = ["staticlib"]
 
 [dependencies]
-bilge = { version = "0.2.0" }
-bilge-impl = { version = "0.2.0" }
+bitfield-struct = { version = "0.9" }
 bits = { path = "../../../bits" }
 qemu_api = { path = "../../../qemu-api" }
 qemu_api_macros = { path = "../../../qemu-api-macros" }
diff --git a/rust/hw/char/pl011/meson.build b/rust/hw/char/pl011/meson.build
index f134a6cdc6b..1bae5a03310 100644
--- a/rust/hw/char/pl011/meson.build
+++ b/rust/hw/char/pl011/meson.build
@@ -1,17 +1,10 @@
-subproject('bilge-0.2-rs', required: true)
-subproject('bilge-impl-0.2-rs', required: true)
-
-bilge_dep = dependency('bilge-0.2-rs')
-bilge_impl_dep = dependency('bilge-impl-0.2-rs')
-
 _libpl011_rs = static_library(
   'pl011',
   files('src/lib.rs'),
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
   dependencies: [
-    bilge_dep,
-    bilge_impl_dep,
+    bitfield_struct_dep,
     bits_rs,
     qemu_api,
     qemu_api_macros,
@@ -22,6 +15,6 @@ rust_devices_ss.add(when: 'CONFIG_X_PL011_RUST', if_true: [declare_dependency(
   link_whole: [_libpl011_rs],
   # Putting proc macro crates in `dependencies` is necessary for Meson to find
   # them when compiling the root per-target static rust lib.
-  dependencies: [bilge_impl_dep, qemu_api_macros],
+  dependencies: [bitfield_struct_dep, qemu_api_macros],
   variables: {'crate': 'pl011'},
 )])
diff --git a/rust/hw/char/pl011/src/registers.rs b/rust/hw/char/pl011/src/registers.rs
index 7ececd39f86..f2138c637c5 100644
--- a/rust/hw/char/pl011/src/registers.rs
+++ b/rust/hw/char/pl011/src/registers.rs
@@ -5,12 +5,16 @@
 //! Device registers exposed as typed structs which are backed by arbitrary
 //! integer bitmaps. [`Data`], [`Control`], [`LineControl`], etc.
 
+// rustc prefers "constant-like" enums to use upper case names, but that
+// is inconsistent in its own way.
+#![allow(non_upper_case_globals)]
+
 // For more detail see the PL011 Technical Reference Manual DDI0183:
 // https://developer.arm.com/documentation/ddi0183/latest/
 
-use bilge::prelude::*;
+use bitfield_struct::bitfield;
 use bits::bits;
-use qemu_api::{impl_vmstate_bitsized, impl_vmstate_forward};
+use qemu_api::impl_vmstate_forward;
 
 /// Offset of each register from the base memory address of the device.
 #[doc(alias = "offset")]
@@ -78,14 +82,18 @@ pub enum RegisterOffset {
 /// The `UARTRSR` register is updated only when a read occurs
 /// from the `UARTDR` register with the same status information
 /// that can also be obtained by reading the `UARTDR` register
-#[bitsize(8)]
-#[derive(Clone, Copy, Default, DebugBits, FromBits)]
+#[bitfield(u8)]
 pub struct Errors {
     pub framing_error: bool,
     pub parity_error: bool,
     pub break_error: bool,
     pub overrun_error: bool,
-    _reserved_unpredictable: u4,
+    #[bits(4)]
+    _reserved_unpredictable: u8,
+}
+
+impl Errors {
+    pub const BREAK: Self = Errors::new().with_break_error(true);
 }
 
 /// Data Register, `UARTDR`
@@ -93,19 +101,18 @@ pub struct Errors {
 /// The `UARTDR` register is the data register; write for TX and
 /// read for RX. It is a 12-bit register, where bits 7..0 are the
 /// character and bits 11..8 are error bits.
-#[bitsize(32)]
-#[derive(Clone, Copy, Default, DebugBits, FromBits)]
+#[bitfield(u32)]
 #[doc(alias = "UARTDR")]
 pub struct Data {
     pub data: u8,
+    #[bits(8)]
     pub errors: Errors,
     _reserved: u16,
 }
-impl_vmstate_bitsized!(Data);
+impl_vmstate_forward!(Data);
 
 impl Data {
-    // bilge is not very const-friendly, unfortunately
-    pub const BREAK: Self = Self { value: 1 << 10 };
+    pub const BREAK: Self = Self::new().with_errors(Errors::BREAK);
 }
 
 /// Receive Status Register / Error Clear Register, `UARTRSR/UARTECR`
@@ -119,13 +126,14 @@ impl Data {
 /// and UARTECR for writes, but really it's a single error status
 /// register where writing anything to the register clears the error
 /// bits.
-#[bitsize(32)]
-#[derive(Clone, Copy, DebugBits, FromBits)]
+#[bitfield(u32)]
 pub struct ReceiveStatusErrorClear {
+    #[bits(8)]
     pub errors: Errors,
-    _reserved_unpredictable: u24,
+    #[bits(24)]
+    _reserved_unpredictable: u32,
 }
-impl_vmstate_bitsized!(ReceiveStatusErrorClear);
+impl_vmstate_forward!(ReceiveStatusErrorClear);
 
 impl ReceiveStatusErrorClear {
     pub fn set_from_data(&mut self, data: Data) {
@@ -138,14 +146,7 @@ pub fn reset(&mut self) {
     }
 }
 
-impl Default for ReceiveStatusErrorClear {
-    fn default() -> Self {
-        0.into()
-    }
-}
-
-#[bitsize(32)]
-#[derive(Clone, Copy, DebugBits, FromBits)]
+#[bitfield(u32, default = false)]
 /// Flag Register, `UARTFR`
 ///
 /// This has the usual inbound RS232 modem-control signals, plus flags
@@ -171,9 +172,10 @@ pub struct Flags {
     pub transmit_fifo_empty: bool,
     /// RI: Ring indicator
     pub ring_indicator: bool,
-    _reserved_zero_no_modify: u23,
+    #[bits(23)]
+    _reserved_zero_no_modify: u32,
 }
-impl_vmstate_bitsized!(Flags);
+impl_vmstate_forward!(Flags);
 
 impl Flags {
     pub fn reset(&mut self) {
@@ -183,16 +185,14 @@ pub fn reset(&mut self) {
 
 impl Default for Flags {
     fn default() -> Self {
-        let mut ret: Self = 0.into();
         // After reset TXFF, RXFF, and BUSY are 0, and TXFE and RXFE are 1
-        ret.set_receive_fifo_empty(true);
-        ret.set_transmit_fifo_empty(true);
-        ret
+        Self::from(0)
+            .with_receive_fifo_empty(true)
+            .with_transmit_fifo_empty(true)
     }
 }
 
-#[bitsize(32)]
-#[derive(Clone, Copy, DebugBits, FromBits)]
+#[bitfield(u32)]
 /// Line Control Register, `UARTLCR_H`
 #[doc(alias = "UARTLCR_H")]
 pub struct LineControl {
@@ -201,48 +201,46 @@ pub struct LineControl {
     /// PEN: Parity enable
     pub parity_enabled: bool,
     /// EPS: Even parity select
+    #[bits(1)]
     pub parity: Parity,
     /// STP2: Two stop bits select
     pub two_stops_bits: bool,
     /// FEN: Enable FIFOs
+    #[bits(1)]
     pub fifos_enabled: Mode,
     /// WLEN: Word length in bits
     /// b11 = 8 bits
     /// b10 = 7 bits
     /// b01 = 6 bits
     /// b00 = 5 bits.
+    #[bits(2)]
     pub word_length: WordLength,
     /// SPS Stick parity select
     pub sticky_parity: bool,
     /// 31:8 - Reserved, do not modify, read as zero.
-    _reserved_zero_no_modify: u24,
+    #[bits(24)]
+    _reserved_zero_no_modify: u32,
 }
-impl_vmstate_bitsized!(LineControl);
+impl_vmstate_forward!(LineControl);
 
 impl LineControl {
     pub fn reset(&mut self) {
         // All the bits are cleared to 0 when reset.
-        *self = 0.into();
+        *self = Self::default();
     }
 }
 
-impl Default for LineControl {
-    fn default() -> Self {
-        0.into()
-    }
-}
-
-#[bitsize(1)]
-#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
 /// `EPS` "Even parity select", field of [Line Control
 /// register](LineControl).
+#[repr(u8)]
+#[derive(Clone, Copy, Debug, Eq, PartialEq, qemu_api_macros::TryInto)]
 pub enum Parity {
     Odd = 0,
     Even = 1,
 }
 
-#[bitsize(1)]
-#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+#[repr(u8)]
+#[derive(Clone, Copy, Debug, Eq, PartialEq, qemu_api_macros::TryInto)]
 /// `FEN` "Enable FIFOs" or Device mode, field of [Line Control
 /// register](LineControl).
 pub enum Mode {
@@ -253,8 +251,8 @@ pub enum Mode {
     FIFO = 1,
 }
 
-#[bitsize(2)]
-#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+#[repr(u8)]
+#[derive(Clone, Copy, Debug, Eq, PartialEq, qemu_api_macros::TryInto)]
 /// `WLEN` Word length, field of [Line Control register](LineControl).
 ///
 /// These bits indicate the number of data bits transmitted or received in a
@@ -275,9 +273,8 @@ pub enum WordLength {
 /// The `UARTCR` register is the control register. It contains various
 /// enable bits, and the bits to write to set the usual outbound RS232
 /// modem control signals. All bits reset to 0 except TXE and RXE.
-#[bitsize(32)]
+#[bitfield(u32, default = false)]
 #[doc(alias = "UARTCR")]
-#[derive(Clone, Copy, DebugBits, FromBits)]
 pub struct Control {
     /// `UARTEN` UART enable: 0 = UART is disabled.
     pub enable_uart: bool,
@@ -285,9 +282,10 @@ pub struct Control {
     /// QEMU does not model this.
     pub enable_sir: bool,
     /// `SIRLP` SIR low-power IrDA mode. QEMU does not model this.
-    pub sir_lowpower_irda_mode: u1,
+    pub sir_lowpower_irda_mode: bool,
     /// Reserved, do not modify, read as zero.
-    _reserved_zero_no_modify: u4,
+    #[bits(4)]
+    _reserved_zero_no_modify: u8,
     /// `LBE` Loopback enable: feed UART output back to the input
     pub enable_loopback: bool,
     /// `TXE` Transmit enable
@@ -309,21 +307,19 @@ pub struct Control {
     /// 31:16 - Reserved, do not modify, read as zero.
     _reserved_zero_no_modify2: u16,
 }
-impl_vmstate_bitsized!(Control);
+impl_vmstate_forward!(Control);
 
 impl Control {
     pub fn reset(&mut self) {
-        *self = 0.into();
-        self.set_enable_receive(true);
-        self.set_enable_transmit(true);
+        *self = Self::default();
     }
 }
 
 impl Default for Control {
     fn default() -> Self {
-        let mut ret: Self = 0.into();
-        ret.reset();
-        ret
+        Self::from(0)
+            .with_enable_receive(true)
+            .with_enable_transmit(true)
     }
 }
 
-- 
2.49.0


