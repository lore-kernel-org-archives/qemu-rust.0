Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLmtX-0006qc-C9
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 12:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtT-0006nl-Cv
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtQ-0006ny-Gi
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734024147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHVqWO/pCUdfAOY6uDFnWMq+tGNU/At5wYKHm8JQJsI=;
 b=C+3cDWglP0RBrcwPChZHfKhsTaoDpHBPMgArL0FAXhZ0jJgS77jHdmxGexzOpd63lenIhl
 dDEgNyvpMuAEW4T+pcyzLireEefI4C+LWEygQPKdQb88S+fFyXbqL+lq8H7gCcOYNDVkHt
 x8/5Y0N2lT1HtxigPCML3jWUwRj2VxE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-8HiDPGFwO06DRZmZvPyRrg-1; Thu, 12 Dec 2024 12:22:26 -0500
X-MC-Unique: 8HiDPGFwO06DRZmZvPyRrg-1
X-Mimecast-MFC-AGG-ID: 8HiDPGFwO06DRZmZvPyRrg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43582d49dacso7949935e9.2
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 09:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734024145; x=1734628945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHVqWO/pCUdfAOY6uDFnWMq+tGNU/At5wYKHm8JQJsI=;
 b=lTEI7vcVHR9oEuw0TpXS25KKZrtaBr0DMEyrKa6QAhVjf2rV3ejAz7rVlzlcWC4rR4
 wrKzADq/Qx6eZVkiiBAspXs9cgL9pMm3hTRRmnp1TDQP9wJ54fqquGb37hxWg1uu75TW
 6BzpN87xEGQe1zcyXVReEmTUMu8aSqhSvXTCuQhPxImwKR6pEZa4GfZN0GjccOpHBaO1
 2R+jCezp3+Xs0kBNodfyC/MF2FO+TF1m2UsZ3vQXr3Ijwu6ipYXAjPoaJbxn/MjKq2Gk
 IZakh5sKgh71v32BTzAe298ZkUHu3+X8/d+GVxW7W7LB3GeFgePfSMofBIQNZYk5fSbx
 bb5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZqP51XcFaiNSrAGBmw7yy16XmrJoPJxvQTV4FpspsYYqddW+AIYbgZMK94b0M9o2DtC+XC2tUurs=@nongnu.org
X-Gm-Message-State: AOJu0YwRNTVyjVkLS1wiGNDAZ58mt/tnq3TK5+oi77XDo+xcWrdog+NO
 ayGrDIC+wMWXLqeugQ3Rh/BSsSqxsvqqTrL501pGPFod7AhL0IB2z+uqU5enDhBa7qYWST4V7G+
 LT1nYDLBraxVkJd873jMSnL/N9W63HxkyL5/XRnxiPEYcDQgXd7WfZ5TSoug=
X-Gm-Gg: ASbGncstzp7u4dwWhJmRgFf8N9qs3O1cpEtkgUC6eR5oCXiBc5SZyNUhxb+z3O4ixuV
 3vlLfn0owMTL/fjwZDXtu3KCQG35+l4leoxtsn0AQez2jvW3CkMDOHaYV811pvBpW6k+hsXg5zu
 ei2GaQ3AhVxHbnqE6f/HqSzX6ac4s/2duYQVeUT6O94MYrc8vsMccdh9CksPwyWhW/5l2IFwJSD
 QsdRgkCzpV/m7O8px5qAZAM1FKNNImRBj9EJQyfCdTzhxWCc0Ssk+uosvlO
X-Received: by 2002:a05:600c:4e49:b0:434:edcf:7474 with SMTP id
 5b1f17b1804b1-43622883cd8mr37848585e9.33.1734024145042; 
 Thu, 12 Dec 2024 09:22:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPtuQ9i7Q5Wttof82EifUn50vzbZkbe6+LFSMkXywkQw18sj1mp8gRfekBMl6pkeLXWAnpZg==
X-Received: by 2002:a05:600c:4e49:b0:434:edcf:7474 with SMTP id
 5b1f17b1804b1-43622883cd8mr37848415e9.33.1734024144601; 
 Thu, 12 Dec 2024 09:22:24 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362557c6c2sm22187865e9.16.2024.12.12.09.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 09:22:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 5/7] rust: pl011: extend registers to 32 bits
Date: Thu, 12 Dec 2024 18:22:02 +0100
Message-ID: <20241212172209.533779-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212172209.533779-1-pbonzini@redhat.com>
References: <20241212172209.533779-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YiwWhW58_mLQ9jJlFIT-jFYnMkRwhFUX_aQUKP3vVxk_1734024146
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
X-List-Received-Date: Thu, 12 Dec 2024 17:22:32 -0000

The PL011 Technical Reference Manual lists the "real" size of the
registers in table 3-1, and only rounds up to the next byte when
describing the registers; for example, UARTDR is listed as having
width 12/8 (12 bits read, 8 written) and only bits 15:0 are listed
in "Table 3-2 UARTDR Register".

However, in practice these are 32-bit registers, accessible only
through 32-bit MMIO accesses; preserving the fiction that they're
smaller introduces multiple casts (to go from the bilge bitfield
type to e.g u16 to u64) and more importantly it breaks the
migration stream (though only on big-endian machines) because
the Rust vmstate macros are not yet type safe.

So, just make everything 32-bits wide.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 36 ++++++++++++++------------------
 rust/hw/char/pl011/src/lib.rs    | 23 +++++++++-----------
 2 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index e88ea24b00e..332e0a31a82 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -190,10 +190,10 @@ unsafe fn init(&mut self) {
     pub fn read(&mut self, offset: hwaddr, _size: c_uint) -> std::ops::ControlFlow<u64, u64> {
         use RegisterOffset::*;
 
-        std::ops::ControlFlow::Break(match RegisterOffset::try_from(offset) {
+        let value = match RegisterOffset::try_from(offset) {
             Err(v) if (0x3f8..0x400).contains(&(v >> 2)) => {
                 let device_id = self.get_class().device_id;
-                u64::from(device_id[(offset - 0xfe0) >> 2])
+                u32::from(device_id[(offset - 0xfe0) >> 2])
             }
             Err(_) => {
                 // qemu_log_mask(LOG_GUEST_ERROR, "pl011_read: Bad offset 0x%x\n", (int)offset);
@@ -219,27 +219,25 @@ pub fn read(&mut self, offset: hwaddr, _size: c_uint) -> std::ops::ControlFlow<u
                 let c = u32::from(c);
                 return std::ops::ControlFlow::Continue(u64::from(c));
             }
-            Ok(RSR) => u8::from(self.receive_status_error_clear).into(),
-            Ok(FR) => u16::from(self.flags).into(),
-            Ok(FBRD) => self.fbrd.into(),
-            Ok(ILPR) => self.ilpr.into(),
-            Ok(IBRD) => self.ibrd.into(),
-            Ok(LCR_H) => u16::from(self.line_control).into(),
-            Ok(CR) => {
-                // We exercise our self-control.
-                u16::from(self.control).into()
-            }
-            Ok(FLS) => self.ifl.into(),
-            Ok(IMSC) => self.int_enabled.into(),
-            Ok(RIS) => self.int_level.into(),
-            Ok(MIS) => u64::from(self.int_level & self.int_enabled),
+            Ok(RSR) => u32::from(self.receive_status_error_clear),
+            Ok(FR) => u32::from(self.flags),
+            Ok(FBRD) => self.fbrd,
+            Ok(ILPR) => self.ilpr,
+            Ok(IBRD) => self.ibrd,
+            Ok(LCR_H) => u32::from(self.line_control),
+            Ok(CR) => u32::from(self.control),
+            Ok(FLS) => self.ifl,
+            Ok(IMSC) => self.int_enabled,
+            Ok(RIS) => self.int_level,
+            Ok(MIS) => self.int_level & self.int_enabled,
             Ok(ICR) => {
                 // "The UARTICR Register is the interrupt clear register and is write-only"
                 // Source: ARM DDI 0183G 3.3.13 Interrupt Clear Register, UARTICR
                 0
             }
-            Ok(DMACR) => self.dmacr.into(),
-        })
+            Ok(DMACR) => self.dmacr,
+        };
+        std::ops::ControlFlow::Break(value.into())
     }
 
     pub fn write(&mut self, offset: hwaddr, value: u64) {
@@ -281,7 +279,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
                 self.fbrd = value;
             }
             Ok(LCR_H) => {
-                let value = value as u16;
                 let new_val: registers::LineControl = value.into();
                 // Reset the FIFO state on FIFO enable or disable
                 if bool::from(self.line_control.fifos_enabled())
@@ -308,7 +305,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
             }
             Ok(CR) => {
                 // ??? Need to implement the enable bit.
-                let value = value as u16;
                 self.control = value.into();
                 self.loopback_mdmctrl();
             }
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index 463ae60543b..0747e130cae 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -131,12 +131,6 @@ const fn _assert_exhaustive(val: RegisterOffset) {
 pub mod registers {
     //! Device registers exposed as typed structs which are backed by arbitrary
     //! integer bitmaps. [`Data`], [`Control`], [`LineControl`], etc.
-    //!
-    //! All PL011 registers are essentially 32-bit wide, but are typed here as
-    //! bitmaps with only the necessary width. That is, if a struct bitmap
-    //! in this module is for example 16 bits long, it should be conceived
-    //! as a 32-bit register where the unmentioned higher bits are always
-    //! unused thus treated as zero when read or written.
     use bilge::prelude::*;
 
     /// Receive Status Register / Data Register common error bits
@@ -234,10 +228,11 @@ impl Data {
     /// # Source
     /// ARM DDI 0183G 3.3.2 Receive Status Register/Error Clear Register,
     /// UARTRSR/UARTECR
-    #[bitsize(8)]
+    #[bitsize(32)]
     #[derive(Clone, Copy, DebugBits, FromBits)]
     pub struct ReceiveStatusErrorClear {
         pub errors: Errors,
+        _reserved_unpredictable: u24,
     }
 
     impl ReceiveStatusErrorClear {
@@ -257,7 +252,7 @@ fn default() -> Self {
         }
     }
 
-    #[bitsize(16)]
+    #[bitsize(32)]
     #[derive(Clone, Copy, DebugBits, FromBits)]
     /// Flag Register, `UARTFR`
     #[doc(alias = "UARTFR")]
@@ -309,7 +304,7 @@ pub struct Flags {
         pub transmit_fifo_empty: bool,
         /// `RI`, is `true` when `nUARTRI` is `LOW`.
         pub ring_indicator: bool,
-        _reserved_zero_no_modify: u7,
+        _reserved_zero_no_modify: u23,
     }
 
     impl Flags {
@@ -328,7 +323,7 @@ fn default() -> Self {
         }
     }
 
-    #[bitsize(16)]
+    #[bitsize(32)]
     #[derive(Clone, Copy, DebugBits, FromBits)]
     /// Line Control Register, `UARTLCR_H`
     #[doc(alias = "UARTLCR_H")]
@@ -382,8 +377,8 @@ pub struct LineControl {
         /// the PEN bit disables parity checking and generation. See Table 3-11
         /// on page 3-14 for the parity truth table.
         pub sticky_parity: bool,
-        /// 15:8 - Reserved, do not modify, read as zero.
-        _reserved_zero_no_modify: u8,
+        /// 31:8 - Reserved, do not modify, read as zero.
+        _reserved_zero_no_modify: u24,
     }
 
     impl LineControl {
@@ -454,7 +449,7 @@ pub enum WordLength {
     ///
     /// # Source
     /// ARM DDI 0183G, 3.3.8 Control Register, `UARTCR`, Table 3-12
-    #[bitsize(16)]
+    #[bitsize(32)]
     #[doc(alias = "UARTCR")]
     #[derive(Clone, Copy, DebugBits, FromBits)]
     pub struct Control {
@@ -532,6 +527,8 @@ pub struct Control {
         /// CTS hardware flow control is enabled. Data is only transmitted when
         /// the `nUARTCTS` signal is asserted.
         pub cts_hardware_flow_control_enable: bool,
+        /// 31:16 - Reserved, do not modify, read as zero.
+        _reserved_zero_no_modify2: u16,
     }
 
     impl Control {
-- 
2.47.1


