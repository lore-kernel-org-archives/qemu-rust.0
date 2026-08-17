Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143A7C5DF66
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Aug 2026 14:17:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wvy8T-00069T-C1; Mon, 17 Aug 2026 10:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvy8L-000622-3r
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 10:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvy8I-00017J-4b
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 10:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786976169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZPsNPFmHtvTsKWdH9GHwqOhSlL4pfLFM9GK7NJV20U=;
 b=gu9ojahTb9mbSu8NtRDuVA9n2yHktL1jL6YFB0uu2O59XcZHMyIiVP4CojNlpcVN2BZE3H
 hce5YkueiOl2QWirMf1il47P46uLQOd72rj31RF+n+blGLd4BRDa6qbNkbuQHdwiDNdSlV
 yiXhTfAtkN+4V36EOgVjX+CU671k1zA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-mlEF-vfdPFuQHz7pSb95eQ-1; Mon, 17 Aug 2026 10:16:07 -0400
X-MC-Unique: mlEF-vfdPFuQHz7pSb95eQ-1
X-Mimecast-MFC-AGG-ID: mlEF-vfdPFuQHz7pSb95eQ_1786976166
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49554715277so30639105e9.1
 for <qemu-rust@nongnu.org>; Mon, 17 Aug 2026 07:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786976166; x=1787580966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aZPsNPFmHtvTsKWdH9GHwqOhSlL4pfLFM9GK7NJV20U=;
 b=sMIDQIPXUX+E2KT0AXTsZSNXZPlIAKeSMDI5DSB2yCx9y6MSERPg5vCzqFQiR08cfD
 c1aAsGN7WCsZmMZrzhKXCK4KHJN3ke4Z/BnK/8IvKmVdCbzckWkoZE8GeOHZN636bsu4
 jDylr79ytkGIhNZfTaQhxOoLJAKNKiKRtf3AhQIPovbsvETyN3VeZ+jEo7u3LkKCsWXT
 5Hm1i/3dhVwE1RySLv5lyFnvoXBPuYWk4JzLr54bK7V34GgTu48WpTgSqXlHAA6oHmiw
 D2UmiIRhJiSNCuuLaJD0j5PyClpZTvjsIysOaYXUVQsgfpZMJSbtWrZq8M4x9P/GrTul
 03MQ==
X-Gm-Message-State: AOJu0YwY09DrD0SL0/unoTRRg4Yf8xmgrqH9l8pVwG0KtQ0xs7KMgYks
 aH5bOAkve3x1oyrNnaUjPhNV90131J/nYSOsdpoX7b5RCIdcqRRpfbLyaTXVYvF6eKJliQGOzpe
 GM8stuSd2L3fj4CDzBwIkbx6rXlqASbLKTnEzo6bPSRkwUaGqR3OdPgg=
X-Gm-Gg: AR+sD10y5bFiUIFI9fExTPq+ecEIs5CXjw3YPbvU2sKo4LeEdh/vm8QKBFr+h+3QnM3
 JuAt+RQqhx+Hfc+DIvKB+QtghNOAn1rqRPKRLFHs5WmPFxQ1fWBNMZhA2X3Arlj0azZRBRBmvci
 xcttQeAKf+wGlmL54FJI0Vcfr/D0YXIYk29kpWDGXk+wF1O7MLpZ/9GYr571YHakKUaboAkrxJb
 c6VP+DlfLTkM7Q5q9mmWuJ+BaaTPiQPsPQXLypOc7uyXUuPsUMHGAW/E22zTWXayMQg97klxdLd
 z6qvdbIzNX7SaSBozmtjxqxNiaQUB59BvZeNH593CbljyNIZKiBQe/UVga7hJ+4/ov7G0OvevZ2
 F4mxtZ5aTCSwdBO6mq3eDsihDMNNbzUM/ZGiSJruV9aVs2Bh7T3Uzk17XTxilhF5lTdog9/g/4J
 J1q+I=
X-Received: by 2002:a05:600c:848e:b0:499:8156:cd3f with SMTP id
 5b1f17b1804b1-4999fb3f78bmr8066995e9.8.1786976164776; 
 Mon, 17 Aug 2026 07:16:04 -0700 (PDT)
X-Received: by 2002:a05:600c:848e:b0:499:8156:cd3f with SMTP id
 5b1f17b1804b1-4999fb3f78bmr8059985e9.8.1786976161723; 
 Mon, 17 Aug 2026 07:16:01 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b7834dsm4022289f8f.28.2026.08.17.07.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 07:16:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 1/2] rust: pl011: switch from bilge to bitfield-struct
Date: Mon, 17 Aug 2026 16:15:58 +0200
Message-ID: <20260817141559.940844-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817141559.940844-1-pbonzini@redhat.com>
References: <20260817141559.940844-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qzKnU5Df5tCsZzNgjKSByKjBtT5-rWHB2WzJHtJ4Sv4_1786976166
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The bilge crate is heavily reliant on traits and, because trait functions
are never const, bilge and const mix about as well as water and oil.
In addition, it has support for the zerocopy crate that only works for an
older version, and is hard to update because the implementation doesn't
like that zerocopy::FromBits and bilge::FromBits are the same name.
zerocopy is definitely something that QEMU could use in the future.

The bitfield-struct crate, instead, is built from the ground up to
support const.  Its use is pretty much the same (device code does not
change at all, only register declarations do), with some things being
more verbose and others being simpler.  The code for the crate itself
is much smaller, too.

It does have two disadvantages: it does not let you annotate enums
as bitfields, and it does not integrate with arbitrary-int.  Thus, it
requires manual size annotations for anything that is not a bool, iNN
or uNN.  Lack of support for arbitrary-int is a very small deal, while
enums are a bit more annoying because they require some repetition
and an implementation of two functions from_bits() and into_bits().
However, the latter is already provided by the "bits!"  and
"#[derive(common::TryInto)]" utilities, and thus is not manual
in QEMU's case.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Cargo.lock                               |  14 ++-
 Cargo.toml                               |   1 +
 rust/hw/char/pl011/Cargo.toml            |   3 +-
 rust/hw/char/pl011/src/registers.rs      | 108 +++++++++++------------
 scripts/archive-source.sh                |   1 +
 scripts/make-release                     |   1 +
 subprojects/.gitignore                   |   1 +
 subprojects/bitfield-struct-0.13-rs.wrap |   6 ++
 8 files changed, 75 insertions(+), 60 deletions(-)
 create mode 100644 subprojects/bitfield-struct-0.13-rs.wrap

diff --git a/Cargo.lock b/Cargo.lock
index 66f684098d3..6f683e8bb1e 100644
--- a/Cargo.lock
+++ b/Cargo.lock
@@ -24,6 +24,17 @@ dependencies = [
  "syn",
 ]
 
+[[package]]
+name = "bitfield-struct"
+version = "0.13.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3ca6739863c590881f038d033a146c51ddae239186a4327014839fd864f44ed5"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
 [[package]]
 name = "bilge"
 version = "0.2.0"
@@ -243,8 +254,7 @@ checksum = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 name = "pl011"
 version = "0.1.0"
 dependencies = [
- "bilge",
- "bilge-impl",
+ "bitfield-struct",
  "bits",
  "bql",
  "chardev",
diff --git a/Cargo.toml b/Cargo.toml
index 0566850ecef..b35704faabe 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -101,5 +101,6 @@ used_underscore_binding = "deny"
 #wildcard_imports = "deny"   # still have many bindings::* imports
 
 # these may have false positives
+enum_variant_names = "allow"
 #option_if_let_else = "deny"
 cognitive_complexity = "deny"
diff --git a/rust/hw/char/pl011/Cargo.toml b/rust/hw/char/pl011/Cargo.toml
index 5b319455ee3..d303c241e4f 100644
--- a/rust/hw/char/pl011/Cargo.toml
+++ b/rust/hw/char/pl011/Cargo.toml
@@ -14,8 +14,7 @@ rust-version.workspace = true
 
 [dependencies]
 glib-sys.workspace = true
-bilge = { version = "0.2.0" }
-bilge-impl = { version = "0.2.0" }
+bitfield-struct = { version = "0.13" }
 bits = { path = "../../../bits" }
 common = { path = "../../../common" }
 util = { path = "../../../util" }
diff --git a/rust/hw/char/pl011/src/registers.rs b/rust/hw/char/pl011/src/registers.rs
index fa572811b29..a8ab8ad93dc 100644
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
-use migration::{impl_vmstate_bitsized, impl_vmstate_forward};
+use migration::impl_vmstate_forward;
 
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
+#[derive(Clone, Copy, Debug, Eq, PartialEq, common::TryInto)]
 pub enum Parity {
     Odd = 0,
     Even = 1,
 }
 
-#[bitsize(1)]
-#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+#[repr(u8)]
+#[derive(Clone, Copy, Debug, Eq, PartialEq, common::TryInto)]
 /// `FEN` "Enable FIFOs" or Device mode, field of [Line Control
 /// register](LineControl).
 pub enum Mode {
@@ -253,8 +251,8 @@ pub enum Mode {
     FIFO = 1,
 }
 
-#[bitsize(2)]
-#[derive(Clone, Copy, Debug, Eq, FromBits, PartialEq)]
+#[repr(u8)]
+#[derive(Clone, Copy, Debug, Eq, PartialEq, common::TryInto)]
 #[allow(clippy::enum_variant_names)]
 /// `WLEN` Word length, field of [Line Control register](LineControl).
 ///
@@ -276,9 +274,8 @@ pub enum WordLength {
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
@@ -286,9 +283,10 @@ pub struct Control {
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
@@ -310,21 +308,19 @@ pub struct Control {
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
 
diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index a37acab524e..5d52644df9c 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -34,6 +34,7 @@ subprojects=(
   berkeley-testfloat-3
   bilge-0.2-rs
   bilge-impl-0.2-rs
+  bitfield-0.9-rs
   either-1-rs
   foreign-0.3-rs
   glib-sys-0.21-rs
diff --git a/scripts/make-release b/scripts/make-release
index 5f54b0e7939..fc0dc4bceb8 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -42,6 +42,7 @@ fi
 SUBPROJECTS="libvfio-user keycodemapdb berkeley-softfloat-3
   berkeley-testfloat-3 anyhow-1-rs arbitrary-int-1-rs attrs-0.2-rs bilge-0.2-rs
   bilge-impl-0.2-rs either-1-rs foreign-0.3-rs itertools-0.11-rs
+  bilge-impl-0.2-rs bitfield-0.9-rs either-1-rs foreign-0.3-rs itertools-0.11-rs
   libc-0.2-rs probe-0.5-rs proc-macro2-1-rs
   proc-macro-error-1-rs proc-macro-error-attr-1-rs quote-1-rs
   syn-2-rs unicode-ident-1-rs"
diff --git a/subprojects/.gitignore b/subprojects/.gitignore
index 011ce4dc3b7..984f5865dc8 100644
--- a/subprojects/.gitignore
+++ b/subprojects/.gitignore
@@ -11,6 +11,7 @@
 /attrs-*
 /bilge-*
 /bilge-impl-*
+/bitfield-struct-*
 /either-*
 /foreign-*
 /glib-sys-*
diff --git a/subprojects/bitfield-struct-0.13-rs.wrap b/subprojects/bitfield-struct-0.13-rs.wrap
new file mode 100644
index 00000000000..dcffe0abd83
--- /dev/null
+++ b/subprojects/bitfield-struct-0.13-rs.wrap
@@ -0,0 +1,6 @@
+[wrap-file]
+directory = bitfield-struct-0.13.0
+source_url = https://crates.io/api/v1/crates/bitfield-struct/0.13.0/download
+source_filename = bitfield-struct-0.13.0.tar.gz
+source_hash = 3ca6739863c590881f038d033a146c51ddae239186a4327014839fd864f44ed5
+method = cargo
-- 
2.55.0


