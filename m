Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd4E-0006bE-3I
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1s-0004Ac-Ij
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1q-0007ZW-AY
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJRarGtTvkM8QsI1PbQS6ZxbhzzviSf81sTcl05pEiA=;
 b=ViFdAUraVq3w4Ls3uaxPWJ3slqta3EtN6GsQfJxDRaDV/jB6n8hTKMdFIroMprx4P1AVFG
 TSfttEmAc9HyRQFicbpIevARNf8sQDCz4jj81IzKg66T8LY8VBHDqoZGFwiMPPDTkZmmUq
 7gx+GMhNfEENT1/3zBVJj9OCrNSbj2Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-Mw10B3DQMBmTzQDyOHx2EA-1; Mon, 09 Dec 2024 07:38:20 -0500
X-MC-Unique: Mw10B3DQMBmTzQDyOHx2EA-1
X-Mimecast-MFC-AGG-ID: Mw10B3DQMBmTzQDyOHx2EA
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3862be3bfc9so1607146f8f.3
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747899; x=1734352699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJRarGtTvkM8QsI1PbQS6ZxbhzzviSf81sTcl05pEiA=;
 b=nqDXd43yNV5ej8ZpRfmMcq8tT7iB7EpgzH+ERm4R+nZEDjbtpM2mpIrLdIOJnJl5xZ
 vDgJiwUbR9ySDCxFr99r93Z1/KGpbyN7foXZ+Y6A460klaS9gwHwnNnCmR7dEVpH7r/C
 64aTWDV4qliaLT+anMjzo+8BHIXQ6nbdvG/QzzYk9bckL9U9BE5b0wvdsk34j/LAWqTa
 HgUizXjqZ8Hb2HGPZP2KKpL4reacUS4ntSjJqdo2jOosQhvMwfaESH+MlBEFwL6xXYye
 1AVRFYY7EH/m5RNs2rgu00bescn0REFNhnsKQ0fMH0TRjhTANbNeU3Ac7Nx1naf9w6cy
 qEhg==
X-Gm-Message-State: AOJu0Yzv+viQacF/w8D2wrqePdJkK2Z1f7ILnatmhWBjqWqWL/4t4UBX
 G6pzcBbmulBnEmqZ6dkTjGaQbqSNPNmUj/663urIEtOlZSS0c8Ntc0B62ZYCxi+aanoi9HNjhzi
 RIH1MznDyg5HrNGWlqLleOWQkluKgSme24XoJYG/eSRdRlhfvusM=
X-Gm-Gg: ASbGncuwLr8NwOHWfb6VWDDeoNaAwVTa/plRaSD2q5HY/vwnmDS7ryVCjg8aTB3+Uhy
 aH9kmOGLx95PT322rRMtV6J4JmcDGATiyNsJoJyJBWwlpvvscsfO/ueu9wJgTzZp8epUCqemLH3
 MnCf1YiMrLY2BUykRHcwr7lwDU5qAojg5DW/FbFjkDSaD4N0QWbR7suhDwciw1aRtf+6G5RGhK6
 JK0SUdLrDk3mi81/6b41b6gc25jN/vPfhJNU6Wh/b/0ExVj0YHPgw==
X-Received: by 2002:a5d:5f8f:0:b0:385:de67:228d with SMTP id
 ffacd0b85a97d-3862b36ccf8mr7497012f8f.21.1733747899184; 
 Mon, 09 Dec 2024 04:38:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAabb6hI6BtQ2yeCXBE0/4aE5JAUvqsTI5unR0FhR44d+JwapLUBECB3/0yAJ2JG752BWjCw==
X-Received: by 2002:a5d:5f8f:0:b0:385:de67:228d with SMTP id
 ffacd0b85a97d-3862b36ccf8mr7497006f8f.21.1733747898823; 
 Mon, 09 Dec 2024 04:38:18 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386219098d3sm13322459f8f.70.2024.12.09.04.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:38:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 24/26] rust: qom: move device_id to PL011 class side
Date: Mon,  9 Dec 2024 13:37:15 +0100
Message-ID: <20241209123717.99077-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: raw1vUEeUlwZVGPJwlTjKMZmNpTaKFIUP63eQ_4rltU_1733747899
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 09 Dec 2024 12:38:32 -0000

There is no need to monkeypatch DeviceId::Luminary into the already-initialized
PL011State.  Instead, now that we can define a class hierarchy, we can define
PL011Class and make device_id a field in there.

There is also no need anymore to have "Arm" as zero, so change DeviceId into a
wrapper for the array; all it does is provide an Index<hwaddr> implementation
because arrays can only be indexed by usize.
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 59 +++++++++++++++-----------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index e85d13c5a2b..41220c99a83 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -5,7 +5,7 @@
 use core::ptr::{addr_of_mut, NonNull};
 use std::{
     ffi::CStr,
-    os::raw::{c_int, c_uchar, c_uint, c_void},
+    os::raw::{c_int, c_uint, c_void},
 };
 
 use qemu_api::{
@@ -14,7 +14,7 @@
     irq::InterruptSource,
     prelude::*,
     qdev::DeviceImpl,
-    qom::ObjectImpl,
+    qom::{ClassInitImpl, ObjectImpl},
 };
 
 use crate::{
@@ -35,27 +35,20 @@
 /// QEMU sourced constant.
 pub const PL011_FIFO_DEPTH: usize = 16_usize;
 
-#[derive(Clone, Copy, Debug)]
-enum DeviceId {
-    #[allow(dead_code)]
-    Arm = 0,
-    Luminary,
-}
+#[derive(Clone, Copy)]
+struct DeviceId(&'static [u8; 8]);
 
 impl std::ops::Index<hwaddr> for DeviceId {
-    type Output = c_uchar;
+    type Output = u8;
 
     fn index(&self, idx: hwaddr) -> &Self::Output {
-        match self {
-            Self::Arm => &Self::PL011_ID_ARM[idx as usize],
-            Self::Luminary => &Self::PL011_ID_LUMINARY[idx as usize],
-        }
+        &self.0[idx as usize]
     }
 }
 
 impl DeviceId {
-    const PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
-    const PL011_ID_LUMINARY: [c_uchar; 8] = [0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1];
+    const ARM: Self = Self(&[0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1]);
+    const LUMINARY: Self = Self(&[0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1]);
 }
 
 #[repr(C)]
@@ -102,17 +95,28 @@ pub struct PL011State {
     pub clock: NonNull<Clock>,
     #[doc(alias = "migrate_clk")]
     pub migrate_clock: bool,
-    /// The byte string that identifies the device.
-    device_id: DeviceId,
 }
 
 qom_isa!(PL011State : SysBusDevice, DeviceState, Object);
 
+pub struct PL011Class {
+    parent_class: <SysBusDevice as ObjectType>::Class,
+    /// The byte string that identifies the device.
+    device_id: DeviceId,
+}
+
 unsafe impl ObjectType for PL011State {
-    type Class = <SysBusDevice as ObjectType>::Class;
+    type Class = PL011Class;
     const TYPE_NAME: &'static CStr = crate::TYPE_PL011;
 }
 
+impl ClassInitImpl<PL011Class> for PL011State {
+    fn class_init(klass: &mut PL011Class) {
+        klass.device_id = DeviceId::ARM;
+        <Self as ClassInitImpl<SysBusDeviceClass>>::class_init(&mut klass.parent_class);
+    }
+}
+
 impl ObjectImpl for PL011State {
     type ParentType = SysBusDevice;
 
@@ -190,7 +194,8 @@ pub fn read(&mut self, offset: hwaddr, _size: c_uint) -> std::ops::ControlFlow<u
 
         std::ops::ControlFlow::Break(match RegisterOffset::try_from(offset) {
             Err(v) if (0x3f8..0x400).contains(&(v >> 2)) => {
-                u64::from(self.device_id[(offset - 0xfe0) >> 2])
+                let device_id = self.get_class().device_id;
+                u64::from(device_id[(offset - 0xfe0) >> 2])
             }
             Err(_) => {
                 // qemu_log_mask(LOG_GUEST_ERROR, "pl011_read: Bad offset 0x%x\n", (int)offset);
@@ -621,16 +626,10 @@ pub struct PL011Luminary {
     parent_obj: PL011State,
 }
 
-impl PL011Luminary {
-    /// Initializes a pre-allocated, unitialized instance of `PL011Luminary`.
-    ///
-    /// # Safety
-    ///
-    /// We expect the FFI user of this function to pass a valid pointer, that
-    /// has the same size as [`PL011Luminary`]. We also expect the device is
-    /// readable/writeable from one thread at any time.
-    unsafe fn init(&mut self) {
-        self.parent_obj.device_id = DeviceId::Luminary;
+impl ClassInitImpl<PL011Class> for PL011Luminary {
+    fn class_init(klass: &mut PL011Class) {
+        klass.device_id = DeviceId::LUMINARY;
+        <Self as ClassInitImpl<SysBusDeviceClass>>::class_init(&mut klass.parent_class);
     }
 }
 
@@ -643,8 +642,6 @@ unsafe impl ObjectType for PL011Luminary {
 
 impl ObjectImpl for PL011Luminary {
     type ParentType = PL011State;
-
-    const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
 }
 
 impl DeviceImpl for PL011Luminary {}
-- 
2.47.1


