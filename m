Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLmtc-0006ss-7R
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 12:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtX-0006qt-Uj
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLmtN-0006nW-OU
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 12:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734024145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6V2KCGpKcKJaSNdx7ZIwr1bDMF8vYPd7y6l/A6UdOQ=;
 b=gfJOTrKTl2xzv5OCWLmeT6Itv/hHJh7gDKHvtpOUx+AUdhlwkzkGohfCbdYB2MXXqEUhbu
 BZkqIjdz8rxnf18Z5RRWZral+kN94fd+tp/QLqU774o1s9EKvSx7/8/6OqsMZltERD0ClP
 zFuWK4UYFZmBx4vXu3mmkO5YySkC/Gk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-gl_SdvxkPLSWNQp8rcAwjA-1; Thu, 12 Dec 2024 12:22:23 -0500
X-MC-Unique: gl_SdvxkPLSWNQp8rcAwjA-1
X-Mimecast-MFC-AGG-ID: gl_SdvxkPLSWNQp8rcAwjA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4362153dcd6so5430845e9.2
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 09:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734024141; x=1734628941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6V2KCGpKcKJaSNdx7ZIwr1bDMF8vYPd7y6l/A6UdOQ=;
 b=IRuz1jYbn1Urwu/+wxVwXjTvgCVMcNE9qO3ZGGaASAkLofxG6u6PVWYFz/lMC1B+Yb
 APfzshM4U28LR+eNvuA5tPZdYWvBxolQitnMe3YMlrDg5EoEfv9wifJh8LH8Equuey7g
 BIVfpdi7ZNymg84aq/+GktygHlj6zJuEAJnxbspv1go1DuwdMy4ABFqV3FbBNg2o9Q1g
 NpGq1RnVxJTUj9jAJhWRn7o2KoRfSy+VHiKEjsTQYqFqF5M0zvXFXvXCuYwLw/Kxtguy
 Uzh3BpLHUpPpRBo/oNOkMiIhmX2kG6PTsOXhS0bkz9ETYyvQAv70gn2YdVPQcB51s/Pr
 iT5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGRq5b/fXoTNIPXGUKijHaBK9Xk4T8d0Daq8x9lhceD+1JI8Ehs5D3mm+zbSKhGdMa3RXNnI4lT+M=@nongnu.org
X-Gm-Message-State: AOJu0Yxjpk0ptZ4BbfhkrkuNgbx/d+iK1TmrsvpMljDUOizFMWajqZw1
 KaXVgUMnhfREleHGw5a0K50xcgkBs9/0MddfB7AbK1bjOUcGgw7SXndBMZTDuyp353Qg9fUCLn3
 PD+cXI9dbnzOuaf5P1cSxtI5UviHuehkjCNgSYMViIro3fHmkWrBvYJ6nHnU=
X-Gm-Gg: ASbGncvdiESRf7dsUqVgJmBJ/vQGx4choCAep6uvG7zbDt5jGeIHWPJHMFl3D7qGkJl
 n/OAB8w5wxfSUYT4xANwIBz1NGMadjyr9oAKojVx21saYuMj8yns1nPg5a1f+pGnzngAhMP7iNO
 wJMvt7FVzxhRVVSS7rGQpBV1GAe5RYnzsT8vlbdCboxLtQj9PvQuJfrUpfTaiqdwQ3Huzw0YclY
 wvpkWLeHbzEtHkITI4BFWRmUZP1s+KXrtPm2syoSqEtHSGoVBoJLdNsZVQI
X-Received: by 2002:a05:600c:1d1d:b0:434:f335:83b with SMTP id
 5b1f17b1804b1-4361c344549mr61038405e9.5.1734024140996; 
 Thu, 12 Dec 2024 09:22:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5LiWj4pWCKznuzLNsiEJ08jd8fnoongVHTt0lL4NL6k4DsTSN6lkBCvK1s8BBcFEyk6kyTg==
X-Received: by 2002:a05:600c:1d1d:b0:434:f335:83b with SMTP id
 5b1f17b1804b1-4361c344549mr61038215e9.5.1734024140569; 
 Thu, 12 Dec 2024 09:22:20 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436255531fdsm22664625e9.2.2024.12.12.09.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 09:22:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 4/7] rust: pl011: fix break errors and definition of Data
 struct
Date: Thu, 12 Dec 2024 18:22:01 +0100
Message-ID: <20241212172209.533779-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212172209.533779-1-pbonzini@redhat.com>
References: <20241212172209.533779-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p9QwTOfjpBt3EBgGpCdh2I2UYShrc4J6RJ6BvQrnm40_1734024142
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
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Dec 2024 17:22:37 -0000

The Data struct is wrong, and does not show how bits 8-15 of DR
are the receive status.  Fix it, and use it to fix break
errors ("c >> 8" in the C code does not translate to
"c.to_be_bytes()[3]").

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 15 ++++++------
 rust/hw/char/pl011/src/lib.rs    | 41 ++++++++++++++++++++++----------
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index eb15e9d5788..e88ea24b00e 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -30,8 +30,6 @@
 /// Fractional Baud Rate Divider, `UARTFBRD`
 const FBRD_MASK: u32 = 0x3f;
 
-const DATA_BREAK: u32 = 1 << 10;
-
 /// QEMU sourced constant.
 pub const PL011_FIFO_DEPTH: usize = 16_usize;
 
@@ -68,7 +66,7 @@ pub struct PL011State {
     pub dmacr: u32,
     pub int_enabled: u32,
     pub int_level: u32,
-    pub read_fifo: [u32; PL011_FIFO_DEPTH],
+    pub read_fifo: [registers::Data; PL011_FIFO_DEPTH],
     pub ilpr: u32,
     pub ibrd: u32,
     pub fbrd: u32,
@@ -215,10 +213,11 @@ pub fn read(&mut self, offset: hwaddr, _size: c_uint) -> std::ops::ControlFlow<u
                     self.int_level &= !registers::INT_RX;
                 }
                 // Update error bits.
-                self.receive_status_error_clear = c.to_be_bytes()[3].into();
+                self.receive_status_error_clear.set_from_data(c);
                 self.update();
                 // Must call qemu_chr_fe_accept_input, so return Continue:
-                return std::ops::ControlFlow::Continue(c.into());
+                let c = u32::from(c);
+                return std::ops::ControlFlow::Continue(u64::from(c));
             }
             Ok(RSR) => u8::from(self.receive_status_error_clear).into(),
             Ok(FR) => u16::from(self.flags).into(),
@@ -411,7 +410,7 @@ fn loopback_mdmctrl(&mut self) {
 
     fn loopback_break(&mut self, enable: bool) {
         if enable {
-            self.loopback_tx(DATA_BREAK);
+            self.loopback_tx(registers::Data::BREAK.into());
         }
     }
 
@@ -475,7 +474,7 @@ pub fn can_receive(&self) -> bool {
 
     pub fn event(&mut self, event: QEMUChrEvent) {
         if event == bindings::QEMUChrEvent::CHR_EVENT_BREAK && !self.loopback_enabled() {
-            self.put_fifo(DATA_BREAK);
+            self.put_fifo(registers::Data::BREAK.into());
         }
     }
 
@@ -502,7 +501,7 @@ pub fn put_fifo(&mut self, value: c_uint) {
         let depth = self.fifo_depth();
         assert!(depth > 0);
         let slot = (self.read_pos + self.read_count) & (depth - 1);
-        self.read_fifo[slot] = value;
+        self.read_fifo[slot] = registers::Data::from(value);
         self.read_count += 1;
         self.flags.set_receive_fifo_empty(false);
         if self.read_count == depth {
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index e3eacb0e6b9..463ae60543b 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -139,6 +139,21 @@ pub mod registers {
     //! unused thus treated as zero when read or written.
     use bilge::prelude::*;
 
+    /// Receive Status Register / Data Register common error bits
+    ///
+    /// The `UARTRSR` register is updated only when a read occurs
+    /// from the `UARTDR` register with the same status information
+    /// that can also be obtained by reading the `UARTDR` register
+    #[bitsize(8)]
+    #[derive(Clone, Copy, Default, DebugBits, FromBits)]
+    pub struct Errors {
+        pub framing_error: bool,
+        pub parity_error: bool,
+        pub break_error: bool,
+        pub overrun_error: bool,
+        _reserved_unpredictable: u4,
+    }
+
     // TODO: FIFO Mode has different semantics
     /// Data Register, `UARTDR`
     ///
@@ -181,16 +196,18 @@ pub mod registers {
     ///
     /// # Source
     /// ARM DDI 0183G 3.3.1 Data Register, UARTDR
-    #[bitsize(16)]
-    #[derive(Clone, Copy, DebugBits, FromBits)]
+    #[bitsize(32)]
+    #[derive(Clone, Copy, Default, DebugBits, FromBits)]
     #[doc(alias = "UARTDR")]
     pub struct Data {
-        _reserved: u4,
         pub data: u8,
-        pub framing_error: bool,
-        pub parity_error: bool,
-        pub break_error: bool,
-        pub overrun_error: bool,
+        pub errors: Errors,
+        _reserved: u16,
+    }
+
+    impl Data {
+        // bilge is not very const-friendly, unfortunately
+        pub const BREAK: Self = Self { value: 1 << 10 };
     }
 
     // TODO: FIFO Mode has different semantics
@@ -220,14 +237,14 @@ pub struct Data {
     #[bitsize(8)]
     #[derive(Clone, Copy, DebugBits, FromBits)]
     pub struct ReceiveStatusErrorClear {
-        pub framing_error: bool,
-        pub parity_error: bool,
-        pub break_error: bool,
-        pub overrun_error: bool,
-        _reserved_unpredictable: u4,
+        pub errors: Errors,
     }
 
     impl ReceiveStatusErrorClear {
+        pub fn set_from_data(&mut self, data: Data) {
+            self.set_errors(data.errors());
+        }
+
         pub fn reset(&mut self) {
             // All the bits are cleared to 0 on reset.
             *self = Self::default();
-- 
2.47.1


